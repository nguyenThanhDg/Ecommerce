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
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Hi
 */
@RestController
@RequestMapping("/api")
public class ApiRatingController {

    @Autowired
    private RatingService ratingService;

    @Autowired
    private ProductService productService;

    @PostMapping(path = "/add-rating", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Rating> addRating(@RequestBody Map<String, String> params, HttpSession session) {
        User u = (User) session.getAttribute("currentUser");
        if (u != null)
            try {
            String rate = params.get("rate");
            int productId = Integer.parseInt(params.get("productId"));
            Product product = this.productService.getProductById(productId);
                System.err.println("toiday");
            if (this.ratingService.checkUserAndPro(u, product).isEmpty()) {
                Rating r = this.ratingService.insertRating(rate, u, product);
                return new ResponseEntity<>(r, HttpStatus.CREATED);
            } else {
                Rating r = this.ratingService.updateRating(this.ratingService.checkUserAndPro(u, product).get(0).getId(), rate);
                return new ResponseEntity<>(r, HttpStatus.OK);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
