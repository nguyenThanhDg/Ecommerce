/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.pojo.Product;
import com.dev.pojo.User;
import com.dev.service.OrderDetailService;
import com.dev.service.ProductService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/seller")
public class SellerController {

    @Autowired
    private ProductService productService;
    
    @Autowired
    private OrderDetailService orderDetailService;
    
    @GetMapping("/")
    public String index(Model model) {
        User seller = (User) model.getAttribute("currentUser");
        model.addAttribute("countProduct", this.productService.countProduct(seller.getId()));
        model.addAttribute("countOrder", this.orderDetailService.getAmountProduct(seller));
        return "seller-home";
    }

    @GetMapping("/add-product")
    public String viewAdd(Model model) {
        model.addAttribute("product", new Product());

        return "add-product";
    }

    @PostMapping("/add-product")
    public String add(Model model,
            @ModelAttribute(value = "product") @Valid Product p,
            BindingResult result) {
        User u = (User) model.getAttribute("currentUser");
        p.setSellerId(u);
        if (result.hasErrors()) {
            System.out.println(result);
            return "product_detail";
            
        }
        if (this.productService.addProduct(p) == true) {
            return "redirect:/";
        }
        return "/login";
    }
}
