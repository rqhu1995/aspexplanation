package com.seu.hrqnanjing.Util;

import java.io.IOException;

/**
 * @program: aspexplanation
 * @description: 调用命令行执行传入的命令并获取结果
 * @author: RunqiuHu
 * @create: 2019-05-14 10:54
 **/

public class ShellExecutor {

    public boolean executeCommand(String command) {
        Process process = null;
        boolean executeResult = true;
        try {
            String shell;
            //执行Shell命令，成功返回true
            if(System.getProperty("os.name").startsWith("Windows")){
                shell = "cmd";
                command = "gringo -t --keep-fact rules_raw.lp enumerate.lp > rules_grounded.lp";
                System.out.printf(command);
            }else{
                shell = "sh";
            }
            process = Runtime.getRuntime().exec("cmd.exe /c "+ command);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
