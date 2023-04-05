/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service.Impl;

import com.dev.pojo.Product;
import com.dev.pojo.Rating;
import com.dev.pojo.User;
import com.dev.repository.RatingRepository;
import com.dev.service.RatingService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Hi
 */
@Service
public class RatingServiceImpl implements RatingService{
    @Autowired
    private RatingRepository ratingRepository;

    @Override
    public Rating insertRating(String content, User user, Product product) {
        return this.ratingRepository.insertRating(content, user, product);
    }

    @Override
    public void selectRatingByUser(int userId) {
        this.ratingRepository.selectRatingByUser(userId);
    }

    @Override
    public void selectRatingByProduct(int productId) {
        this.ratingRepository.selectRatingByProduct(productId);
    }

    @Override
    public Rating updateRating(int id, String content) {
        return this.ratingRepository.updateRating(id, content);
    }

    @Override
    public long avgRating(int id) {
        return this.ratingRepository.avgRating(id);
    }

    @Override
    public List<Rating> checkUserAndPro(User user, Product product) {
        return this.ratingRepository.checkUserAndPro(user, product);
    }
}
