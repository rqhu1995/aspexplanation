package com.seu.hrqnanjing.ASPParser;

import com.seu.hrqnanjing.ExplanationGraph.ExplanationSpace;
import com.sun.javafx.css.Rule;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.*;
import java.util.ArrayList;
import java.util.HashSet;

public class RuleFileParser {

    private String filename = null;
    private ArrayList<ASPRule> ruleList = new ArrayList<>();

    public RuleFileParser(String filename) {
        this.filename = filename;
    }

    public ArrayList<ASPRule> parsingRule() throws IOException {
        try {
            InputStreamReader inputReader = new InputStreamReader(new FileInputStream(filename));
            BufferedReader bf = new BufferedReader(inputReader);
            // 按行读取字符串
            String str;
            while ((str = bf.readLine()) != null) {
                parser(str);
            }
            bf.close();
            inputReader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return ruleList;
    }

    private void parser(String str) {
        String program = str;
        CharStream input = CharStreams.fromString(program);
        LPMLNLexer lexer = new LPMLNLexer(input);
        CommonTokenStream token = new CommonTokenStream(lexer);
        LPMLNParser parser = new LPMLNParser(token);
        ParseTree tree = parser.lpmln_rule();
        ASPRuleExtractor visitor = new ASPRuleExtractor();
        visitor.visit(tree);
        ruleList.add(visitor.getRuleForParse());
    }

}
