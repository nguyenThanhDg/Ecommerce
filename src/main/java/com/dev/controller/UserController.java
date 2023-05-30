/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.pojo.Google;
import com.dev.pojo.User;
import com.dev.service.UserService;
import com.dev.utils.GoogleConfig;
import com.dev.validator.UsernameValidator;
import com.dev.validator.WebAppValidator;
import org.springframework.security.core.userdetails.UserDetails;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Controller
public class UserController {

    @Autowired
    private UserService userDetailsService;

    @Autowired
    private GoogleConfig googleUtils;

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

    @RequestMapping("/login-google")
    public String loginGoogle(HttpServletRequest request) throws ClientProtocolException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            return "redirect:/login?message=google_error";
        }
        String accessToken = googleUtils.getToken(code);
        Google googlePojo = googleUtils.getUserInfo(accessToken);
        if (this.userDetailsService.checkGoogleUser(googlePojo.getId()) == true) {
            User user = new User();
            user.setAvatar(googlePojo.getPicture());
            user.setGoogleId(googlePojo.getId());
            user.setEmail(googlePojo.getEmail());
            user.setFirstName(googlePojo.getFamily_name());
            user.setLastName(googlePojo.getGiven_name());
            this.userDetailsService.addUGoogleUser(user);
        }
        User user = this.userDetailsService.getUserByGoogleId(googlePojo.getId());
        request.getSession().setAttribute("currentUser", user);
        UserDetails userDetail = googleUtils.buildUser(googlePojo);
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
                userDetail.getAuthorities());
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);
//                String name = request.getUserPrincipal().getName();
//        System.out.print(name + " dayne");
        return "redirect:/";
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
