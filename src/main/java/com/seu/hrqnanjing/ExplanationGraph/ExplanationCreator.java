package com.seu.hrqnanjing.ExplanationGraph;

import com.seu.hrqnanjing.ASPParser.ASPRule;
import com.seu.hrqnanjing.ASPParser.ASPRuleExtractor;
import com.seu.hrqnanjing.ASPParser.RuleFileParser;
import com.sun.javafx.css.Rule;

import java.io.IOException;

/**
 * @program: aspexplanation
 * @description: 向解释空间中添加节点
 * @author: RunqiuHu
 * @create: 2019-05-12 22:35
 **/

public class ExplanationCreator {
    private ExplanationSpace explanationSpace = null;

    public void setAllNode() throws IOException {
        RuleFileParser ruleFileParser = new RuleFileParser("rules.lp");
        for (ASPRule r : ruleFileParser.parsingRule()) {
            System.out.println(r.toString());
        }
    }

    public static void main(String[] args) throws IOException {
        ExplanationCreator exp = new ExplanationCreator();
        exp.setAllNode();
    }
}
