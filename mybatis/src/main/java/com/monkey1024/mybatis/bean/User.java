package com.monkey1024.mybatis.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private int id;

    private String name;
    private String username;
    private String email;
    private String password;
    private String remember_token;
}
