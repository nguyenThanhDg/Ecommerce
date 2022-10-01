/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.repository.Impl;

import com.dev.pojo.OrderDetail;
import com.dev.pojo.Product;
import com.dev.repository.OrderDetailRepository;
import com.dev.repository.ProductRepository;
import com.dev.repository.UserRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Repository
@Transactional
public class OrderDetailRepositoryImpl implements OrderDetailRepository {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private UserRepository userRepository;


    @Override
    public int amountProductByProductId(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<OrderDetail> query = builder.createQuery(OrderDetail.class);
        Root root = query.from(OrderDetail.class);
        query = query.select(builder.sum(root.get("num")));
        Predicate p = builder.equal(root.get("orderProduct"), id);
        query = query.where(p);
        Query q = session.createQuery(query);
        if (q.getSingleResult() == null)
            return 0;
        
        return Integer.parseInt(q.getSingleResult().toString());
    }

}
