package com.monkey1024.mybatis.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

public class LogFile {

    /**
     * 写入log 私有方法
     *
     * @param path
     * @param content
     */
    public static void writeFile(String path, String content) {
        File writefile;
        try {
            // 通过这个对象来判断是否向文本文件中追加内容
            // boolean addStr = append;

            writefile = new File(path);

            // 如果文本文件不存在则创建它
            if (!writefile.exists()) {
                writefile.createNewFile();
                writefile = new File(path); // 重新实例化
            }

            FileOutputStream fw = new FileOutputStream(writefile, true);
            Writer out = new OutputStreamWriter(fw, "utf-8");
            out.write(content);
            String newline = System.getProperty("line.separator");
            //写入换行
            out.write(newline);
            out.close();
            fw.flush();
            fw.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
