/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.pojo.Product;
import com.dev.pojo.Rating;
import com.dev.pojo.User;
import com.dev.service.ProductService;
import com.dev.service.RatingService;
import com.dev.service.UserService;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private RatingService ratingService;

    @GetMapping("/products")
    public String products(Model model, @RequestParam(required = false) Map<String, String> params, HttpSession session) {
        model.addAttribute("products", this.productService.getNewProducts());
        model.addAttribute("counter", this.productService.countProduct());
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("products", this.productService.getProducts(params, page));
        return "products";
    }

    @GetMapping("/products/{productId}")
    public String detail(Model model, @PathVariable(value = "productId") int productId, HttpSession session) {
        User user = (User) model.getAttribute("currentUser");
        Product product = this.productService.getProductById(productId);
        model.addAttribute("product", product);
        model.addAttribute("avg", this.ratingService.avgRating(productId));
        model.addAttribute("amountComment", this.productService.countComment(productId));
        if (user != null) {
            List<Rating> rate = this.ratingService.checkUserAndPro(user, product);
            if (rate.isEmpty()) {
                model.addAttribute("rate", 0);
            } else {
                model.addAttribute("rate", rate.get(0).getRate());
            }
        }
        return "detail";
    }

}
