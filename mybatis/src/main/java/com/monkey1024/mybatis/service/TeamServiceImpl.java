package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.Student;
import com.monkey1024.mybatis.bean.Team;
import com.monkey1024.mybatis.mapper.TeamMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeamServiceImpl implements  TeamService {

    @Autowired
    private TeamMapper teamMapper;

    @Override
    public Team selectTeamById(Integer id){
        return teamMapper.selectTeamById(id);
    }

}
