package com.monkey1024.mybatis.bean;

import lombok.Data;

@Data
public class SysUser {

    private String id;
    private String username;
    private String password;

    public SysUser(String username,String password){
        this.username = username;
        this.password = password;
    }
}