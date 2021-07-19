package com.chan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//处理重定向的类,没有数据处理
@Controller
public class PageJump {
//    去往管理员页面
    @RequestMapping("/toAdminIndex")
    public String toAdminIndex(){
        return "redirect:adminIndex";
    }
    @RequestMapping("/adminIndex")
    public String getAdminIndex(){
        return "adminIndex";
    }
//    去往读者借阅界面
    @RequestMapping("/toReaderIndex")
    public String toReaderIndex(){
        return "redirect:readerIndex";
    }
    @RequestMapping("/readerIndex")
    public String getReaderIndex(){
        return "readerIndex";
    }
//    去往注册页面
    @RequestMapping("/toRegister")
    public String toRegister(){
        return "redirect:register";
    }
    @RequestMapping("/register")
    public String getRegister(){
        return "register";
    }
//    去往登陆页面
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "redirect:login";
    }
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
}
