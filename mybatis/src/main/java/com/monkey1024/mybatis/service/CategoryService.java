package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.Category;

import java.util.List;

public interface CategoryService {
    List<Category> selectall();
    List<Category> selectCategoryByPid(Integer id);
}
