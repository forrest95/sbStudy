package com.monkey1024.mybatis.mapper;

import com.monkey1024.mybatis.bean.Employee;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper//可以被spring boot扫描到
public interface EmployeeMapper {

    List<Employee> selectChildrenByPid(int mgr);

    List<Employee> selectEmployeeByPid(int id);

    Employee selectLeaderByPid(int mgr);


}
