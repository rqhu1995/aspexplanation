package com.seu.hrqnanjing.ASPParser;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class RuleFileParser {

    private String filename;
    private ArrayList<ASPRule> ruleList = new ArrayList<>();

    public RuleFileParser(String filename) {
        this.filename = filename;
    }

    public ArrayList<ASPRule> parsingRule() {
        try {
            InputStreamReader inputReader = new InputStreamReader(new FileInputStream(filename));
            BufferedReader bf = new BufferedReader(inputReader);
            // 按行读取字符串
            String str;
            while ((str = bf.readLine()) != null) {
                if (str.startsWith("{")) {
                    continue;
                }
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
        ASPRule rulesToAdd = visitor.getRuleForParse();
        rulesToAdd.setRuleID(ruleList.size());
        ruleList.add(rulesToAdd);
    }

    public static void main(String[] args) {
        RuleFileParser ruleFileParserTest = new RuleFileParser("grounded.lp");
        ruleFileParserTest.parsingRule();
    }

}
