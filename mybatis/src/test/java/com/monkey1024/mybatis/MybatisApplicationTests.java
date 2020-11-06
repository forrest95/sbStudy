package com.monkey1024.mybatis;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.monkey1024.mybatis.bean.Category;
import com.monkey1024.mybatis.bean.Links;
import com.monkey1024.mybatis.mapper.CategoryMapper;
import com.monkey1024.mybatis.mapper.LinksMapper;
import com.monkey1024.mybatis.service.CategoryService;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@MapperScan("com.monkey1024.mybatis.mapper")
class MybatisApplicationTests {

    @Autowired
    private LinksMapper linksMapper;

    @Autowired
    private CategoryMapper categoryMapper;


    @Autowired
    private CategoryService categoryService;

    @Test
    void contextLoads() {
        System.out.println("test contextLoads action ! ");
    }


    @Test
    void aa() {
        List<Links> links= linksMapper.selectList(null);

       links.forEach(System.out::println);
    }

    @Test
    void bb(){

        List<Category> categorys=categoryService.selectall();
        categorys.forEach(System.out::println);

        System.out.println("##################我是分割线##############");

        List<Category> categories= categoryMapper.selectList(null);
        List<Category> categories1= categoryMapper.selectList(null);

        categories.forEach(System.out::println);
    }

    @Test
    void cc(){
        System.out.println("我是c方法  queryWrapper 查询构造器使用方法");
//        List<Category> categorys=categoryMapper.selectCategory3();

        QueryWrapper<Category>  queryWrapper=new QueryWrapper<>();

        queryWrapper.ge("name",4).le("name",5);

        List<Category> categorys=categoryMapper.selectList(queryWrapper);
        categorys.forEach(System.out::println);
    }

}
