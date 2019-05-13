package com.seu.hrqnanjing.ExplanationGraph;

import com.seu.hrqnanjing.ASPParser.ASPRule;
import com.seu.hrqnanjing.ASPParser.RuleFileParser;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;


public class ExplanationSpace {
    private ArrayList<LiteralNode> literalNodeList = new ArrayList<LiteralNode>();
    private ArrayList<RuleNode> ruleNodeList = new ArrayList<RuleNode>();
    private ArrayList<GeneralNode> nodeList = new ArrayList<>();

    /**
     * @Description: 解析所有规则，创建LiteralNode和RuleNode
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
        litNode.setNodeID(nodeCount());
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
        ruleNode.setNodeID(nodeCount());
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

    public GeneralNode contains(GeneralNode node) {
        for (GeneralNode gNode : this.nodeList) {
            if (gNode.equals(node)) {
                return gNode;
            }
        }
        return null;
    }

    public void setAllNode(String filename) throws IOException {
        RuleFileParser ruleFileParser = new RuleFileParser(filename);
        ArrayList<ASPRule> parsedRules = ruleFileParser.parsingRule();

        //每条规则创建一个规则节点
        for (ASPRule r : parsedRules) {
            RuleNode ruleNode = new RuleNode(r);
            setRuleNodeList(ruleNode);

            //规则的三个部分
            setLiteralNodes(r, ruleNode, r.getHead(), "head");
            setLiteralNodes(r, ruleNode, r.getPosbody(), "posBody");
            setLiteralNodes(r, ruleNode, r.getNegbody(), "negBody");
        }
    }

    public void visitSpace() {
        for (GeneralNode gNode : nodeList) {
            System.out.println(gNode.getNodeID() + "," + gNode.getNodeElement());
            if(gNode instanceof LiteralNode){
                System.out.println(((LiteralNode) gNode).getConnectedNodeList().toString());
            }
            if(gNode instanceof RuleNode){
                System.out.println(((RuleNode) gNode).getConnectedNodeList(1).toString()+","+
                        ((RuleNode) gNode).getConnectedNodeList(2).toString());
            }
        }
    }

    private void setLiteralNodes(ASPRule r, RuleNode ruleNode, HashSet<Integer> litList, String part) {

        for (Integer i : litList) {
            String lit = r.getLiteralReverseMap().get(i);
            LiteralNode tmpNode = new LiteralNode(lit);
            LiteralNode literalNode = (LiteralNode) contains(tmpNode);

            //节点未出现过，创建这个节点
            if (literalNode == null) {
                literalNode = tmpNode;
                setLiteralNodeList(literalNode);
            }

            if (part == "head") {
                literalNode.setConnectedNodeList(ruleNode);
            } else if (part == "posBody") {
                ruleNode.setConnectedNodeList(literalNode, 1);
            } else if (part == "negBody") {
                ruleNode.setConnectedNodeList(literalNode, 2);
            }
        }
    }
}
