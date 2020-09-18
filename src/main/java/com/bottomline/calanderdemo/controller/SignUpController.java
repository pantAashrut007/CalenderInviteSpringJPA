package com.bottomline.calanderdemo.controller;

import com.bottomline.calanderdemo.model.Login;
import com.bottomline.calanderdemo.repo.LoginRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class SignUpController {

    @Autowired
    LoginRepo lrepo;

    @RequestMapping("addUser")
    public String addDetails(@ModelAttribute Login login, Model model){

        String pass = login.getPass();
        String repass = login.getRepass();
        String uname = login.getUname();

        //checking if username exist in db
        List<Login> loginList = lrepo.findAll();
        for(int i=0; i<loginList.size(); i++){
            String[] demoLoginList = loginList.get(i).toString().split("-");
            if(uname.equals(demoLoginList[0])){
                model.addAttribute("error", "Username already exists");
                return "signUp";
            }
        }
        //checking if password match while creating a new account
        if(pass.equals(repass)){
            lrepo.save(login);
            model.addAttribute("addmsg","User added Successfully");
            return "login";
        }
        else{
            model.addAttribute("error","passwords do not match");
            return "signUp";
        }

    }

}
