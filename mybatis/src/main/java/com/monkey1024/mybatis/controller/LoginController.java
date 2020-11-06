package com.monkey1024.mybatis.controller;

import com.alibaba.fastjson.JSONObject;
import com.monkey1024.mybatis.bean.User;
import com.monkey1024.mybatis.service.UserService;
import com.monkey1024.mybatis.util.JwtUtil;
import com.monkey1024.mybatis.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author: yaohuif
 * @create: 2020-09-08 10:36
 * @description:
 **/
//@Controller
//@RequestMapping
//@Slf4j
@RestController
@RequestMapping("/api")
public class LoginController {

    @Autowired
    private UserService userService;


    @PostMapping("login")
    @ResponseBody
    public ResultData login (@RequestBody Map<String,String> map){
        String loginName = map.get("loginName");
        String passWord = map.get("passWord");
        //身份验证
        boolean isSuccess =  userService.checkUser(loginName,passWord);
        if (isSuccess) {
            //模拟数据库查询
            User user = userService.getUser(loginName);
            if (user != null) {
                //返回token
                String token = JwtUtil.sign(loginName, passWord);
                if (token != null) {
                    return ResultData.success(token,"成功");
                }
            }
        }
        return ResultData.fail("299","报错啦");
    }

    @PostMapping("getUser")
    @ResponseBody
    public ResultData getUserInfo(HttpServletRequest request, @RequestBody Map<String, String> map){
        String loginName = map.get("loginName");
        String token = request.getHeader("token");
        boolean verity = JwtUtil.verity(token);
        if (verity) {
            User user = userService.getUser(loginName);
            if (user != null) {
//                return AjaxResult.success("成功", JSONObject.toJSONString(user));
                return ResultData.success("成功", JSONObject.toJSONString(user));
            }
        }
        return ResultData.fail("444","失败啦");
    }
}
