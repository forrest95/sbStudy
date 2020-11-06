package com.monkey1024.mybatis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CrudController {

    @RequestMapping("/hello")
    public String helloThymeleaf(Model model) {

        model.addAttribute("name", "jack");

        return "crud";

    }
}
