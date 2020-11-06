package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.User;
import com.monkey1024.mybatis.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;



    @Override
    public List<User> selectall(){
        return userMapper.selectall();
    }

    @Override
    public List<User> selectUserByPid(Integer id){
        return userMapper.selectUserByPid(id);
    }


    //下面两个方法  为了方便 直接返回了结果！！！
    @Override
    public boolean checkUser(String loginName, String passWord) {
        return true;
    }

    @Override
    public User getUser(String loginName) {
        User user = new User();
        user.setName("李四");
        user.setPassword("123");
        return user;
    }




}
