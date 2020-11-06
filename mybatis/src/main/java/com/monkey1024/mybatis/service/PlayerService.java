package com.monkey1024.mybatis.service;

import com.monkey1024.mybatis.bean.Player;

public interface PlayerService {
    Player selectPlayerById(Integer id);
}
