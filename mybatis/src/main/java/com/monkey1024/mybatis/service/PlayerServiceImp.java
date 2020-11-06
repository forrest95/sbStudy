package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.Player;
import com.monkey1024.mybatis.mapper.PlayerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlayerServiceImp implements PlayerService {

    @Autowired
    private PlayerMapper playerMapper;

    @Override
    public Player selectPlayerById(Integer id){
        return playerMapper.selectPlayerById(id);
    }

}
