package com.seu.hrqnanjing.ExplanationGraph;

import java.util.ArrayList;

/**
 * 通用节点类
 * 节点ID
 * 相连节点集合
 */
public class GeneralNode {
    private int nodeID = -1;

    public GeneralNode(int ID) {
        this.nodeID = ID;
    }

    public int getNodeID() {
        return nodeID;
    }

    public void setNodeID(int nodeID) {
        this.nodeID = nodeID;
    }

    public String getNodeElement(GeneralNode node){
        if(node instanceof LiteralNode){
            return ((LiteralNode) node).getLiterals();
        }else if(node instanceof RuleNode){
            return ((RuleNode) node).getRule().toString();
        }
        return null;
    }
}
