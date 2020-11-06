package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.Lanmu;

import java.util.List;

public interface LanmuService {
    Lanmu selectLanmuById(Integer id);
    Lanmu onetoall(Integer id);
}
