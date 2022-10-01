/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service.Impl;

import com.dev.pojo.OrderDetail;
import com.dev.pojo.Product;
import com.dev.pojo.User;
import com.dev.repository.OrderDetailRepository;
import com.dev.repository.ProductRepository;
import com.dev.service.OrderDetailService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class OrderDetailServiceImpl implements OrderDetailService {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    public int getAmountProduct(User user) {
        List<Product> products = this.productRepository.getProductsByUser(user);
        int sum = 0;
        for (Product p : products) {
            sum = sum + this.orderDetailRepository.amountProductByProductId(p.getId());
        }
        return sum;
    }

}
