package com.cct.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class CenterController {

    @RequestMapping("/")
    public String toLogin1() {
        return "login";
    }

    @RequestMapping("/toLogin.do")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/index.do")
    public String index() {
        return "index";
    }

    @RequestMapping("/toRegister.do")
    public String register(){
        return "register";
    }
}
