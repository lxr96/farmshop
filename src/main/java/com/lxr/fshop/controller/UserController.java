package com.lxr.fshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lxr.fshop.pojo.User;
import com.lxr.fshop.pojo.UserDetail;
import com.lxr.fshop.service.UserDetailService;
import com.lxr.fshop.service.UserService;
import com.lxr.fshop.util.Page;


@Controller
@RequestMapping("")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    UserDetailService userDetailService;
 
    @RequestMapping("admin_user_list")
    public String list(Model model){
        List<User> us= userService.list();
        model.addAttribute("us", us);
        return "admin1/listUser";
    }
    
    @RequestMapping("admin_user_detail")
    public String detail(int id,Model model){
        User u = userService.get(id);
        UserDetail userDetail = userDetailService.get(u.getId());
        u.setUserDetail(userDetail);
        
        model.addAttribute("user", u);
        return "admin1/userDetail";
    }

}

