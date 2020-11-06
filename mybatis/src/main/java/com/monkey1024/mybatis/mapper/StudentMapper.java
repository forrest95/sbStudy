package com.monkey1024.mybatis.mapper;

import com.monkey1024.mybatis.bean.Student;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper//可以被spring boot扫描到
public interface StudentMapper {

    List<Student> selectAllStudent();

    Student selectStudentById(Integer id);

    int addStudent(Student student);

    int updateStudent(Student student);

    int deleteStudent(Integer id);
}
