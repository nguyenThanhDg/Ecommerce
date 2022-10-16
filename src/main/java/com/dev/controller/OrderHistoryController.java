/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.pojo.User;
import com.dev.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Admin
 */
@Controller
public class OrderHistoryController {
    
    @Autowired
    private OrderService orderService;
    
    @GetMapping("/history")
    public String history(Model model) {
        User customer = (User) model.getAttribute("currentUser");
        model.addAttribute("orders", this.orderService.getOrderDetailById(customer.getId()));
        return "history";
    }
}
