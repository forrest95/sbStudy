package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.Lanmu;
import com.monkey1024.mybatis.bean.Student;
import com.monkey1024.mybatis.mapper.LanmuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LanmuServiceImpl implements LanmuService {

    @Autowired
    private LanmuMapper lanmuMapper;

//    @Override
//    public List<Student> selectAllStudent() {
//        return studentMapper.selectAllStudent();
//    }

    @Override
    public Lanmu selectLanmuById(Integer id) {

        return lanmuMapper.selectLanmuById(id);
    }

    @Override
    public Lanmu onetoall(Integer id) {

        return lanmuMapper.onetoall(id);
    }

    /*@Override
    public void addStudent(Student student) {
        studentMapper.addStudent(student);

    }

    @Override
    public void updateStudent(Student student) {
        studentMapper.updateStudent(student);
    }

    @Override
    public void deleteStudent(Integer id) {
        studentMapper.deleteStudent(id);
    }*/
}
