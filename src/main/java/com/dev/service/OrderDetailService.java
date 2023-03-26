/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service;

import com.dev.pojo.OrderDetail;
import com.dev.pojo.User;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface OrderDetailService {
    int getAmountProduct(User user);
    long totalRevenue(int id);
    boolean waitOrder(int id, String type);
    boolean cancelOrder(int id);
    boolean payOrder(int id);
    OrderDetail getOrderDetailById(int id);
}
