package com.aiit.zhly.controller;

import com.aiit.zhly.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/*
 * @Author:总会落叶
 * @Date:2025/12/24
 * @Description:
 */
@Controller
public class UserController {
    @Autowired
    private UserDao userDao;

    //跳转到登录页面
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    //用户登录
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session){
        if(userDao.login(username,password)>0){
            session.setAttribute("username",username);
            session.setAttribute("password",password);
            return "redirect:/courseList";
        }else {
            return "login";
        }
    }

}
