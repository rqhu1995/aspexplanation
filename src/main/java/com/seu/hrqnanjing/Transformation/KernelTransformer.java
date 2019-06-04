package com.seu.hrqnanjing.Transformation;

import com.seu.hrqnanjing.ASPParser.ASPRule;
import com.seu.hrqnanjing.ASPParser.RuleFileParser;

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

public class KernelTransformer {
    private String ruleFileName;
    private String varFileName;
    private String groundedRuleFileName;
    private HashSet<String> constantTable = new HashSet<>();

    public KernelTransformer(String ruleFileName, String varFileName, String groundedRuleFileName) throws IOException {
        this.ruleFileName = ruleFileName;
        this.varFileName = varFileName;
        this.groundedRuleFileName = groundedRuleFileName;
    }

    private StringBuilder dummyAtomGenerator(ArrayList<ASPRule> ruleList) {
        StringBuilder dummy = new StringBuilder();
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
        StringBuilder blockedRule = new StringBuilder("blocked(").append(rule.getRuleID());
        StringBuilder varComplement = new StringBuilder();
        if (rule.getVarList().size() != 0) {
            for (String var : rule.getVarList()) {
                varComplement.append("var(").append(var).append("),");
            }
            varComplement = new StringBuilder(varComplement.substring(0, varComplement.length() - 1));
        }


        blockedRule.append(pubHeadGenerator(rule))
                .append(") :- ");

        for (Integer i : rule.getPosbody()) {
            StringBuilder posBlocked = new StringBuilder(blockedRule);
            posBlocked.append("not ")
                    .append(rule.getLiteralReverseMap().get(i))
                    .append(",")
                    .append(varComplement)
                    .append(".\n");

            if (posBlocked.length() != 0)
                ruleWriter.write(posBlocked.toString());
        }

        for (Integer i : rule.getNegbody()) {
            StringBuilder negBlocked = new StringBuilder(blockedRule);
            negBlocked.append(rule.getLiteralReverseMap().get(i))
                    .append(",")
                    .append(varComplement)
                    .append(".\n");
            if (negBlocked.length() != 0)
                ruleWriter.write(negBlocked.toString());
        }

        for (String exp : rule.getExpressionTable()) {
            StringBuilder expNeg = new StringBuilder(blockedRule);
            String reverse = "";
            if(exp.contains(">=")){
                reverse = exp.replace(">=", "<");
            }else if(exp.contains("<=")){
                reverse = exp.replace("<=", ">");
            }else if(exp.contains("<")){
                reverse = exp.replace("<", ">=");
            }else if(exp.contains(">")){
                reverse = exp.replace(">", "<=");
            }else if(exp.contains("!=")){
                reverse = exp.replace("!=", "=");
            }else if(exp.contains("=")){
                reverse = exp.replace("=", "!=");
            }
            expNeg.append(reverse)
                    .append(",")
                    .append(varComplement)
                    .append(".\n");

        if (expNeg.length() != 0)
            ruleWriter.write(expNeg.toString());
        }
    }

    private StringBuilder pubHeadGenerator(ASPRule rule) {
        StringBuilder pubHead = new StringBuilder();
        if (rule.getHead().size() != 0) {
            pubHead.append(",h(").append(rule.getRuleLiteralByPart("head")).append(")");
        }
        if (rule.getPosbody().size() != 0) {
            pubHead.append(",pB(").append(rule.getRuleLiteralByPart("posBody")).append(")");
        }
        if (rule.getNegbody().size() != 0) {
            pubHead.append(",nB(").append(rule.getRuleLiteralByPart("negBody").replace("not ", "")).append(")");
        }
        if (rule.getExpressionTable().size() != 0) {
            if(rule.getRuleLiteralByPart("expression").contains("\"")){
                pubHead.append(",exp(\"").append(rule.getRuleLiteralByPart("expression").replace("\"","\\\"")).append("\")");
            }else
            pubHead.append(",exp(\"").append(rule.getRuleLiteralByPart("expression")).append("\")");
        }
        return pubHead;
    }

    private void applicableGenerator(ASPRule rule, FileWriter ruleWriter) throws IOException {
        StringBuilder applicableRule = new StringBuilder();
        applicableRule.append("applicable(").append(rule.getRuleID()).append(pubHeadGenerator(rule).append(")"));
        if(rule.getRuleType()!=2)
            applicableRule.append(":- ");
        String lit = rule.getRuleLiteralByPart("posBody");
        if (lit.length() != 0)
            applicableRule.append(lit);
        lit = rule.getRuleLiteralByPart("negBody");
        if (lit.length() != 0)
            applicableRule.append(",").append(lit);
        lit = rule.getRuleLiteralByPart("expression");
        if (lit.length() != 0)
            applicableRule.append(",").append(lit);
        applicableRule.append(".\n");

        if (applicableRule.length() != 0)
            ruleWriter.write(applicableRule.toString());
    }

    public void kernelTransform() throws IOException, InterruptedException {
        RuleFileParser ruleFileParser = new RuleFileParser(ruleFileName);

        //解析所有规则，获取规则列表[(h,pb,nb),...]
        ArrayList<ASPRule> ruleList = ruleFileParser.parsingRule();

        //为全部domain添加var(domain)，表示var(domain)无条件成立
        String dummyFactors = dummyAtomGenerator(ruleList).toString();
        FileWriter dummyWriter = new FileWriter(varFileName, true);
        dummyWriter.write(dummyFactors);
        dummyWriter.close();

        //每条规则进行Kernel转化（applicable+blocked）
        FileWriter ruleWriter = new FileWriter(ruleFileName, true);
        StringBuilder fact = new StringBuilder();
        for (ASPRule rule : ruleList) {
            applicableGenerator(rule, ruleWriter);
            blockedGenerator(rule, ruleWriter);
        }
        ruleWriter.close();

        //求解Kernel后的程序
        KernelAnswerSetHandler kernelAnswerSetHandler = new KernelAnswerSetHandler(groundedRuleFileName);
        //根据applicable和blocked获得完整实例化程序
        kernelAnswerSetHandler.groundedASP();
    }


}
