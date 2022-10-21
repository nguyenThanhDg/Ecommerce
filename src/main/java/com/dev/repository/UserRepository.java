/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.repository;

import com.dev.pojo.User;
import java.util.List;

public interface UserRepository {
    User getUserById(int userId);
    boolean addUser(User user);
    List<User> getUsers(String username);
    List<User> getSeller();
    List<User> getRegisterSeller();
    boolean updateUser(User user, int id);
    boolean checkUserName(String username);
    User findById(int id);
    User getUserByUsername(String username);
    List<User> getCustomer();
    boolean acceptSeller(int id);
    boolean cancelSeller(int id);
}
