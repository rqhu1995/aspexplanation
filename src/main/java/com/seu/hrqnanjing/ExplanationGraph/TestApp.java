package com.seu.hrqnanjing.ExplanationGraph;



import com.seu.hrqnanjing.GringoPreprocess.GroundRuleGenerator;
import com.seu.hrqnanjing.Util.GraphDrawer;

import java.io.File;
import java.io.IOException;

public class TestApp {
    public static void main(String[] args) throws IOException {
        GroundRuleGenerator generator = new GroundRuleGenerator("src/main/resources/rules_raw.lp","src/main/resources/enumerate.lp", "src/main/resources/rules_grounded.lp");
        generator.gringoInputComplement();
        generator.getGroundFile("grep \"^[^#{]\"");
        ExplanationSpace explanationSpace = new ExplanationSpace();
        while(new File("src/main/resources/rules_grounded.lp").length()==0);
        explanationSpace.setAllNode("src/main/resources/rules_grounded.lp");
        GraphDrawer graphDrawer = new GraphDrawer(explanationSpace);
        graphDrawer.spaceTraversal();
        graphDrawer.graphDisplay();

    }
}
