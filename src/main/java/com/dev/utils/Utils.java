/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.utils;

import com.dev.pojo.Cart;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author DELL
 */
public class Utils {
    public static int countCart(Map<Integer,Cart> cart){
        int count = 0;
        if(cart != null) // nếu cart khác null
        {
            for(Cart c: cart.values()) //Trả ra danh sách các giá trị của giỏ
                count += c.getQuantity();
        }
        return count;
    }
    
    public static Map<String, String> totalMoney(Map<Integer,Cart> cart)
    {
        Long total = 0l;
        int count = 0;
        
        if(cart!=null)
        {
            for (Cart c: cart.values()){
                count += c.getQuantity();
                total += c.getQuantity()* c.getPrice();
            }
        }
        Map<String, String> result = new HashMap<>();
        result.put("total", String.valueOf(total));
        result.put("quantity", String.valueOf(count));
        
        return result;
    }
}
