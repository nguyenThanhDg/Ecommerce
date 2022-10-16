/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.controller;

import com.dev.pojo.Cart;
import com.dev.pojo.User;
import com.dev.service.OrderService;
import com.dev.utils.Utils;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpMethod;

/**
 *
 * @author Admin
 */
@Controller
public class MomoController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/pay-momo")
    public String payMomo(Model model,
            @RequestParam Map<String, String> params,
            HttpServletRequest request,
            HttpSession session) throws Exception {

        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        //parameters
        String endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";
        String amount = (Utils.totalMoney(cart).get("total"));
        String partnerCode = "MOMO";
        String accessKey = "F8BBA842ECF85";
        String secretKey = "K951B6PE1waDMi640xX08PD3vg6EkVlz";
        String requestId = partnerCode + new Date().getTime();
        String orderId = requestId;
        String orderInfo = "Thanh toan san pham bang momo";
        String redirectUrl = "http://localhost:8080/Ecommerce/momo-notify";
        String ipnUrl = "https://callback.url/notify";
        String requestType = "captureWallet";
        String extraData = ""; //pass empty value if your merchant does not have storesv
        //before sign HMAC SHA256 with format
        //accessKey=$accessKey&amount=$amount&extraData=$extraData&ipnUrl=$ipnUrl&orderId=$orderId&orderInfo=$orderInfo&partnerCode=$partnerCode&redirectUrl=$redirectUrl&requestId=$requestId&requestType=$requestType
        String rawSignature = "accessKey=" + accessKey + "&amount=" + amount + "&extraData=" + extraData + "&ipnUrl=" + ipnUrl + "&orderId=" + orderId + "&orderInfo=" + orderInfo + "&partnerCode=" + partnerCode + "&redirectUrl=" + redirectUrl + "&requestId=" + requestId + "&requestType=" + requestType;
        //puts raw signature
       
        //signature
        String signature = Utils.toSHA256(secretKey, rawSignature);
        Map<String, String> requestBody = new HashMap<>();
        {
            requestBody.put("partnerCode", partnerCode);
            requestBody.put("accessKey", accessKey);
            requestBody.put("requestId", requestId);
            requestBody.put("amount", amount);
            requestBody.put("orderId", orderId);
            requestBody.put("orderInfo", orderInfo);
            requestBody.put("redirectUrl", redirectUrl);
            requestBody.put("ipnUrl", ipnUrl);
            requestBody.put("extraData", extraData);
            requestBody.put("requestType", requestType);
            requestBody.put("signature", signature);
        }
        System.out.println(signature);
        String json = new ObjectMapper().writeValueAsString(requestBody);

        // Create a new RestTemplate instance
        RestTemplate rest = new RestTemplate();
        // create headers
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        headers.setContentLength(json.length());

        // Request to momo dev endpoint and get response 
        HttpEntity<String> requestEntity = new HttpEntity<String>(json, headers);
        ResponseEntity<String> responseEntity = rest.exchange(endpoint, HttpMethod.POST, requestEntity, String.class);
        System.out.println(responseEntity.getBody());

        Map<String, String> responseMap = new ObjectMapper().readValue(responseEntity.getBody(), Map.class);
        String payUrl = responseMap.get("payUrl");

        // Redirect sang giao diện thanh toán momo
        return "redirect:" + payUrl;
    }

    @RequestMapping(value = "/momo-notify")
    public String momoPostProcess(Model model,
            @RequestParam Map<String, String> params,
            HttpSession session) {

        System.out.println("test pay momo notify");
        System.err.println(params);

        int resultCode = Integer.parseInt(params.getOrDefault("resultCode", "1"));
        String errMsg = "";

        // Pojo
        User user = (User) session.getAttribute("currentUser");
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        // handle momo payment success 
        if (resultCode == 0) {
            // Set payment_status sang true
            if (this.orderService.addReceipt(cart, user.getId()) == false) {
                errMsg = "Đã có lỗi xảy ra";
                model.addAttribute("errMsg", errMsg);
                return "redirect:/cart";
            } else {
                return "redirect:/";
            }
        }

        // handle momo payment fail 
        if (resultCode != 0) {
            errMsg = "Đã có lỗi xảy ra trong quá tình thanh toán qua momo";
            model.addAttribute("errMsg", errMsg);
            return "redirect:/cart";
        }

        return "redirect:/cart";
    }
}
