/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service;

import com.dev.pojo.Comment;
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
    List<Product> getAllProducts();
    Product getProductById(int productId);
    void pauseProduct(int id);
    long countProduct(int id);
    List<Object[]> getHotProducts(int num, int id);
    boolean addOrUpdate(Product product);
    boolean addProduct(Product p);
    List<Product> getProductsByUser(User user);
    void deleteProduct(int id);
    List<Product> getProducts(String kw);
    List<Product> getProducts(Map<String, String> params, int page);
    List<Comment> getComments(int productId);
    Comment addComment(String content, int productId);
    boolean updateProduct(Product product, int id, User seller);
    long countProduct();
    void decreaseQuantity(int idProduct,int quantity);
    void creaseQuantity(int idProduct,int quantity);
    int getQuantity(int id);
    long countComment(int id);
}
