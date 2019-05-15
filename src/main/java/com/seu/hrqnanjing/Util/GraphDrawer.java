package com.seu.hrqnanjing.Util;

import com.seu.hrqnanjing.ExplanationGraph.ExplanationSpace;
import com.seu.hrqnanjing.ExplanationGraph.GeneralNode;
import com.seu.hrqnanjing.ExplanationGraph.LiteralNode;
import com.seu.hrqnanjing.ExplanationGraph.RuleNode;
import guru.nidi.graphviz.attribute.Label;
import guru.nidi.graphviz.attribute.Records;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.model.MutableNode;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import static guru.nidi.graphviz.attribute.Records.rec;
import static guru.nidi.graphviz.model.Compass.NORTH;
import static guru.nidi.graphviz.model.Compass.SOUTH;
import static guru.nidi.graphviz.model.Factory.*;

/**
 * @program: aspexplanation
 * @description: 使用Graphviz绘制解释空间（nodes+edges）
 * @author: RunqiuHu
 * @create: 2019-05-14 14:49
 **/

public class GraphDrawer {
    // 需要一个解释空间对象
    private ExplanationSpace explanationSpace;
    private MutableGraph graph = mutGraph("expGraph").setDirected(true);
    private HashMap<Integer, MutableNode> mutableNodeHashMap = new HashMap<>();

    public GraphDrawer(ExplanationSpace explanationSpace) {
        this.explanationSpace = explanationSpace;
    }

    public void spaceTraversal() {
        boolean[] visited = new boolean[explanationSpace.nodeCount()];
        for (GeneralNode gNode : explanationSpace.getNodeList()) {
            GeneralNode dummyNode = null;
            spaceTraversal(gNode, visited, dummyNode);
        }
    }

    /**
     * @Description: 对解释空间进行遍历（图的深度优先搜索）
     * @Param: []
     * @return: void
     * @Author: Runqiu Hu
     * @Date: 2019-05-14
     */
    public void spaceTraversal(GeneralNode gNode, boolean[] visited, GeneralNode parentNode) {
        //未访问过该节点
        if (!visited[gNode.getNodeID() - 1]) {
            visited[gNode.getNodeID() - 1] = true;
            System.out.println(gNode.getNodeElement());
            if (gNode instanceof LiteralNode) {
                MutableNode currentNode = createSingleLitNode((LiteralNode) gNode);
                mutableNodeHashMap.put(gNode.getNodeID(), currentNode);
                graph.add(currentNode);
                for (RuleNode ruleNode : ((LiteralNode) gNode).getConnectedNodeList()) {
                    spaceTraversal(ruleNode, visited, gNode);
                }
            } else if (gNode instanceof RuleNode) {
                MutableNode currentNode = createSingleRuleNode((RuleNode) gNode);
                mutableNodeHashMap.put(gNode.getNodeID(), currentNode);
                graph.add(currentNode);
                for (LiteralNode litNode : ((RuleNode) gNode).getConnectedNodeList()) {
                    spaceTraversal(litNode, visited, gNode);
                }
            }
        }
        if (parentNode != null) {
            MutableNode mutParentNode = mutableNodeHashMap.get(parentNode.getNodeID());
            //当前节点为正体部
            if (gNode instanceof LiteralNode && ((RuleNode) parentNode).getConnectedNodeList(1).contains(gNode)) {
                mutParentNode.addLink(between(port("pbody", SOUTH), mutableNodeHashMap.get(gNode.getNodeID()).port(NORTH)).with(Label.of("√")));
            }
            //当前节点为负体部
            else if (gNode instanceof LiteralNode && ((RuleNode) parentNode).getConnectedNodeList(2).contains(gNode)) {
                mutParentNode.addLink(between(port("nbody", SOUTH), mutableNodeHashMap.get(gNode.getNodeID()).port(NORTH)).with(Label.of("×")));
            }
            //节点非规则节点（文字节点）
            else {
                mutParentNode.addLink(mutableNodeHashMap.get(gNode.getNodeID()).port("head"));
            }
        }
    }

    private MutableNode createSingleRuleNode(RuleNode gNode) {
        MutableNode graphRuleNode;
        String head = gNode.getRule().getRuleLiteralByPart("head");
        String posBody = gNode.getRule().getRuleLiteralByPart("posBody");
        String negBody = gNode.getRule().getRuleLiteralByPart("negBody");

        if(head.length()==0){
            head = "/";
        }
        if(posBody.length()==0){
            posBody = "/";
        }
        if(negBody.length()==0){
            negBody = "/";
        }

        int ruleType = gNode.getRule().getRuleType();

        if(ruleType != 2) {
            graphRuleNode = mutNode(String.valueOf(gNode.getNodeID())).attrs().add(
                    Records.of(rec("head", head),
                            rec("pbody", posBody),
                            rec("nbody", negBody)
                    ));
        }else{
            graphRuleNode = mutNode(String.valueOf(gNode.getNodeID())).attrs().add(
                    Records.of(rec("head", head)));
        }
        return graphRuleNode;
    }

    private MutableNode createSingleLitNode(LiteralNode gNode) {
        MutableNode graphLitNode = mutNode(gNode.getLiterals());
        return graphLitNode;
    }

    public void graphDisplay() {
        graph.graphAttrs().add("ranksep", 1).
                graphAttrs().add("nodesep", 0.5).
                graphAttrs().add("splines", "compound").
                graphAttrs().add("dpi",0);
        try {
            Graphviz.fromGraph(graph).render(Format.SVG).toFile(new File("example/ex2m.svg"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
