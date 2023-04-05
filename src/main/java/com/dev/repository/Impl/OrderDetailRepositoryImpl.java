/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.repository.Impl;

import com.dev.pojo.OrderDetail;
import com.dev.pojo.Product;
import com.dev.pojo.SaleOrder;
import com.dev.pojo.User;
import com.dev.repository.OrderDetailRepository;
import com.dev.repository.ProductRepository;
import com.dev.repository.UserRepository;
import java.util.ArrayList;
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
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(root.get("orderProduct"), id));
        predicates.add(builder.equal(root.get("status"), OrderDetail.COMPLETE));
        query.where(predicates.toArray(new Predicate[] {}));
        Query q = session.createQuery(query);
        if (q.getSingleResult() == null)
            return 0;
        
        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public long totalRevenue(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root root = query.from(OrderDetail.class);
        query = query.select(root);
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(root.get("orderProduct"), id));
        predicates.add(builder.equal(root.get("status"), OrderDetail.COMPLETE));
        query.where(predicates.toArray(new Predicate[] {}));
        query.select(builder.sum(builder.prod(root.get("unitPrice"), root.get("num"))));
        Query q = session.createQuery(query);
        if (q.getSingleResult() == null)
            return 0;
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public boolean waitOrder(int id, String type) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            OrderDetail p = session.get(OrderDetail.class, id);
            p.setStatus(OrderDetail.COMPLETE);
            p.setType(type);
            session.save(p);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean cancelOrder(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            OrderDetail p = session.get(OrderDetail.class, id);
            p.setStatus(OrderDetail.CANCEL);
            System.out.println("da hoan thanh");
            session.save(p);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean payOrder(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            OrderDetail p = session.get(OrderDetail.class, id);
            p.setStatus(OrderDetail.PAY);
            session.save(p);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public OrderDetail getOrderDetailById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(OrderDetail.class, id);
    }

}
