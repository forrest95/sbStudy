package com.monkey1024.mybatis.util;

public class Helper {

    /**
     * 获取数据类型
     * @param object
     * @return
     */
    public static String getType(Object object){
        String typeName=object.getClass().getName();
        int length= typeName.lastIndexOf(".");
        String type =typeName.substring(length+1);
        return type;
    }
}
