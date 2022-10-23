/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.pojo.User;
import com.dev.service.OrderDetailService;
import com.dev.service.OrderService;
import com.dev.service.ProductService;
import com.dev.service.StatsService;
import com.dev.service.UserService;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    public JavaMailSender emailSender;

    @Autowired
    private StatsService statsService;

    @GetMapping("/")
    public String products(Model model, HttpSession session) {
        model.addAttribute("admins", this.userService.getAdmin());
        model.addAttribute("resellers", this.userService.getRegisterSeller());
        model.addAttribute("sellers", this.userService.getSeller());
        model.addAttribute("customers", this.userService.getCustomer());
        model.addAttribute("allproducts", this.productService.getAllProducts());
        return "admin";
    }

    @GetMapping("/{sellerId}/stats")
    public String stats(Model model, @PathVariable(value = "sellerId") int id, @RequestParam(value = "year", defaultValue = "2022") int year) {
        User seller = this.userService.findById(id);
        if (!"seller".equals(seller.getUserRole())) {
            return "error404";
        } else {
            model.addAttribute("chart", this.statsService.revenueStats(year, seller));
            return "stats";
        }
    }

}
