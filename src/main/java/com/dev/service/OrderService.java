/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dev.service;

import com.dev.pojo.Cart;
import com.dev.pojo.SaleOrder;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DELL
 */
public interface OrderService {

    boolean addReceipt(Map<Integer, Cart> cart, int id);

    List<Object[]> getOrderDetailById(int id);
    List<Object[]> getWaitOrderBySeller(int id);
    SaleOrder getSaleOrderById(int id);
}
