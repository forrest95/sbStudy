package com.monkey1024.mybatis.mapper;

import com.monkey1024.mybatis.bean.Lanmu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper//可以被spring boot扫描到
public interface LanmuMapper {

//    List<Student> selectAllStudent();

    Lanmu selectLanmuById(Integer id);

    Lanmu onetoall(Integer id);

//    int addStudent(Student student);

//    int updateStudent(Student student);

//    int deleteStudent(Integer id);
}
