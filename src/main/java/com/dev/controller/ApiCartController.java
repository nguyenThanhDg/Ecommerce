/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.pojo.Cart;
import com.dev.pojo.SaleOrder;
import com.dev.pojo.User;
import com.dev.service.OrderService;
import com.dev.service.UserService;
import com.dev.service.ProductService;
import com.dev.utils.Utils;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author DELL
 */
@RestController
@RequestMapping("/api")
public class ApiCartController {

    @Autowired
    private OrderService orderService;

    @Autowired
    public JavaMailSender emailSender;

    @Autowired
    public UserService userService;

    @Autowired
    public ProductService productService;

//    them vao gio hang
    @PostMapping("/cart")
    public Map<String, String> addToCart(@RequestBody Cart params, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        int productId = params.getProductId();
        if (cart.containsKey(productId) == true) {
            Cart c = cart.get(productId);
            c.setQuantity(c.getQuantity() + 1);
        } else {
            cart.put(productId, params);
        }

        session.setAttribute("cart", cart);
        return Utils.totalMoney(cart);
    }

    @PutMapping("/cart")
    public ResponseEntity<Map<String, String>> updateCartItem(@RequestBody Cart params, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        int productId = params.getProductId();
        if (cart.containsKey(productId) == true) {
            Cart c = cart.get(productId);
            c.setQuantity(params.getQuantity());
        }
        session.setAttribute("cart", cart);
        return new ResponseEntity<>(Utils.totalMoney(cart), HttpStatus.OK);
    }

    @DeleteMapping("/cart/{productId}")
    public ResponseEntity<Map<String, String>> deleteCartItem(@PathVariable(value = "productId") int id, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart != null && cart.containsKey(id)) {
            cart.remove(id);
            session.setAttribute("cart", cart);
        }
        return new ResponseEntity<>(Utils.totalMoney(cart), HttpStatus.OK);
    }

    @ResponseBody
    @PostMapping("/pay")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void pay(HttpSession session, Model model) {
        User user = (User) model.getAttribute("currentUser");
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        String htmlMsg = "Chào mừng " + user.getLastName() + ",<br><br>"
                + "Bạn đã đặt hàng thành công với các thông tin sản phẩm như sau:<br>"
                + "<table>"
                + "<tr><th>Tên sản phẩm</th><th>Giá sản phẩm</th><th>Số lượng</th><th>Thành tiền</th></tr>";
        if (this.orderService.addReceipt(cart, user.getId()) == true) {
            for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
                Cart cartItem = entry.getValue();
                String productName = cartItem.getProductName();
                int productQuantity = cartItem.getQuantity();
                double productPrice = cartItem.getPrice();
                double totalPrice = productQuantity * productPrice;
                htmlMsg += "<td>" + productName + "</td>"
                        + "<td>" + productPrice + "</td>"
                        + "<td>" + productQuantity + "</td>"
                        + "<td>" + totalPrice + "</td>"
                        + " Cảm ơn bạn đã mua hàng của chúng tôi.";
            }   
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(user.getEmail());
            message.setSubject("Xác nhận mua hàng");
            message.setText(htmlMsg);
            session.removeAttribute("cart");
            // Send Message!
            this.emailSender.send(message);
        }
    }

    @ResponseBody
    @PostMapping("/sellerConfirm/{sellerId}/accept")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void sellerConfirm(@PathVariable(value = "sellerId") int id) {
        System.out.println(id);
        User u = this.userService.findById(id);
        if (this.userService.acceptSeller(id) == true) {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(u.getEmail());
            message.setSubject("Thông báo trở thành người bán hàng");
            message.setText("Xin chào, thong tin của bạn đã được xác nhận. Bạn có thể đăng bán sản phảm");
            // Send Message!
            this.emailSender.send(message);
        }
    }

    @ResponseBody
    @PostMapping("/sellerConfirm/{sellerId}/cancel")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void sellerCancel(@PathVariable(value = "sellerId") int id) {
        User u = this.userService.findById(id);
        if (this.userService.cancelSeller(id) == true) {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(u.getEmail());
            message.setSubject("Thông báo từ chối");
            message.setText("Xin chào, thông tin của bạn đã được xem qua. Bạn không đủ điều kiện trở thành người bán");
            // Send Message!
            this.emailSender.send(message);
        }
    }
}
