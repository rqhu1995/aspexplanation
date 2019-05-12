package com.seu.hrqnanjing.ExplanationGraph;

import com.seu.hrqnanjing.ASPParser.ASPRule;
import java.util.ArrayList;

/**
 * 规则节点类
 * 节点ID
 * 一条规则
 * 节点边集合
 */
public class RuleNode extends GeneralNode {

    ASPRule rule;
    ArrayList<LiteralNode> posNodeList = new ArrayList<LiteralNode>();
    ArrayList<LiteralNode> negNodeList = new ArrayList<LiteralNode>();
    ArrayList<LiteralNode> connectedNodeList = new ArrayList<LiteralNode>();

    public RuleNode(int ID) {
        super(ID);
    }

    public RuleNode(int ID, ASPRule rule) {
        super(ID);
        this.rule = rule;
        rule.setRuleType();
    }

    public ArrayList<LiteralNode> getConnectedNodeList(int type) {
        if(type == 1){
            return posNodeList;
        }else if(type == 2){
            return negNodeList;
        }else
            return null;
    }

    public ASPRule getRule() {
        return rule;
    }

    public void setConnectedNodeList(LiteralNode node, int type) {
        if(type == 1){
            posNodeList.add(node);
        }else if(type == 2){
            negNodeList.add(node);
        }
        connectedNodeList.add(node);
    }

    @Override
    public boolean equals(Object anObject) {
        if (this == anObject) {
            return true;
        }
        if (anObject instanceof RuleNode) {
            if(this.getRule().equals(((RuleNode) anObject).getRule())){
                return true;
            }
        }
        return false;
    }

}
