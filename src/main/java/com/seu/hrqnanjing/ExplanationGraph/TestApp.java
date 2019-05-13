package com.seu.hrqnanjing.ExplanationGraph;

import java.io.IOException;

public class TestApp {
    public static void main(String[] args) throws IOException {
        ExplanationSpace explanationSpace = new ExplanationSpace();
        explanationSpace.setAllNode("rules.lp");
        explanationSpace.visitSpace();
    }
}
