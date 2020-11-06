package com.monkey1024.mybatis.service;


import com.monkey1024.mybatis.bean.SysUser;

import java.util.List;

public interface SysUserService {

    public boolean login(SysUser user);

    public List<SysUser> getList();
}