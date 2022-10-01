/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.repository.Impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dev.pojo.Product;
import com.dev.pojo.User;
import com.dev.repository.ProductRepository;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Repository
@Transactional
@EnableTransactionManagement
public class ProductRepositoryImpl implements ProductRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Product> getNewProducts() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Product> query = builder.createQuery(Product.class);
        Root root = query.from(Product.class);
        query = query.select(root);
        query.orderBy(builder.desc(root.get("id")));
        Query q = session.createQuery(query);
        int max = 5;
        q.setMaxResults(max);
        return q.getResultList();
    }

    @Override
    public Product getProductById(int productId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Product.class, productId);
    }
    
    @Override
    public boolean addProduct(Product p) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            session.save(p);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public long countProduct() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select count(*) from Product where status = :status");
        q.setParameter("status", "ON");
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public boolean addOrUpdate(Product product) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(product);

            return true;
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Product> getProductsByUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Product> query = builder.createQuery(Product.class);
        Root root = query.from(Product.class);
        query = query.select(root);
        Predicate p = builder.equal(root.get("customer"), user.getId());
        query = query.where(p);
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public void deleteProduct(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            Product p = session.get(Product.class, id);
            session.delete(p);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public List<Product> getProducts(String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Product> query = builder.createQuery(Product.class);
        Root root = query.from(Product.class);
        query = query.select(root);

        if (kw != null) {
            Predicate p = builder.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
            query = query.where(p);
        }
        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
    @Override
    public List<Product> getProducts(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Product> q = b.createQuery(Product.class);
        Root root = q.from(Product.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }

            String fp = params.get("fromPrice");
            if (fp != null) {
                Predicate p = b.greaterThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(fp));
                predicates.add(p);
            }

            String tp = params.get("toPrice");
            if (tp != null) {
                Predicate p = b.lessThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(tp));
                predicates.add(p);
            }

            String cateId = params.get("cateId");
            if (cateId != null) {
                Predicate p = b.equal(root.get("categoryId"), Integer.parseInt(cateId));
                predicates.add(p);
            }

            q.where(predicates.toArray(new Predicate[]{}));
        }

        Query query = session.createQuery(q);
        int max = 12;
        query.setMaxResults(max);
        query.setFirstResult((page - 1) * max);

        return query.getResultList();
    }
}
