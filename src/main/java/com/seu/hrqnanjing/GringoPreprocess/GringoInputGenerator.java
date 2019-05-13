package com.seu.hrqnanjing.GringoPreprocess;

import com.seu.hrqnanjing.ASPParser.ASPRule;
import com.seu.hrqnanjing.ASPParser.ASPRuleExtractor;
import com.seu.hrqnanjing.ASPParser.RuleFileParser;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: aspexplanation
 * @description: gringo输入文件生成（添加负体部的枚举）
 * @author: RunqiuHu
 * @create: 2019-05-13 17:10
 **/

public class GringoInputGenerator {

    public static void main(String[] args) throws IOException {
        FileOutputStream fileOutputStream = new FileOutputStream(new File("extended_grounding.lp"));
        RuleFileParser ruleFileParser = new RuleFileParser("rules_to_ground.lp");
        ArrayList<ASPRule> ruleList = ruleFileParser.parsingRule();
        for (ASPRule r : ruleList) {
            if(r.getNegbody().size()!=0){
                for (Integer i : r.getNegbody()) {
                    String choice = "{" + r.getLiteralReverseMap().get(i) + ":";
                    for (Integer j : r.getPosbody()) {
                        choice +=  r.getLiteralReverseMap().get(j) + ",";
                    }
                    for (Integer k : r.getNegbody()) {
                        if(r.getLiteralReverseMap().get(k) != r.getLiteralReverseMap().get(i))
                            choice += "," + r.getLiteralReverseMap().get(k);
                    }
                    choice = choice.substring(0,choice.length()-1);
                    choice += "}.\n";
                    fileOutputStream.write(choice.getBytes());
                }
            }
        }

        Process process = null;
        List<String> processList = new ArrayList<String>();
        try {
            process = Runtime.getRuntime().exec("clingo 0 rules_to_ground.lp");
            BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line = "";
            while ((line = input.readLine()) != null) {
                if(!line.startsWith("{")) {
                    processList.add(line);
                }
            }
            input.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (String line : processList) {
            System.out.println(line);
        }
    }
}

