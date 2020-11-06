package com.monkey1024.mybatis.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.monkey1024.mybatis.bean.Category;
import com.monkey1024.mybatis.mapper.CategoryMapper;
import com.monkey1024.mybatis.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryMapper categoryMapper ;

    /**
     * 简单select
     * 01 selectall
     */
    @GetMapping("/selectall")
    public List<Category> selectall() throws Exception{
        System.out.println("/category/selectall");
        List<Category> categorys=categoryService.selectall();
        return categorys;
    }

    @GetMapping("/pagehelper/{page}/{number}")
    public PageInfo<Category> pagehelper(@PathVariable Integer page,@PathVariable Integer number){
        System.out.println("page: "+page + " ### number: "+number);
        PageHelper.startPage(page,number);
        List<Category> categories=categoryService.selectall();

        PageInfo<Category> pageInfo=new PageInfo<>(categories);
        System.out.println(pageInfo.getList());


        System.out.println("##########################");
        System.out.println("总页数："+pageInfo.getPages());

        System.out.println("总记录数："+pageInfo.getTotal());
        System.out.println("当前页："+pageInfo.getPageNum());

        System.out.println("上一页："+pageInfo.getPrePage());

        System.out.println("下一页："+pageInfo.getNextPage());

        System.out.println("是否有上一页："+pageInfo.isHasPreviousPage());

        System.out.println("是否有下一页："+pageInfo.isHasNextPage());

        System.out.println("是否为首页："+pageInfo.isIsFirstPage());

        System.out.println("是否为末页："+pageInfo.isIsLastPage());

        System.out.println("##########################");
        return pageInfo;
    }
}
