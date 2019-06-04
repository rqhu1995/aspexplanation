package com.seu.hrqnanjing.ASPParser;

import java.util.HashMap;
import java.util.HashSet;

public class ASPRule {

    private HashSet<Integer> head = new HashSet<>();
    private HashSet<Integer> positiveBody = new HashSet<>();
    private HashSet<Integer> negativeBody = new HashSet<>();
    private HashMap<String, Integer> literalMap = new HashMap<>();
    private HashMap<Integer, String> literalReverseMap = new HashMap<>();
    private HashMap<String, String> ruleLiteralByPart = new HashMap<>();

    public HashSet<String> getExpressionTable() {
        return expressionTable;
    }

    public void setExpressionTable(String expression) {
        this.expressionTable.add(expression);
    }

    private HashSet<String> expressionTable = new HashSet<>();
    private int ruleID = -1;
    private HashSet<String> varList = new HashSet<>();

    public int getRuleID() {
        return ruleID;
    }

    public void setRuleID(int ruleID) {
        this.ruleID = ruleID;
    }

    public void setConstantList(String constant) {
        this.constantList.add(constant);
    }

    private HashSet<String> constantList = new HashSet<>();

    public HashSet<String> getVarList() {
        return varList;
    }

    public void setVarList(String variable) {
        varList.add(variable);
    }

    public String getRuleLiteralByPart(String part) {
        return ruleLiteralByPart.get(part);
    }

    public HashMap<String, Integer> getLiteralMap() {
        return literalMap;
    }

    private int ruleType = -1;

    void setHead(int headIndex) {
        this.head.add(headIndex);
    }

    void setPosbody(int posLiteral) {
        positiveBody.add(posLiteral);
    }

    void setNegbody(int negLiteral) {
        negativeBody.add(negLiteral);
    }

    public HashSet<Integer> getHead() {
        return this.head;
    }

    public HashSet<Integer> getPosbody() {
        return positiveBody;
    }

    public HashSet<Integer> getNegbody() {
        return negativeBody;
    }

    public void setRuleLiteralByPart() {

        StringBuilder head = new StringBuilder();
        StringBuilder posBody = new StringBuilder();
        StringBuilder negBody = new StringBuilder();
        StringBuilder expression = new StringBuilder();

        for (Integer i : this.getHead()) {
            head.append(literalReverseMap.get(i)).append(",");
        }
        for (Integer i : this.getPosbody()) {
            posBody.append(literalReverseMap.get(i)).append(",");
        }
        for (Integer i : this.getNegbody()) {
            negBody.append("not ").append(literalReverseMap.get(i)).append(",");
        }
        for (String exp : this.getExpressionTable()) {
            expression.append(exp).append(",");
        }

        String headLit = (((head.length() - 1) >= 0) ? head.substring(0, head.length() - 1) : "");
        String posLit = (((posBody.length() - 1) >= 0) ? posBody.substring(0, posBody.length() - 1) : "");
        String negLit = (((negBody.length() - 1) >= 0) ? negBody.substring(0, negBody.length() - 1) : "");
        String expressions = (((expression.length() - 1) >= 0) ? expression.substring(0, expression.length() - 1) : "");
        setRuleLiteralByPart("head", headLit);
        setRuleLiteralByPart("posBody", posLit);
        setRuleLiteralByPart("negBody", negLit);
        setRuleLiteralByPart("expression", expressions);
    }

    @Override
    public String toString() {

        return "====Rule " + ruleType + "====\n" + "head:[" + getRuleLiteralByPart("head") +
                "],posBody:[" + getRuleLiteralByPart("posBody") +
                "],negBody:[" + getRuleLiteralByPart("negBody") + "]"
                + "\n==============";
    }

    public void setRuleLiteralByPart(String part, String content) {
        this.ruleLiteralByPart.put(part, content);
    }

    public void setRuleType() {
        if (head.size() == 0) {
            if (positiveBody.size() != 0 || negativeBody.size() != 0) {
                this.ruleType = 3;  //constraint
            } else {
                this.ruleType = 4;  //empty_rule
            }
        } else {
            if (positiveBody.size() == 0 && negativeBody.size() == 0) {
                this.ruleType = 2; //fact
            } else {
                this.ruleType = 1; //full_rule
            }
        }
    }

    /**
     * @Description: 获取规则类型
     * @Param: []
     * @return: 1：完整rule，2：事实，3：约束，4：空规则
     * @Author: Runqiu Hu
     * @Date: 2019-05-14
     */
    public int getRuleType() {
        return ruleType;
    }

    @Override
    public boolean equals(Object anObject) {
        if (this == anObject) {
            return true;
        }
        if (anObject instanceof ASPRule) {
            if (((ASPRule) anObject).getRuleType() != this.ruleType) {
                return false;
            }

            if (((ASPRule) anObject).getHead().equals(this.getHead()) &&
                    ((ASPRule) anObject).getPosbody().equals(this.getPosbody()) &&
                    ((ASPRule) anObject).getNegbody().equals(this.getNegbody())) {
                return true;
            }
        }
        return false;
    }


    public HashMap<Integer, String> getLiteralReverseMap() {
        return literalReverseMap;
    }

    public HashSet<String> getConstantList() {
        return constantList;
    }
}
