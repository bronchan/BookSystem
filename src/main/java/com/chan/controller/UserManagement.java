package com.chan.controller;

import com.chan.pojo.Admin;
import com.chan.pojo.Reader;
import com.chan.service.AdminServiceImpl;
import com.chan.service.ReaderServiceImpl;
import com.chan.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

//管理用户登陆和注册的类
@RestController
public class UserManagement {
    @Qualifier("adminServiceImpl")
    @Autowired
    AdminServiceImpl adminService;

    @Qualifier("readerServiceImpl")
    @Autowired
    ReaderServiceImpl readerService;

//    验证登陆时的信息
    @RequestMapping("/userCheck")
    public String userCheck(String username,String pwd,String entity){
        String msg;
        Admin admin = null;
        Reader reader = null;

        if (username!=null&&pwd!=null){
            if (StringUtil.isInteger(username)){
                if (entity.equals("admin")){
                    admin = adminService.getAdminById(new Integer(username));
                    if (admin!=null){
                        if (pwd.equals(admin.getPassword())){
                            msg = "账号密码正确";
                        }else {
                            msg = "密码错误";
                        }
                    }else {
                        msg = "查无此账号！";
                    }
                }else {
                    reader = readerService.getReaderById(new Integer(username));
                    if (reader!=null){
                        if (pwd.equals(reader.getPassword())){
                            msg = "账号密码正确";
                        }else {
                            msg = "密码错误";
                        }
                    }else {
                        msg = "查无此账号！";
                    }
                }
            }else {
                msg = "账号不是数字";
            }
        }else {
            msg = "账号或密码不能为空";
        }
        return msg;
    }
//    设置用户Session
    @RequestMapping("/userKeep")
    public void userKeep(HttpSession session,String username, String entity){
        if ("admin".equals(entity)){
            Admin admin = adminService.getAdminById(Integer.parseInt(username));
            session.setAttribute("user",admin);
            session.setAttribute("username",admin.getName());
            System.out.println(admin.getName());
        }else {
            Reader reader = readerService.getReaderById(Integer.parseInt(username));
            session.setAttribute("user",reader);
            session.setAttribute("username",reader.getName());
            System.out.println(reader.getName());
        }
    }
//    注册时信息检测
    @RequestMapping("/accountChecking")
    public String accountChecking(String userId,String entity) {
        boolean flag = StringUtil.isInteger(userId);
        String msg = null;
        if (flag) {
            int id = Integer.parseInt(userId);
            if (entity.equals("admin")) {
                Admin adminById = adminService.getAdminById(id);
                if (adminById == null) {
                    msg = "ok";
                } else {
                    msg = "当前用户已经存在";
                }
            } else {
                Reader readerById = readerService.getReaderById(id);
                if (readerById == null) {

                    msg = "ok";
                } else {
                    msg = "当前用户已经存在";
                }
            }
        }else{
                msg = "账号不为数字";
        }
        return msg;
    }
//    注册用户信息
    @RequestMapping("/registering")
    public String registering(String userName,String userId,String password,String entity){
        String msg = null;
        int id = Integer.parseInt(userId);
        if (entity.equals("admin")){
            Admin adminById = adminService.getAdminById(id);
            if (adminById ==null){
                Admin admin = new Admin(id, userName, password);
                adminService.add(admin);
                msg = "注册成功";
            }else {
                msg = "当前用户已经存在";
            }
        }else {
            Reader readerById = readerService.getReaderById(id);
            if (readerById==null){
                Reader reader = new Reader(id, userName, password);
                readerService.add(reader);
                msg = "注册成功";
            }else {
                msg = "当前用户已经存在";
            }

        }
        return msg;
    }
//    消除用户Session
    @RequestMapping("/userClear")
    public String userClear(HttpSession session){
        session.removeAttribute("user");
        return "用户注销成功";
    }

}
