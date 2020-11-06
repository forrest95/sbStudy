package com.monkey1024.mybatis.mapper;

import com.monkey1024.mybatis.bean.Team;
import org.apache.ibatis.annotations.Mapper;

@Mapper//可以被spring boot扫描到
public interface TeamMapper {

    Team selectTeamById(int id);
}
