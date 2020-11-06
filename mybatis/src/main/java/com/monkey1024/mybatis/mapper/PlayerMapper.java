package com.monkey1024.mybatis.mapper;

import com.monkey1024.mybatis.bean.Player;
import org.apache.ibatis.annotations.Mapper;

@Mapper//可以被spring boot扫描到
public interface PlayerMapper {


    Player selectPlayerById(Integer id);



}
