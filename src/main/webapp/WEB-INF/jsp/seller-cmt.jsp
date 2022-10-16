<%-- 
    Document   : seller-cmt
    Created on : Oct 15, 2022, 8:17:53 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="page-content">
    <section class="no-padding-bottom">
        <div class="">
            <div class="row">
                <div class="col-lg-12">
                    <div class="user-block block text-center">
                        <div class="avatar"><img src="${product.image}" alt="..." class="img-fluid">
                        </div><a href="#" class="user-title">
                            <span>${product.name}</span></a>
                        <div class="contributions">${product.createdDate}</div>
                        <div class="details d-flex">
                            <div class="item"><strong>${product.price}</strong></div>
                            <div class="item"><strong>${product.categoryId.name}</strong></div>
                            <div class="item"><strong>${product.status}</strong></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">                                           
                    <div class="messages-block block">

                        <div class="title"><strong>New Messages</strong></div>
                        <div class="messages"><a href="#" class="message d-flex align-items-center">
                                <c:forEach items="${cmts}" var="c">
                                    <div class="profile"><img src="${c.customerId.avatar}" alt="${c.customerId.firstName}" class="img-fluid">
                                        <div class="status online"></div>
                                    </div>
                                    <div class="content">   <strong class="d-block">${c.customerId.firstName} ${c.customerId.lastName}</strong><span class="d-block">${c.content}</span><small class="date d-block">${c.createdDate}</small></div></a>
                                </c:forEach>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
</div>