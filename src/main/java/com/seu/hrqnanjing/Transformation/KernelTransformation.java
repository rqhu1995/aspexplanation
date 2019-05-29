package com.seu.hrqnanjing.Transformation;

import com.seu.hrqnanjing.ASPParser.ASPRule;
import com.seu.hrqnanjing.ASPParser.RuleFileParser;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;

/**
 * @program: aspexplanation
 * @description: 增加applicable与blocked
 * @author: RunqiuHu
 * @create: 2019-05-29 09:43
 **/

public class KernelTransformation {
    private String ruleFileName;
    private String ruleFileComplement;
    private HashSet<String> constantTable = new HashSet<>();

    public KernelTransformation(String ruleFileName, String ruleFileComplement) {
        this.ruleFileName = ruleFileName;
        this.ruleFileComplement = ruleFileComplement;
    }

    public void kernelTransform() throws IOException {
        RuleFileParser ruleFileParser = new RuleFileParser(ruleFileName);
        ArrayList<ASPRule> ruleList = ruleFileParser.parsingRule();
        String dummyFactors = dummyAtomGenerator(ruleList).toString();
        FileOutputStream fileOutputStream = new FileOutputStream(new File(ruleFileComplement));
        fileOutputStream.write(dummyFactors.getBytes());
        for (ASPRule rule : ruleList) {
            applicableGenerator(rule);
            blockedGenerator(rule);
        }
    }

    private StringBuffer dummyAtomGenerator(ArrayList<ASPRule> ruleList) {
        StringBuffer dummy = new StringBuffer();
        for (ASPRule rule : ruleList) {
            for (String str : rule.getConstantList()) {
                if (!constantTable.contains(str)) {
                    dummy.append("dummy(").append(str).append(").\n");
                    constantTable.add(str);
                }
            }
        }
        return dummy;
    }

    private void blockedGenerator(ASPRule rule) {
        StringBuffer varComplement = new StringBuffer();
        if(rule.getVarList().size()!=0) {
            for (String var : rule.getVarList()) {
                varComplement.append("var(").append(var).append("),");
            }
            varComplement = new StringBuffer(varComplement.substring(0,varComplement.length()-1));
        }


        StringBuffer blocked = new StringBuffer();
        blocked.append("blocked(")
                .append(rule.getRuleID());
        pubHeadGenerator(rule, blocked);
        blocked.append(" :- ");

        for (Integer i : rule.getPosbody()) {
            StringBuffer posBlocked = new StringBuffer(blocked);
            posBlocked.append("not ")
                    .append(rule.getLiteralReverseMap().get(i))
                    .append(",")
                    .append(varComplement)
                    .append(".")
                    .toString();
            if(posBlocked.length()!=0)
                System.out.println(posBlocked);
        }

        for (Integer i : rule.getNegbody()) {
            StringBuffer negBlocked = new StringBuffer(blocked);
            negBlocked.append(rule.getLiteralReverseMap().get(i))
                    .append(".")
                    .toString();

            if(negBlocked.length()!=0)
                System.out.println(negBlocked);
        }
    }

    private void pubHeadGenerator(ASPRule rule, StringBuffer posBlock) {
        if(rule.getHead().size()!=0){
            posBlock.append(",h(").append(rule.getRuleLiteralByPart("head")).append(")");
        }
        if(rule.getPosbody().size()!=0){
            posBlock.append(",pB(").append(rule.getRuleLiteralByPart("posBody")).append(")");
        }
        if(rule.getNegbody().size()!=0){
            posBlock.append(",nB(").append(rule.getRuleLiteralByPart("negBody").replace("not ", "")).append(")");
        }
    }

    private void applicableGenerator(ASPRule rule) {
        if(rule.getPosbody().size() + rule.getNegbody().size()==0) {
            return ;
        }
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("applicable(").append(rule.getRuleID());
        pubHeadGenerator(rule, stringBuffer);
        stringBuffer.append(") :- ");
        String lit = rule.getRuleLiteralByPart("posBody");
        if (lit.length() != 0)
            stringBuffer.append(lit);
        lit = rule.getRuleLiteralByPart("negBody");
        if (lit.length() != 0)
            stringBuffer.append(",").append(lit);

        stringBuffer.append(".");

        if(stringBuffer.length()!=0)
            System.out.println(stringBuffer);
    }

    public static void main(String[] args) throws IOException {
        KernelTransformation kernelTransformation = new KernelTransformation("rules_raw.lp", "rules_grounded.lp");
        kernelTransformation.kernelTransform();
    }
}
