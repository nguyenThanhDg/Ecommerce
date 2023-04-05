/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.pojo.Product;
import com.dev.pojo.User;
import com.dev.service.OrderDetailService;
import com.dev.service.OrderService;
import com.dev.service.ProductService;
import com.dev.service.StatsService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    private StatsService statsService;
    
    @Autowired
    private OrderDetailService orderDetailService;
    
    @Autowired
    private OrderService orderService;
    
    @GetMapping("/")
    public String index(Model model,@RequestParam(required = false) Map<String, String> params,@RequestParam(value = "year", defaultValue = "2022") int year) {
        User seller = (User) model.getAttribute("currentUser");
        model.addAttribute("countProduct", this.productService.countProduct(seller.getId()));
        model.addAttribute("countOrder", this.orderDetailService.getAmountProduct(seller));
        model.addAttribute("totalRevenue", this.orderDetailService.totalRevenue(seller.getId()));
        model.addAttribute("hotProducts", this.productService.getHotProducts(3,seller.getId()));
        model.addAttribute("chart", this.statsService.revenueStats(year,seller));
//        model.addAttribute("waitOd", this.orderService.getWaitOrderBySeller(seller.getId()));
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);

        Date fromDate = null, toDate = null;

        try {
            String from = params.getOrDefault("fromDate", null);
            if (from != null) {
                fromDate = f.parse(from);
            }

            String to = params.getOrDefault("toDate", null);
            if (to != null) {
                toDate = f.parse(to);
            }
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        model.addAttribute("products", this.statsService.stats(kw, fromDate, toDate, seller.getId()));
        return "seller-home";
    }

    @GetMapping("/add-product")
    public String viewAdd(Model model) {
        model.addAttribute("product", new Product());

        return "add-product";
    }
    
    @GetMapping("/products/{productId}/comments")
    public String viewCmt(Model model,@PathVariable(value = "productId") int id) {
        model.addAttribute("product", this.productService.getProductById(id));
        model.addAttribute("cmts", this.productService.getComments(id));
        return "sellerComment";
    }
    
    @GetMapping("/products")
    public String listProducts(Model model) {
        User seller = (User) model.getAttribute("currentUser");
        model.addAttribute("products", this.productService.getProductsByUser(seller));

        return "listProducts";
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
            return "redirect:/seller/";
        }
        return "/login";
    }
    
    @GetMapping("/products/{productId}")
    public String detail(Model model, @PathVariable(value = "productId") int productId, HttpSession session) {
        model.addAttribute("product", this.productService.getProductById(productId));
        
        return "seller-detail";
    }
    
    @PostMapping("/products/update/{productId}")
    public String updateShipper(Model model, @ModelAttribute(value = "product") Product product, @PathVariable(value = "productId") int productId) {
        User seller = (User) model.getAttribute("currentUser");
        if (this.productService.updateProduct(product, productId, seller) == true) {
            return "redirect:/seller/products/";
        }
        return "redirect:/seller/";
    }
}
