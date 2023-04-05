
package com.dev.controller;

import com.dev.pojo.Cart;
import com.dev.utils.Utils;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class CartController {
    @GetMapping("/cart")
    public String gioHang(Model model, HttpSession session){
        
        // kiem tra có giỏ hàng chưa
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if(cart != null)// có giỏ rồi
            model.addAttribute("carts", cart.values());// ds các item bỏ vô giỏ
        else
            model.addAttribute("carts", null);
        
        model.addAttribute("totalMoney", Utils.totalMoney(cart));   
        return "cart";
    }
}

