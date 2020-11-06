package com.monkey1024.mybatis.mapper;

import com.monkey1024.mybatis.bean.Wenzhang;
import org.apache.ibatis.annotations.Mapper;

@Mapper//可以被spring boot扫描到
public interface WenzhangMapper {

//    List<Student> selectAllStudent();

    Wenzhang selectWenzhangById(Integer id);



}
