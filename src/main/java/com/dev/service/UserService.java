/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.service;

import com.dev.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author Admin
 */
public interface UserService extends UserDetailsService {
    User getUserById(int userId);
    boolean addUser(User user);
    List<User> getUsers(String username);
    boolean updateUser(User user, int id);
    User findById(int id);
    List<User> getRegisterSeller();
    boolean checkUserName(String username);
    User getUserByUsername(String username);
    List<User> getSeller();
    List<User> getCustomer();
    boolean acceptSeller(int id);
    boolean cancelSeller(int id);
    boolean checkSuperAdmin(int id);
    List<User> getAdmin();
    boolean addUGoogleUser(User user);
}
