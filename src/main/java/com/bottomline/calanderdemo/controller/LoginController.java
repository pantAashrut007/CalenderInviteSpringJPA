package com.bottomline.calanderdemo.controller;

import com.bottomline.calanderdemo.model.Login;
import com.bottomline.calanderdemo.model.Meeting;
import com.bottomline.calanderdemo.repo.LoginRepo;
import com.bottomline.calanderdemo.repo.MeetingRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LoginController {

    @Autowired
    LoginRepo lrepo;

    @Autowired
    MeetingRepo mrepo;

    @RequestMapping("/")
    public String loginPage(){
        return "login";
    }

    @RequestMapping("signup")
    public String signUp(){
        return "signUp";
    }

    @PostMapping("homepage")
    public String homepage(@RequestParam("uname") String uname,
                           @RequestParam("password") String pass,
                           Model model){

        List<Login> loginList = lrepo.findAll();
        //Loging in with the right redentials
        for(int i = 0; i<loginList.size(); i++){
            String[] data = loginList.get(i).toString().split("-");
            if(data[0].equals(uname) && data[1].equals(pass)){
                model.addAttribute("name", data[2]);

                List<Meeting> list = mrepo.find(data[2]);
                model.addAttribute("list",list);
                return "homepage";
            }
        }
        model.addAttribute("loginError","Please enter correct username and password");
        return "login";
    }

}
