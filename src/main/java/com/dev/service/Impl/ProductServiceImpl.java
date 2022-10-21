/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service.Impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dev.pojo.Comment;
import com.dev.pojo.Product;
import com.dev.pojo.User;
import com.dev.repository.ProductRepository;
import com.dev.service.ProductService;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductRepository productRepository;
    
    @Autowired
    private Cloudinary cloudinary;
    
    @Override
    public List<Product> getNewProducts() {
        return this.productRepository.getNewProducts();
    }
    
    @Override
    public long countProduct(int id) {
        return this.productRepository.countProduct(id);
    }

    @Override
    public Product getProductById(int productId) {
        return this.productRepository.getProductById(productId);
    }

    @Override
    public boolean addOrUpdate(Product product) {
        try {
            Map r = this.cloudinary.uploader().upload(product.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            product.setImage((String) r.get("secure_url"));
            product.setCreatedDate(new Date());
            return this.productRepository.addOrUpdate(product);
            
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        
        return false;
    }
    
    @Override
    public List<Product> getProducts(Map<String, String> params, int page) {
        return this.productRepository.getProducts(params, page);
    }

    @Override
    public List<Product> getProductsByUser(User user) {
        return this.productRepository.getProductsByUser(user);
    }


    @Override
    public void deleteProduct(int id) {
        this.productRepository.deleteProduct(id);
    }

    @Override
    public List<Product> getProducts(String kw) {
        return this.productRepository.getProducts(kw);
    }
    
    @Override
    public boolean addProduct(Product p) {
        try{
            Map r = this.cloudinary.uploader().upload(p.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            p.setImage((String) r.get("secure_url"));
            p.setCreatedDate(new Date());
            return this.productRepository.addProduct(p);
        }catch(IOException ex){
            ex.printStackTrace();
        }
       
        return false;
        
    }

    @Override
    public List<Comment> getComments(int productId) {
        return this.productRepository.getComments(productId);
    }

    @Override
    public Comment addComment(String content, int productId) {
        return this.productRepository.addComment(content, productId);
    }

    @Override
    public List<Object[]> getHotProducts(int num, int id) {
        return this.productRepository.getHotProducts(num, id);
    }

    @Override
    public void pauseProduct(int id) {
        this.productRepository.pauseProduct(id);
    }

    @Override
    public boolean updateProduct(Product product, int id, User seller) {
        return this.productRepository.updateProduct(product, id, seller);
    }

    @Override
    public List<Product> getAllProducts() {
        return this.productRepository.getAllProducts();
    }
}
