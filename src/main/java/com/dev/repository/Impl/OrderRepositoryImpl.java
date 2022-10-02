/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.repository.Impl;

import com.dev.pojo.Cart;
import com.dev.pojo.OrderDetail;
import com.dev.pojo.SaleOrder;
import com.dev.repository.ProductRepository;
import com.dev.repository.UserRepository;
import com.dev.utils.Utils;
import java.util.Date;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.dev.repository.OrderRepository;

/**
 *
 * @author DELL
 */
@Repository
@Transactional
public class OrderRepositoryImpl implements OrderRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private ProductRepository productRepository;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addReceipt(Map<Integer, Cart> cart, int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            SaleOrder o = new SaleOrder();
            
            o.setCreatedDate(new Date());
            System.out.println(Long.parseLong(Utils.totalMoney(cart).get("total")));
            Map<String, String> totalMoney = Utils.totalMoney(cart);
            o.setTotal(Long.parseLong(totalMoney.get("total")));
            o.setCustomerId(this.userRepository.getUserById(id));
            session.save(o);
            
            for (Cart c : cart.values()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(o);
                orderDetail.setOrderProduct(this.productRepository.getProductById(c.getProductId()));
                orderDetail.setUnitPrice(c.getPrice());
                orderDetail.setNum(c.getQuantity());

                session.save(orderDetail);
            }
            return true;
        }catch(HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

   

    @Override
    public SaleOrder getSaleOrderById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(SaleOrder.class, id);
    }

}
