/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dev.service;

/**
 *
 * @author Hi
 */
public interface RatingService {
    void insertRating();
    void selectRatingByUser();
    void selectRatingByProduct();
    void removeRating(int id);
    void updateRating(int id);
}
