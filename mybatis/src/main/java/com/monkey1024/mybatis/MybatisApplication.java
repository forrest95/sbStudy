package com.monkey1024.mybatis;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
//@ServletComponentScan(basePackages={"com.monkey1024.mybatis.filter"}) //在入口方法中配置filter所在的包
@MapperScan("com.monkey1024.mybatis.mapper")
public class MybatisApplication {

    public static void main(String[] args) {
        SpringApplication.run(MybatisApplication.class, args);
    }

}
