package com.monkey1024.mybatis.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
//@AllArgsConstructor
//@NoArgsConstructor
@TableName(value = "links")//指定表名
public class Links {
    @TableId(value="id", type= IdType.AUTO)
    private Integer id;
    private String  name;
    private String  url;
    private String  description;

//    private Timestamp created_at;
//    private Timestamp updated_at;



}
