package com.zll.controller;

import com.zll.model.User;
import com.zll.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @description userController
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * @description 登录界面
     */
    @RequestMapping("/login")
    public String login() {
    	return "login";
    }

    /**
     * @description 注册界面
     */
    @RequestMapping("/regist")
    public String regist() {
    	return "register";
    }

    /**
     * @description 校验登录
     * @param name
     * @param pwd
     * @return String
     */
    @RequestMapping("/checkLogin")
    public String login(HttpServletRequest request,@RequestParam("name") String name,@RequestParam("pwd") String pwd) {
    	 System.out.println(name+"  "+pwd);
    	 User user = userService.checkLogin(name,pwd);
         if(user!=null){
             System.out.println(user.getName()+"  "+user.getPwd());
             request.setAttribute("name", name); 
             return "main";
         }else{
        	 request.setAttribute("msg", "用户名或密码错误！"); 
        	  return "login";
         }
    }

    /**
     * @description 添加用户
     * @param name
     * @param pwd
     * @param tel
     * @return String
     */
    @RequestMapping("/addUser")
    public String addUser(HttpServletRequest request,@RequestParam("name") String name,@RequestParam("pwd") String pwd,@RequestParam("tel") String tel) {
        int count=userService.addUser(name,pwd,tel);
        if(count>0){
            request.setAttribute("msg", "注册成功！");
            return "login";
        }
        else if(count==-1){
            request.setAttribute("msg", "用户名已存在！请重新输入！");
        }
        else {
            request.setAttribute("msg", "注册失败！");
        }
        return "register";
    }

    /**
     * @description 查询所有用户
     * @param request
     * @return List<User>
     */
    @RequestMapping("/queryAllUser")
    @ResponseBody
    public List<User> queryAllUser(HttpServletRequest request) {
        List<User> users=userService.queryAllUser();
        return users;
    }
}
