/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.service.OrderDetailService;
import com.dev.service.ProductService;
import com.dev.pojo.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admin
 */
@RestController
@RequestMapping("/api")
public class ApiOrderDetailController {

    @Autowired
    private OrderDetailService orderDetailService;
    
    @Autowired
    private ProductService productService;

    @PostMapping("/orders/commit/{orderId}")
    @ResponseStatus(HttpStatus.OK)
    public void commit(@PathVariable(value = "orderId") int id) {
        this.orderDetailService.waitOrder(id, "Money");
    }

    @PostMapping("/orders/cancel/{orderId}")
    @ResponseStatus(HttpStatus.OK)
    public void cancel(@PathVariable(value = "orderId") int id) {
        OrderDetail od = this.orderDetailService.getOrderDetailById(id);
        this.productService.creaseQuantity(od.getOrderProduct().getId(), od.getNum());
        this.orderDetailService.cancelOrder(id);
    }

    @PostMapping("/orders/pay/{orderId}")
    @ResponseStatus(HttpStatus.OK)
    public void pay(@PathVariable(value = "orderId") int id) {
        this.orderDetailService.payOrder(id);
    }

}
