package com.seu.hrqnanjing.ASPParser;

import java.util.HashMap;
import java.util.HashSet;

public class ASPRule {

    private HashSet<Integer> head = new HashSet<>();
    private HashSet<Integer> positiveBody = new HashSet<>();
    private HashSet<Integer> negativeBody = new HashSet<>();
    private HashSet<HashSet<Integer>> body = new HashSet<>();
    private HashMap<String, Integer> literalMap = new HashMap<>();
    private HashMap<Integer, String> literalReverseMap = new HashMap<>();

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

    public void setBody() {
        body.add(getPosbody());
        body.add(getNegbody());
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

    public HashSet<HashSet<Integer>> getBody() {
        return body;
    }

    @Override
    public String toString() {
        return "head:" + this.getHead() + ",posBody:" + this.getPosbody() + ",negBody:" + this.getNegbody();
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
}
