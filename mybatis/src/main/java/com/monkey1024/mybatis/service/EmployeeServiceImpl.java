package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.Employee;
import com.monkey1024.mybatis.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

//    @Override
//    public List<Student> selectAllStudent() {
//        return studentMapper.selectAllStudent();
//    }

    @Override
    public List<Employee> selectChildrenByPid(Integer id){
        return employeeMapper.selectChildrenByPid(id);
    }

    @Override
    public List<Employee> selectEmployeeByPid(Integer id){
        return employeeMapper.selectEmployeeByPid(id);
    }

    @Override
    public Employee selectLeaderByPid(int mgr){
        return employeeMapper.selectLeaderByPid(mgr);
    }




}
