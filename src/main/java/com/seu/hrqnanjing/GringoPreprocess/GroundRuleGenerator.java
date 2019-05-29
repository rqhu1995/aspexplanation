package com.seu.hrqnanjing.GringoPreprocess;

import com.seu.hrqnanjing.ASPParser.ASPRule;
import com.seu.hrqnanjing.ASPParser.ASPRuleExtractor;
import com.seu.hrqnanjing.ASPParser.RuleFileParser;
import com.seu.hrqnanjing.Util.ShellExecutor;
import jdk.nashorn.tools.Shell;

import java.io.*;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * @program: aspexplanation
 * @description: gringo输入文件生成（添加负体部的枚举）
 * @author: RunqiuHu
 * @create: 2019-05-13 17:10
 **/

public class GroundRuleGenerator {

    private String ruleFileRaw;
    private String ruleFileComplement;
    private String outputFilename;
    private String pattern = "";

    public GroundRuleGenerator(String ruleFileRaw, String ruleFileComplement, String outputFilename) {
        this.ruleFileRaw = ruleFileRaw;
        this.ruleFileComplement = ruleFileComplement;
        this.outputFilename = outputFilename;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    /**
    * @Description:  将原始规则文件中负体部的枚举加入到新的文件中
    * @Param: [ruleFileRaw, ruleFileComplement]
    * @return: void
    * @Author: Runqiu Hu
    * @Date: 2019-05-14
    */
    public void gringoInputComplement() throws IOException {
        FileOutputStream fileOutputStream = new FileOutputStream(new File(ruleFileComplement));
        RuleFileParser ruleFileParser = new RuleFileParser(ruleFileRaw);
        ArrayList<ASPRule> ruleList = ruleFileParser.parsingRule();

        for (ASPRule r : ruleList) {
            if (r.getLiteralReverseMap().size() <= 1) {
                continue;
            }
            for (Integer key : r.getLiteralReverseMap().keySet()) {
                String choice = "{" + r.getLiteralReverseMap().get(key) + ": ";
                for (Integer others : r.getLiteralReverseMap().keySet()) {
                    if (others != key) {
                        choice += r.getLiteralReverseMap().get(others) + ",";
                    }
                }
                choice = choice.substring(0, choice.length() - 1) + "}.\n";
                fileOutputStream.write(choice.getBytes());
            }
        }
    }

    public void getGroundFile(String pattern){
        ShellExecutor executor = new ShellExecutor();
        String command = "gringo -t --keep-fact " + ruleFileRaw + " " + ruleFileComplement;
        if(pattern.length()!=0){
            command += " | " + pattern;
        }
        command += " &> " + outputFilename;
        System.out.println(command);
        if(!executor.executeCommand(command)){
            System.out.println("命令执行错误");
        }else{
            System.out.println("实例化程序位置"+outputFilename);
        }
    }

}

