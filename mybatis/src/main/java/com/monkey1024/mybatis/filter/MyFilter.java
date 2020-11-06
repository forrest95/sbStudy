package com.monkey1024.mybatis.filter;

import com.monkey1024.mybatis.util.LogFile;

import javax.servlet.*;
import java.io.IOException;

//@WebFilter(urlPatterns="/*")
public class MyFilter implements Filter {

//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        System.out.println("进入filter过滤器");

        //start 写入txt
        LogFile.writeFile("d:/1MyFilter.log", "我是过滤器 的log");
        //end 写入txt

        chain.doFilter(request, response);
    }
    @Override
    public void destroy() {
    }
}
