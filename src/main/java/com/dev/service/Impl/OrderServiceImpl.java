/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service.Impl;

import com.dev.pojo.Cart;
import com.dev.pojo.SaleOrder;
import com.dev.repository.OrderRepository;
import com.dev.service.OrderService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    private OrderRepository orderRepository;

    @Override
    public boolean addReceipt(Map<Integer, Cart> cart, int id) {
        return this.orderRepository.addReceipt(cart, id);
    }

    
    @Override
    public SaleOrder getSaleOrderById(int id) {
        return this.orderRepository.getSaleOrderById(id);
    }

    @Override
    public List<Object[]> getOrderDetailById(int id) {
        return this.orderRepository.getOrderDetailById(id);
    }
    
}
