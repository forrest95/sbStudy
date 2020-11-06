package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.Wenzhang;
import com.monkey1024.mybatis.mapper.WenzhangMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WenzhangServiceImpl implements  WenzhangService {

    @Autowired
    private WenzhangMapper wenzhangMapper;

    public Wenzhang selectWenzhangById(Integer id){
        return wenzhangMapper.selectWenzhangById(id);
    }
}
