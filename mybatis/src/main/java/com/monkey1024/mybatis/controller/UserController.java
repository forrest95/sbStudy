package com.monkey1024.mybatis.controller;

import com.monkey1024.mybatis.bean.SysUser;
import com.monkey1024.mybatis.service.SysUserService;
import com.monkey1024.mybatis.util.LogFile;
import com.monkey1024.mybatis.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {


    @Autowired
    private SysUserService userService;


    @PostMapping(value="/login")
    @ResponseBody
    public Map<String,Object> login(String username,String password){

        System.out.println("进入login方法"+username+" "+password );
        //start 写入txt
        LogFile.writeFile("d:/1user_login.log", "UserController/login.log");
        //end 写入txt

        Map<String,Object> map = new HashMap<>();
        SysUser user = new SysUser(username,password);

        if(userService.login(user)){
            System.out.println("进入了userService.login");
            String token = TokenUtil.sign(user);
            if(token != null){
                map.put("code", "10000");
                map.put("message", "认证成功");
                map.put("token", token);
                return map;
            }
        }

        map.put("code", "0000");
        map.put("message", "认证失败user_login");
        return map;

    }

    @PostMapping(value="/getList")
    public List<SysUser> getList(){

        List userList = userService.getList();
        return userList;

    }



}