/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dev.repository;

import com.dev.pojo.Product;
import com.dev.pojo.Rating;
import com.dev.pojo.User;
import java.util.List;

/**
 *
 * @author Hi
 */

public interface RatingRepository {
    Rating insertRating(String content, User user, Product product);
    void selectRatingByUser(int userId);
    void selectRatingByProduct(int productId);
    Rating updateRating(int id, String content);
    long avgRating(int id);
    List<Rating> checkUserAndPro(User user, Product product);
}
