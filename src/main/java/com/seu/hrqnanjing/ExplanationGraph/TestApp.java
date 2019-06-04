package com.seu.hrqnanjing.ExplanationGraph;


import com.seu.hrqnanjing.Transformation.KernelTransformer;
import com.seu.hrqnanjing.Util.GraphDrawer;

import java.io.IOException;

public class TestApp {
    public static void main(String[] args) throws IOException, InterruptedException {
        ExplanationSpace explanationSpace = new ExplanationSpace();
        KernelTransformer kernelTransformer = new KernelTransformer("rules_raw.lp","vars.lp","rules_grounded.lp");
        kernelTransformer.kernelTransform();
        explanationSpace.setAllNode("rules_grounded.lp");
        GraphDrawer graphDrawer = new GraphDrawer(explanationSpace);
        graphDrawer.spaceTraversal();
        graphDrawer.graphDisplay("explanationSpace.png");
//        graphDrawer.clearGraph();
//        graphDrawer.spaceTraversal(explanationSpace.getLitNodeByLiteral("innocent(sally)"));
//        graphDrawer.graphDisplay("fly_tux_explanation.png");
    }
}
