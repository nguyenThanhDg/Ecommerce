package com.dev.service.Impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dev.pojo.User;
import com.dev.repository.UserRepository;
import com.dev.service.UserService;
import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service("userDetailsService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public boolean addUser(User user) {
        try {
            String pass = user.getPassword();
            user.setPassword(this.passwordEncoder.encode(pass));
            Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            user.setAvatar((String) r.get("secure_url"));
            user.setCreatedDate(new Date());
            return this.userRepository.addUser(user);

        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public List<User> getUsers(String username) {
        return userRepository.getUsers(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUsers(username);
        if (users.isEmpty()) {
            throw new UsernameNotFoundException("Không tồn tại!");
        }
        User u = users.get(0);
        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getUserRole()));
        return new org.springframework.security.core.userdetails.User(
                u.getUsername(), u.getPassword(), authorities);
    }

    @Override
    public User getUserById(int id) {
        return this.userRepository.getUserById(id);
    }

    @Override
    public boolean updateUser(User user, int id) {
        return this.userRepository.updateUser(user, id);
    }

    @Override
    public boolean checkUserName(String string) {
        return this.userRepository.checkUserName(string);
    }

    @Override
    public User findById(int id) {
        return this.userRepository.findById(id);
    }

    @Override
    public User getUserByUsername(String username) {
        return this.userRepository.getUserByUsername(username);
    }

    @Override
    public List<User> getSeller() {
        return this.userRepository.getSeller();
    }

    @Override
    public List<User> getRegisterSeller() {
        return this.userRepository.getRegisterSeller();
    }

    @Override
    public List<User> getCustomer() {
        return this.userRepository.getCustomer();
    }

    @Override
    public boolean acceptSeller(int id) {
        return this.userRepository.acceptSeller(id);
    }

    @Override
    public boolean cancelSeller(int id) {
        return this.userRepository.cancelSeller(id);
    }

    @Override
    public boolean checkSuperAdmin(int id) {
        return this.userRepository.checkSuperAdmin(id);
    }

    @Override
    public List<User> getAdmin() {
        return this.userRepository.getAdmin();
    }

    @Override
    public boolean addUGoogleUser(User user) {
        try {
            user.setCreatedDate(new Date());
            user.setUsername(user.getEmail());
            return this.userRepository.addUser(user);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean checkGoogleUser(String string) {
        return this.userRepository.checkGoogleUser(string);
    }

    @Override
    public User getUserByGoogleId(String string) {
        return this.userRepository.getUserByGoogleId(string);
    }

}
