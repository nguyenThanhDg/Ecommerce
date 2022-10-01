/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service;

import com.dev.pojo.Product;
import com.dev.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface ProductService {

    List<Product> getNewProducts();

    Product getProductById(int productId);

    long countProduct();

    boolean addOrUpdate(Product product);
    boolean addProduct(Product p);
    List<Product> getProductsByUser(User user);
    void deleteProduct(int id);
    List<Product> getProducts(String kw);
    List<Product> getProducts(Map<String, String> params, int page);
}
