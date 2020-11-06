package com.monkey1024.mybatis.mapper;

import com.monkey1024.mybatis.bean.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper//可以被spring boot扫描到
public interface UserMapper {

    List<User> selectall();

    List<User> selectUserByPid(int id);


}
