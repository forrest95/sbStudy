package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> selectChildrenByPid(Integer id);
    List<Employee> selectEmployeeByPid(Integer id);
    Employee selectLeaderByPid(int mgr);
}
