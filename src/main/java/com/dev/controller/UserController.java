/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.pojo.User;
import com.dev.service.UserService;
import com.dev.validator.UsernameValidator;
import com.dev.validator.WebAppValidator;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Admin
 */
@Controller
public class UserController {

    @Autowired
    private UserService userDetailsService;
    
//    @Autowired
//    private WebAppValidator userValidator;
//    
//    @InitBinder
//    public void initBinder(WebDataBinder binder){
//        binder.setValidator(userValidator);
//    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value = "user") @Valid User user, BindingResult result) {
        System.out.println(result);
        if (!result.hasErrors()) {
            if (!user.getPassword().equals(user.getConfirmPassword())) {
                model.addAttribute("errMsg", "Mat khau khong hop le");
            } else {
                if (this.userDetailsService.addUser(user) == true) {
                    return "redirect:/login";
                }
                model.addAttribute("errMsg", "Co loi xay ra vui long thu lai sau");
            }
        }

        return "register";
    }
}
