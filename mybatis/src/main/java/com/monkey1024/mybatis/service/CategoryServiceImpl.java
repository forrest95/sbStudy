package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.Category;
import com.monkey1024.mybatis.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

//    @Override
//    public List<Student> selectAllStudent() {
//        return studentMapper.selectAllStudent();
//    }

    @Override
    public List<Category> selectall(){
        return categoryMapper.selectall();
    }

    @Override
    public List<Category> selectCategoryByPid(Integer id){
        return categoryMapper.selectCategoryByPid(id);
    }




}
