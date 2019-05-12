package com.seu.hrqnanjing.ExplanationGraph;

import java.util.ArrayList;

public class LiteralNode extends GeneralNode {

    private ArrayList<RuleNode> connectedNodeList = new ArrayList<RuleNode>();

    public String getLiterals() {
        return literals;
    }

    private String literals = "";

    public LiteralNode(int ID) {
        super(ID);
    }

    public LiteralNode(int ID, String literals) {
        super(ID);
        this.literals = literals;
    }

    public void setLiterals(String literals) {
        this.literals = literals;
    }

    public ArrayList<RuleNode> getConnectedNodeList() {
        return connectedNodeList;
    }

    public void setConnectedNodeList(RuleNode ruleNode) {
        this.connectedNodeList.add(ruleNode);
    }
    
    /** 
    * @Description: 重写equals方法，判断文字节点是否相等 
    * @Param: [anObject] 
    * @return: boolean 
    * @Author: Runqiu Hu
    * @Date: 2019-05-12 
    */
    @Override
    public boolean equals(Object anObject) {
        if (this == anObject) {
            return true;
        }
        if (anObject instanceof LiteralNode) {
            if(this.getLiterals().equals(((LiteralNode) anObject).getLiterals())){
                return true;
            }
        }
        return false;
    }
}
