/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Hi
 */
@RestController
@RequestMapping("/api/rating")
public class ApiRatingController {
    @Autowired
    private RatingService ratingService;
    
    @DeleteMapping("/products/{productId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteProduct(@PathVariable(value = "productId") int id) {
//        this.ratingService.deleteProduct(id);
    }
    
    @PostMapping("/products/{productId}")
    @ResponseStatus(HttpStatus.OK)
    public void pauseProduct(@PathVariable(value = "productId") int id) {
//        this.ratingService.pauseProduct(id);
    }
    
//    @PostMapping("/orders/cancel/{orderId}")
//    @ResponseStatus(HttpStatus.OK)
//    public void (@PathVariable(value = "orderId") int id) {
//        OrderDetail od = this.orderDetailService.getOrderDetailById(id);
//        this.productService.creaseQuantity(od.getOrderProduct().getId(), od.getNum());
//        this.orderDetailService.cancelOrder(id);
//    }
}
