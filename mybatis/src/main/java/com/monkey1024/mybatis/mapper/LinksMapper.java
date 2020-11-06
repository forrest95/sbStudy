package com.monkey1024.mybatis.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.monkey1024.mybatis.bean.Links;
import org.apache.ibatis.annotations.Mapper;

//@Repository
@Mapper
//@TableName(value = "links")//指定表名
public interface LinksMapper extends BaseMapper<Links> {
}
