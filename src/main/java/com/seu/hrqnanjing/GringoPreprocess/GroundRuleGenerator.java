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
//        for (ASPRule r : ruleList) {
//            if (r.getNegbody().size() != 0) {
//                    for (Integer i : r.getNegbody()) {
//
//                        String choice = "{" + r.getLiteralReverseMap().get(i) + ":";
//                        int counter=0;
//                        for (Integer j : r.getPosbody()) {
//                            if(counter != 0)
//                                choice += ",";
//                            choice += r.getLiteralReverseMap().get(j);
//                            counter++;
//                        }
//
//                        if(counter != 0){
//                            choice += ",";
//                        }
//
//                        for (Integer k : r.getNegbody()) {
//                            if (r.getLiteralReverseMap().get(k) != r.getLiteralReverseMap().get(i))
//                                choice += r.getLiteralReverseMap().get(k) + ",";
//                        }
//                        choice = choice.substring(0, choice.length() - 1);
//                        choice += "}.\n";
//                        fileOutputStream.write(choice.getBytes());
//                    }
//            }
//        }
        for (ASPRule r : ruleList) {
            if (r.getRuleType()!=2 && r.getRuleType()!=4) {
                for (Integer i : r.getPosbody()) {
                    generateEnumerate(fileOutputStream, r, i);
                }

                for (Integer i : r.getNegbody()) {
                    generateEnumerate(fileOutputStream, r, i);
                }
            }
        }
    }

    public void generateEnumerate(FileOutputStream fileOutputStream, ASPRule r, Integer i) throws IOException {
        String choice = "{" + r.getLiteralReverseMap().get(i) + ":";
        int counter=0;
        for (Integer j : r.getPosbody()) {
            if(r.getLiteralReverseMap().get(j)==r.getLiteralReverseMap().get(i)){
                continue;
            }
            if(counter != 0)
                choice += ",";
            choice += r.getLiteralReverseMap().get(j);
            counter++;
        }

        if(counter != 0){
            choice += ",";
        }

        for (Integer k : r.getNegbody()) {
            if(r.getLiteralReverseMap().get(k)==r.getLiteralReverseMap().get(i)){
                continue;
            }
            choice += r.getLiteralReverseMap().get(k) + ",";
        }
        choice = choice.substring(0, choice.length() - 1);
        choice += "}.\n";
        fileOutputStream.write(choice.getBytes());
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

    public void filter() {
        try {
            InputStreamReader inputReader = new InputStreamReader(new FileInputStream(outputFilename));
            OutputStreamWriter outputWriter = new OutputStreamWriter(new FileOutputStream("updated.lp"));
            BufferedReader br = new BufferedReader(inputReader);
            BufferedWriter bw = new BufferedWriter(outputWriter);
            HashSet<String> record = new HashSet<>();
            // 按行读取字符串
            String str;
            while ((str = br.readLine()) != null) {
                if (str.contains("{") || str.contains("}")) {
                    str = str.replace("{", "").replace("}", "");
                }
                if (!record.contains(str)) {
                    record.add(str);
                    bw.write(str + "\n");
                } else {
                    bw.write("\n");
                }
            }
            br.close();
            bw.close();
            inputReader.close();
            outputWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

