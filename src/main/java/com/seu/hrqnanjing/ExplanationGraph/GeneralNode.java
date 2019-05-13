package com.seu.hrqnanjing.ExplanationGraph;

import java.util.ArrayList;

/**
 * 通用节点类
 * 节点ID
 * 相连节点集合
 */
public class GeneralNode {
    private int nodeID = -1;

    public GeneralNode(){};

    public GeneralNode(int ID) {
        this.nodeID = ID;
    }

    public int getNodeID() {
        return nodeID;
    }

    public void setNodeID(int nodeID) {
        this.nodeID = nodeID;
    }

    public String getNodeElement(){
        if(this instanceof LiteralNode){
            return ((LiteralNode) this).getLiterals();
        }else if(this instanceof RuleNode){
            return ((RuleNode) this).getRule().toString();
        }
        return null;
    }

}
