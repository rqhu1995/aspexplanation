package com.seu.hrqnanjing.Transformation;

import com.seu.hrqnanjing.ASPParser.ASPRule;
import com.seu.hrqnanjing.ASPParser.RuleFileParser;

import java.io.File;
import java.io.FileWriter;
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
    private String ruleComplement;
    private HashSet<String> constantTable = new HashSet<>();

    public KernelTransformation(String ruleFileName, String ruleComplement) throws IOException {
        this.ruleFileName = ruleFileName;
        this.ruleComplement = ruleComplement;
    }

    public void kernelTransform() throws IOException {
        RuleFileParser ruleFileParser = new RuleFileParser(ruleFileName);
        ArrayList<ASPRule> ruleList = ruleFileParser.parsingRule();
        String dummyFactors = dummyAtomGenerator(ruleList).toString();
        FileWriter dummyWriter = new FileWriter(ruleComplement,true);
        dummyWriter.write(dummyFactors);
        dummyWriter.close();

        FileWriter ruleWriter = new FileWriter(ruleFileName,true);
        for (ASPRule rule : ruleList) {
            applicableGenerator(rule, ruleWriter);
            blockedGenerator(rule, ruleWriter);
        }
        ruleWriter.close();
    }

    private StringBuffer dummyAtomGenerator(ArrayList<ASPRule> ruleList) {
        StringBuffer dummy = new StringBuffer();
        for (ASPRule rule : ruleList) {
            for (String str : rule.getConstantList()) {
                if (!constantTable.contains(str)) {
                    dummy.append("var(").append(str).append(").\n");
                    constantTable.add(str);
                }
            }
        }
        return dummy;
    }

    private void blockedGenerator(ASPRule rule, FileWriter ruleWriter) throws IOException {
        StringBuffer blockedRule = new StringBuffer("blocked(").append(rule.getRuleID());
        StringBuffer varComplement = new StringBuffer();
        if (rule.getVarList().size() != 0) {
            for (String var : rule.getVarList()) {
                varComplement.append("var(").append(var).append("),");
            }
            varComplement = new StringBuffer(varComplement.substring(0, varComplement.length() - 1));
        }


        blockedRule.append(pubHeadGenerator(rule))
                .append(") :- ");

        for (Integer i : rule.getPosbody()) {
            StringBuffer posBlocked = new StringBuffer(blockedRule);
            posBlocked.append("not ")
                    .append(rule.getLiteralReverseMap().get(i))
                    .append(",")
                    .append(varComplement)
                    .append(".\n");

            if (posBlocked.length() != 0)
                ruleWriter.write(posBlocked.toString());
        }

        for (Integer i : rule.getNegbody()) {
            StringBuffer negBlocked = new StringBuffer(blockedRule);
            negBlocked.append(rule.getLiteralReverseMap().get(i))
                    .append(".\n")
                    .toString();

            if (negBlocked.length() != 0)
                ruleWriter.write(negBlocked.toString());
        }
    }

    private StringBuffer pubHeadGenerator(ASPRule rule) {
        StringBuffer pubHead = new StringBuffer();
        if (rule.getHead().size() != 0) {
            pubHead.append(",h(").append(rule.getRuleLiteralByPart("head")).append(")");
        }
        if (rule.getPosbody().size() != 0) {
            pubHead.append(",pB(").append(rule.getRuleLiteralByPart("posBody")).append(")");
        }
        if (rule.getNegbody().size() != 0) {
            pubHead.append(",nB(").append(rule.getRuleLiteralByPart("negBody").replace("not ", "")).append(")");
        }
        return pubHead;
    }

    private void applicableGenerator(ASPRule rule, FileWriter ruleWriter) throws IOException {
        if (rule.getPosbody().size() + rule.getNegbody().size() == 0) {
            return;
        }
        StringBuffer applicableRule = new StringBuffer();
        applicableRule.append("applicable(").append(rule.getRuleID()).append(pubHeadGenerator(rule));
        applicableRule.append(") :- ");
        String lit = rule.getRuleLiteralByPart("posBody");
        if (lit.length() != 0)
            applicableRule.append(lit);
        lit = rule.getRuleLiteralByPart("negBody");
        if (lit.length() != 0)
            applicableRule.append(",").append(lit);

        applicableRule.append(".\n");

        if (applicableRule.length() != 0)
            ruleWriter.write(applicableRule.toString());
    }

}
