/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service.Impl;

import com.dev.repository.RatingRepository;
import com.dev.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Hi
 */
public class RatingServiceImpl implements RatingService{
    @Autowired
    private RatingRepository ratingRepository;

    @Override
    public void insertRating() {
    }

    @Override
    public void selectRatingByUser() {
    }

    @Override
    public void selectRatingByProduct() {
    }

    @Override
    public void removeRating(int id) {
    }

    @Override
    public void updateRating(int id) {
    }
  
}
