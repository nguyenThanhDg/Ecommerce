/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dev.repository.Impl;

import com.dev.pojo.Cart;
import com.dev.pojo.OrderDetail;
import com.dev.pojo.Product;
import com.dev.pojo.SaleOrder;
import com.dev.pojo.User;
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
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.query.Query;

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
            Map<String, String> totalMoney = Utils.totalMoney(cart);
            o.setTotal(Long.parseLong(totalMoney.get("total")));
            o.setCustomerId(this.userRepository.getUserById(id));
            session.save(o);
            
            for (Cart c : cart.values()) {
                // giam quantity
                this.productRepository.decreaseQuantity(c.getProductId(), c.getQuantity());
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(o);
                orderDetail.setOrderProduct(this.productRepository.getProductById(c.getProductId()));
                orderDetail.setUnitPrice(c.getPrice());
                orderDetail.setNum(c.getQuantity());
                orderDetail.setStatus(OrderDetail.PAY);
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

    @Override
    public List<Object[]> getOrderDetailById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root rootSo = query.from(SaleOrder.class);
        Root rootOd = query.from(OrderDetail.class);
        Root rootP = query.from(Product.class);
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(builder.equal(rootSo.get("customerId"), id));
        predicates.add(builder.equal(rootOd.get("orderId"), rootSo.get("id")));
        predicates.add(builder.equal(rootP.get("id"), rootOd.get("orderProduct")));
        query.multiselect(rootSo.get("createdDate"),rootOd.get("unitPrice"), rootOd.get("num"),rootOd.get("status"),rootP.get("image"),rootP.get("name"),rootOd.get("id"),rootOd.get("type"));
        query = query.orderBy(builder.desc(rootSo.get("createdDate")));
        query.where(predicates.toArray(new Predicate[] {}));
        Query q = session.createQuery(query);
        System.out.println(q.getResultList());
        return q.getResultList();
    }

//    @Override
//    public List<Object[]> getWaitOrderBySeller(int id) {
//        Session session = this.sessionFactory.getObject().getCurrentSession();
//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
//        Root rootSo = query.from(SaleOrder.class);
//        Root rootOd = query.from(OrderDetail.class);
//        Root rootP = query.from(Product.class);
//        Root rootU = query.from(User.class);
//        List<Predicate> predicates = new ArrayList<>();
//        predicates.add(builder.equal(rootOd.get("orderId"), rootSo.get("id")));
//        predicates.add(builder.equal(rootOd.get("status"), OrderDetail.WAIT));
//        predicates.add(builder.equal(rootU.get("id"), rootSo.get("customerId")));
//        predicates.add(builder.equal(rootP.get("id"), rootOd.get("orderProduct")));
//        predicates.add(builder.equal(rootP.get("sellerId"), id));
//        query.multiselect(rootSo.get("createdDate"),rootOd.get("unitPrice"), rootOd.get("num"),rootOd.get("id"),rootP.get("image"),rootP.get("name"),rootU.get("firstName"),rootU.get("lastName"));
//        query = query.orderBy(builder.desc(rootSo.get("createdDate")));
//        query.where(predicates.toArray(new Predicate[] {}));
//        Query q = session.createQuery(query);
//        return q.getResultList();
//    }

}
