package com.seu.hrqnanjing.ExplanationGraph;

import com.seu.hrqnanjing.ASPParser.ASPRuleExtractor;

import java.util.ArrayList;


public class ExplanationSpace {
    private ArrayList<LiteralNode> literalNodeList = new ArrayList<LiteralNode>();
    private ArrayList<RuleNode> ruleNodeList = new ArrayList<RuleNode>();
    private ArrayList<GeneralNode> nodeList = new ArrayList<>();
    
    /** 
    * @Description: 解析所有规则，创建LiteralNode和RuleNode，传给ExplanationSpace
    * @Param: [] 
    * @return: void 
    * @Author: Runqiu Hu
    * @Date: 2019-05-12 
    */

    /**
    * @Description:
    * @Param: []
    * @return: java.util.ArrayList<com.seu.hrqnanjing.ExplanationGraph.LiteralNode>
    * @Author: Runqiu Hu
    * @Date: 2019-05-12
    */
    public ArrayList<LiteralNode> getLiteralNodeList() {
        return literalNodeList;
    }

    /**
    * @Description:
    * @Param: [litNode]
    * @return: void
    * @Author: Runqiu Hu
    * @Date: 2019-05-12
    */
    public void setLiteralNodeList(LiteralNode litNode) {
        this.nodeList.add(litNode);
        this.literalNodeList.add(litNode);
    }

    public ArrayList<RuleNode> getRuleNodeList() {
        return ruleNodeList;
    }

    /**
    * @Description:
    * @Param: [ruleNode]
    * @return: void
    * @Author: Runqiu Hu
    * @Date: 2019-05-12
    */
    public void setRuleNodeList(RuleNode ruleNode) {
        this.nodeList.add(ruleNode);
        this.ruleNodeList.add(ruleNode);
    }


    /**
    * @Description:
    * @Param: []
    * @return: int
    * @Author: Runqiu Hu
    * @Date: 2019-05-12
    */
    public int nodeCount() {
        return this.literalNodeList.size() + this.ruleNodeList.size();
    }

    public void displaySpace() {
        System.out.println("======解释空间======");
        for (LiteralNode litNode : literalNodeList) {
            System.out.print("内容:" + litNode.getLiterals());
            for (RuleNode ruleNode : litNode.getConnectedNodeList()) {
                System.out.println(ruleNode.rule);
            }
        }

        for (RuleNode ruleNode : ruleNodeList) {
            System.out.print("内容:" + ruleNode.getRule().toString());
        }
    }

    public GeneralNode contains(GeneralNode node){
        for(GeneralNode gNode : this.nodeList){
            if(gNode.equals(node)){
                return gNode;
            }
        }
        return null;
    }

}
