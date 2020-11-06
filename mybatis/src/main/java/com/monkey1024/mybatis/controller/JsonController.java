package com.monkey1024.mybatis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.monkey1024.mybatis.util.HttpRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class JsonController {
    @GetMapping("/json")
    public String Json(){
        System.out.println("********************开始**************************");

        String get_url="http://hwota.cn/RESTfulApi/1.0/hwtc/getota/cdc/HW001/xxx_1001/xxx_0/psn001/hwid";

        String get_res= HttpRequest.sendGet(get_url, "key=123&v=456");
        System.out.println("get_res: "+get_res);
        System.out.println();

        //将字符串对象转换为json对象
        JSONObject jsonObject = JSON.parseObject(get_res);
        System.out.println(jsonObject);
        System.out.println("jsonObject类型是： "+getType(jsonObject));

        Integer status_code=jsonObject.getInteger("status_code");
        System.out.println("status_code: "+status_code);

        //根据status_code来判断，如果是200，拿到json  否则 拿到字符串
        if(status_code==200){
            System.out.println("进入200逻辑判断！");

            //把中间的数组拿出来
//            JSONArray jsonArray = jsonObject.getJSONArray("data");
            JSONObject object = jsonObject.getJSONObject("data");
            System.out.println("object： "+getType(object));
            System.out.println(object);
            System.out.println("下面是取出object里的数据***********************");
            System.out.println(object.getString("ota_version"));
            System.out.println(object.getString("mcu_version"));
        }else{
            String data=jsonObject.getString("data");
            System.out.println(data);
        }




        return get_res;

    }


    public static String getType(Object o){ //获取变量类型方法
        return o.getClass().toString(); //使用int类型的getClass()方法
    }
}
