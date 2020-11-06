package com.monkey1024.mybatis.bean;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.List;

@Data
@TableName(value = "categories")//指定表名
public class Category {

    private int id;
    private int pid;

    private String name;
    private String url;
    private String icon;
    private int sort;




}
