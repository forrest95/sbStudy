package com.monkey1024.mybatis.controller;

import com.monkey1024.mybatis.bean.Lanmu;
import com.monkey1024.mybatis.bean.Student;
import com.monkey1024.mybatis.bean.Wenzhang;
import com.monkey1024.mybatis.mapper.LanmuMapper;
import com.monkey1024.mybatis.service.LanmuService;
import com.monkey1024.mybatis.service.WenzhangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/mybatis")
public class MybatisController {

    @Autowired
    private LanmuService lanmuService;

    @Autowired
    private WenzhangService wenzhangService;

    /**
     * 测试查询单个栏目
     */
    @GetMapping("/selectone/{id}")
    public Lanmu selectone(@PathVariable Integer id) throws Exception{
        Lanmu lanmu = lanmuService.selectLanmuById(id);
        if(lanmu==null){
            System.out.println("id:"+id+"没找到对象！");
        }
        return lanmu;
    }

    /**
     * 一对多
     * @return
     * @throws Exception
     */
    @GetMapping("/onetoall/{id}")
    public Lanmu onetoall(@PathVariable Integer id) throws Exception{
        Lanmu lanmu = lanmuService.onetoall(id);
        if(lanmu==null){
            System.out.println("id:"+id+"没找到对象！");
        }
        return lanmu;
    }

    /**
     * 一对一
     */
    @GetMapping("/onetoone/{id}")
    public Wenzhang onetowen(@PathVariable Integer id) throws  Exception{
        Wenzhang wenzhang=wenzhangService.selectWenzhangById(id);
        if(wenzhang==null){
            System.out.println("id:"+id+"没找到对象！");
        }
        return wenzhang;
    }
}
