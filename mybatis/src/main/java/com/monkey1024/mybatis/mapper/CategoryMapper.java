package com.monkey1024.mybatis.mapper;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.monkey1024.mybatis.bean.Category;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper//可以被spring boot扫描到
@TableName(value = "categories")//指定表名
public interface CategoryMapper extends BaseMapper<Category> {

    List<Category> selectall();

    List<Category> selectCategoryByPid(int id);

    List<Category> selectCategory3();


}
