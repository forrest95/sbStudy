package com.monkey1024.mybatis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.monkey1024.mybatis.bean.Category;
import com.monkey1024.mybatis.util.ResultData;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestController {
    @RequestMapping("/apitest")
    public String apitest(){
        String[] arr={"status_code","200","555"};

//        return arr;
        return JSON.toJSONString(arr);
    }

    @RequestMapping("/string")
    public  String createJsonString(String key, Object value) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("aa1", "bb1");
        jsonObject.put("aa2", "bb2");
        jsonObject.put("aa3", "bb3");

        return jsonObject.toString();
    }

    @RequestMapping("/resu")
    public ResultData test(){
        String[] arr={"status_code","200","555"};
        Integer[] arr1={1,2,3};

        Object o1 = new Category();
        Object o2 = new Category();
        Object o3 = new Category();

        Object[] objs = {o1,o2,o3};

        return ResultData.apireturn("200","success",objs);
    }
}
