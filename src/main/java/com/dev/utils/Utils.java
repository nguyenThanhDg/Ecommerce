/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.utils;

import com.dev.pojo.Cart;
import java.util.HashMap;
import java.util.Map;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Hex;

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
    
    public static String toSHA256(String secretkey, String data) {
        try {
            Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
            SecretKeySpec secret_key = new SecretKeySpec(secretkey.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
            sha256_HMAC.init(secret_key);

            return Hex.encodeHexString(sha256_HMAC.doFinal(data.getBytes(StandardCharsets.UTF_8)));

        } catch (NoSuchAlgorithmException | InvalidKeyException  e) {
            e.printStackTrace();
        }

        return null;
    }
}
