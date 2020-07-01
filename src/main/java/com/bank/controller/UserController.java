package com.bank.controller;

import com.bank.model.User;
import com.bank.service.UserService;
import com.bank.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    @ResponseBody
    public String login(String username, String password, String code, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String saveCode = (String) session.getAttribute("code");
        if(!saveCode.equals(code)) {
            return "code";
        } else {
            User user = userService.selectByName(username);
            if(user.getPassword().equals(password)) {
                request.getSession().setAttribute("user", user);
                return "success";
            }
        }
        return "fail";
    }

    @PostMapping("/logout")
    @ResponseBody
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "success";
    }

    @GetMapping("/all")
    public String all() {
        return "index";
    }

    @GetMapping("/author")
    public String author() {
        return "author";
    }
}
