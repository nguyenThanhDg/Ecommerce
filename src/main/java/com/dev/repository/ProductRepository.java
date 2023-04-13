/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.repository;

import com.dev.pojo.Comment;
import com.dev.pojo.Product;
import com.dev.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface ProductRepository {
    List<Product> getNewProducts();
    Product getProductById(int productId);
    long countProduct(int id);
    boolean addOrUpdate(Product product);
    List<Product> getProductsByUser(User user);
    List<Product> getAllProducts();
    void deleteProduct(int id);
    void pauseProduct(int id);
    List<Product> getProducts(String kw);
    boolean addProduct(Product p);
    List<Product> getProducts(Map<String, String> params, int page);
    List<Comment> getComments(int productId);
    Comment addComment(String content, int productId);
    List<Object[]> getHotProducts(int num, int id);
    boolean updateProduct(Product product, int id, User seller);
    long countProduct();
    long countComment(int id);
    void decreaseQuantity(int idProduct,int quantity);
    void creaseQuantity(int idProduct,int quantity);
    int getQuantity(int id);
}
