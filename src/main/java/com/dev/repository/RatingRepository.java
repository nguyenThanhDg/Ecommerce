/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dev.repository;

/**
 *
 * @author Hi
 */
public interface RatingRepository {
    void insertRating();
    void selectRatingByUser(int userId);
    void selectRatingByProduct(int productId);
    void removeRating(int id);
    void updateRating(int id);
}
