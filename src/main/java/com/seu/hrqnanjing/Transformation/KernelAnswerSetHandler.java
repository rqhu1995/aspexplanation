package com.seu.hrqnanjing.Transformation;

import com.seu.hrqnanjing.Util.ShellExecutor;

import java.io.*;
import java.util.regex.*;

import java.util.ArrayList;
import java.util.Collections;

/**
 * @program: aspexplanation
 * @description: 解析blocked 和 applicable程序的回答集并实例化原ASP程序
 * @author: RunqiuHu
 * @create: 2019-05-30 14:20
 **/

public class KernelAnswerSetHandler {

    FileWriter ruleFileWriter;

    public KernelAnswerSetHandler() throws IOException {
        ruleFileWriter = new FileWriter("grounded.lp",true);
    }

    //调用Clingo求回答集，并返回字符串给Parser
    private static String answerSetGenerator() throws IOException, InterruptedException {
        ShellExecutor executor = new ShellExecutor();
        executor.executeCommand("clingo 0 rules_grounded.lp rules_raw.lp > res.txt");
        Thread.sleep(100);
        FileReader fr = new FileReader(new File("res.txt"));
        BufferedReader br = new BufferedReader(fr);
        String line;
        StringBuffer resultText = new StringBuffer();
        while ((line = br.readLine()) != null) {
            resultText.append("\n").append(line);
        }
        //System.out.println(resultText);
        return resultText.toString();
    }

    //解析回答集，结果为二维ArrayList<ArrayList<String>>
    private static ArrayList<ArrayList<String>> answersetParser() throws IOException, InterruptedException {
        String resultText = answerSetGenerator();
        ArrayList<ArrayList<String>> result = new ArrayList<>();
        if (resultText.contains("UNSATISFIABLE")) {
            return result;
        } else if (!resultText.contains("SATISFIABLE")) {
            System.out.println("Clingo unable to compute the answer set, check the program.");
            return null;
        } else {
            String[] as = resultText.split("Answer:\\s*[0-9]*\n");
            as[as.length - 1] = as[as.length - 1].split("\n")[0] + "\n";
            for (int i = 1; i < as.length; ++i) {
                result.add(new ArrayList<String>());
                String[] answers = as[i].split("\\s");
                for (int j = 0; j < answers.length; j++) {
                    answers[j] += "\n";
                }
                Collections.addAll(result.get(i - 1), answers);
            }
            return result;
        }
    }

    public void groundedASP() throws InterruptedException, IOException {
        ArrayList<ArrayList<String>> answerSets;
        answerSets = answersetParser();
        assert answerSets != null;
        for (ArrayList<String> answerSet : answerSets) {
            for (String s : answerSet) {
                grounding(s);
            }
        }
        ruleFileWriter.close();
    }

    private void grounding(String s) throws IOException {
        String[] parts = {"h","pB","nB"};
        String pattern;
        Pattern r;
        Matcher m;
        StringBuffer groundedRule = new StringBuffer();
        for (String part : parts) {
            pattern = "(?<="+part+"\\()(.*?)((\\),(nB|h|pB))|(\\)\\s)|(\\)\\)\n))";
            r = Pattern.compile(pattern);
            m = r.matcher(s);
            if(m.find()){
                if(part.equals("h")){
                    groundedRule.append(m.group(1)).append(" :- ");
                }else if(part.equals("pB")){
                    groundedRule.append(m.group(1)).append(",");
                }else if(part.equals("nB")){
                    String[] nBodies = m.group(1).split(",");
                    for (String nBody : nBodies) {
                        groundedRule.append("not ").append(nBody).append(",");
                    }
                }
            }
        }

        if(groundedRule.toString().endsWith(",")){
            groundedRule.delete(groundedRule.length()-1,groundedRule.length());
        }
        groundedRule.append(".");

        if(groundedRule.length()>1){
            ruleFileWriter.write(groundedRule.toString()+"\n");
        }

    }

    public static void main(String[] args) throws IOException, InterruptedException {
        KernelTransformation kernelTransformation = new KernelTransformation("rules_raw.lp", "rules_grounded.lp");
        kernelTransformation.kernelTransform();
        KernelAnswerSetHandler kernelAnswerSetHandler = new KernelAnswerSetHandler();
        kernelAnswerSetHandler.groundedASP();
    }
}
