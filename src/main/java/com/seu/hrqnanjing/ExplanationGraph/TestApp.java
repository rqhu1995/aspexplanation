package com.seu.hrqnanjing.ExplanationGraph;



import com.seu.hrqnanjing.GringoPreprocess.GroundRuleGenerator;
import com.seu.hrqnanjing.Util.GraphDrawer;

import java.io.File;
import java.io.IOException;

public class TestApp {
    public static void main(String[] args) throws IOException {
        //GroundRuleGenerator generator = new GroundRuleGenerator("rules_raw.lp","enumerate.lp", "rules_grounded.lp");
        //generator.gringoInputComplement();
        //generator.getGroundFile("grep \"^[^#{]\"");
        ExplanationSpace explanationSpace = new ExplanationSpace();
        explanationSpace.setAllNode("grounded.lp");
        GraphDrawer graphDrawer = new GraphDrawer(explanationSpace);
        graphDrawer.spaceTraversal();
        graphDrawer.graphDisplay();
    }
}
