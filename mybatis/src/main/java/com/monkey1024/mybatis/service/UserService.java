package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.User;

import java.util.List;

public interface UserService {
    List<User> selectall();
    List<User> selectUserByPid(Integer id);


    /**
     * 校验用户信息
     * @param loginName
     * @param passWord
     * @return
     */
    boolean checkUser(String loginName, String passWord);

    /**
     * 查询用户信息
     * @param loginName
     * @return
     */
    User getUser(String loginName);
}
