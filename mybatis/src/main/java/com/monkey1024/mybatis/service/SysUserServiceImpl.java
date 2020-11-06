package com.monkey1024.mybatis.service;


import com.monkey1024.mybatis.bean.SysUser;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SysUserServiceImpl implements SysUserService{

    @Override
    public boolean login(SysUser user) {
        String username = user.getUsername();
        String password = user.getPassword();

        System.out.println("#####f "+username+password);

        if(username.equals("king") && password.equals("123")){
            System.out.println("true "+username+password);
            return true;
        }
        System.out.println("false "+username+password);
        return false;
    }

    @Override
    public List<SysUser> getList() {

        SysUser user1= new SysUser("king1","12345");
        SysUser user2 = new SysUser("king2","12345");
        SysUser user3 = new SysUser("king3","12345");
        List<SysUser> list = new ArrayList<>();
        list.add(user1);
        list.add(user2);
        list.add(user3);
        return list;
    }
}