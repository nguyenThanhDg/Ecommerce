/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.repository.Impl;

import com.dev.pojo.Product;
import com.dev.pojo.Rating;
import com.dev.pojo.User;
import com.dev.repository.RatingRepository;
import com.dev.repository.UserRepository;
import java.util.Date;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

/**
 *
 * @author Hi
 */
@Repository
@Transactional
public class RatingRepositoryImpl implements RatingRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Autowired
    private UserRepository userRepository;

    @Override
    public Rating insertRating(String content, User user, Product product) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Rating r = new Rating();
        r.setCustomerId(user);
        r.setProductId(product);
        r.setCreatedDate(new Date());
        r.setUpdatedDate(new Date());
        int rate = Integer.parseInt(content);
        r.setRate(rate);
        session.save(r);
        return r;
    }
    
    @Override
    public long avgRating(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select avg(rate) From Rating r where r.productId.id = :product");
        q.setParameter("product", id);
        if (q.getSingleResult() != null){
            long a = Math.round((double) q.getSingleResult());
        return a;}
        else
            return 5;
    }

    @Override
    public void selectRatingByUser(int userId) {
    }

    @Override
    public void selectRatingByProduct(int productId) {
    }
    
    @Override
    public List<Rating> checkUserAndPro(User user, Product product) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Rating> query = builder.createQuery(Rating.class);
        Root root = query.from(Rating.class);
        query = query.select(root);
        Predicate p1 = builder.equal(root.get("customerId"), user.getId());
        Predicate p2 = builder.equal(root.get("productId"), product.getId());
        query.where(builder.and(p1, p2));
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Rating updateRating(int id, String content) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Rating r = session.get(Rating.class, id);
        int rate = Integer.parseInt(content);
        r.setRate(rate);
        r.setUpdatedDate(new Date());
        return r;
    }
    
}
