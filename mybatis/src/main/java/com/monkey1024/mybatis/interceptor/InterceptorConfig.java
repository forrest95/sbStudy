package com.monkey1024.mybatis.interceptor;

import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/**

 - /**： 匹配所有路径
 - /admin/**：匹配 /admin/ 下的所有路径
 - /secure/*：只匹配 /secure/user，不匹配 /secure/user/info

 */

/**
 * 拦截器配置类
 */
//@Configuration//表示该类会被spring容器创建
public class InterceptorConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration r1 = registry.addInterceptor(new MyInterceptor());
        //添加拦截请求
        r1.addPathPatterns("/**");
        //添加不拦截的请求
        r1.excludePathPatterns("/login");

        //上面跟下面的写法是一样的
        //registry.addInterceptor(new PermissionInterceptor()).addPathPatterns("/*").excludePathPatterns("/login");


        //下面是拦截器2
        InterceptorRegistration r2 = registry.addInterceptor(new MyInterceptor2());
        //添加拦截请求
        r2.addPathPatterns("/**");
        //添加不拦截的请求
        r2.excludePathPatterns("/login");
    }
}
