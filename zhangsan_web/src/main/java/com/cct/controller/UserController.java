package com.cct.controller;

import com.cct.beans.User;
import com.cct.service.UserService;
import com.cct.util.Vo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")

public class UserController {
    @Resource
    private UserService userService;

    @ResponseBody
    @RequestMapping("/login.do")
    public Vo login(String userIdentity, String password, HttpSession session)  {
        User user = new User();
        user.setUserIdentity(userIdentity);
        try {
            User user1 = userService.login(user);
            if (null!=user1 || "".equals(user1)){
                if (password.equals(user1.getUserPassword())){
                    session.setAttribute("user",user1);
                    return new Vo(1,"登陆成功");
                } else {
                    return new Vo(0,"密码错误");
                }
            }else {
                return new Vo(2,"查无此人");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return  new Vo(2,"查无此人");
        }
    }

    @RequestMapping("/logou.do")
    public String logou(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        session.invalidate();
        return "login";
    }

    /**
     * 通过身份证号判断是否已存在
     */
    @ResponseBody
    @RequestMapping("/selectByUserIdentity.do")
    public Vo userIdentity(String userIdentity){
        try {
            User user = userService.selectByUserIdentity(userIdentity);
            if (null == user || " ".equals(user)){
                return new Vo(1,"11");
            } else {
                return new Vo(0,"用户身份证号已存在");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Vo(0,"查询失败，请稍后重试");
        }
    }


    /**
     * 判断用户名是否存在
     */
    @ResponseBody
    @RequestMapping("/selectByName.do")
    public Vo selectByName(String name){
        try {
            User user = userService.selectByName(name);
            if (null == user || " ".equals(user)){
                return new Vo(1,"11");
            } else {
                return new Vo(0,"用户身份证号已存在");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Vo(0,"查询失败，请稍后重试");
        }
    }




    @ResponseBody
    @RequestMapping("/register.do")
    public Vo regists(String userIdentity,String name,String password,String password1){
        if (password.equals(password1)){
            User user = new User();
            user.setUserIdentity(userIdentity);
            user.setUserName(name);
            user.setUserPassword(password);
            try {
                int registe = userService.registe(user);
                return new Vo(1,"注册成功，是否登陆？");
            } catch (Exception e) {
                e.printStackTrace();
                return new Vo(0,"注册失败");
            }
        } else {
            return new Vo(0,"俩次密码不一致");
        }
    }
}
