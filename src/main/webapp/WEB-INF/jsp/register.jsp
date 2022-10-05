<%-- 
    Document   : register
    Created on : Sep 23, 2022, 5:28:31 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="body-content">
    <div class="container">
        <div class="sign-in-page">
            <div class="row">

                <!-- create a new account -->
                <div class="col-md-8 col-sm-6 create-new-account">
                    <h4 class="checkout-subtitle">Tạo một tài khoản mới</h4>
                    <p class="text title-tag-line">Tạo tài khoản mới</p>
                    <c:url value="/register" var="action" />
                    <form:form method="post" action="${action}"  enctype="multipart/form-data" modelAttribute="user" class="register-form outer-top-xs" role="form">
                        <div class="form-group">
                            <label>Họ</label>
                            <form:input type="text" id="firstname" path="firstName" class="form-control unicase-form-control text-input"  />
                            <form:errors path="firstName" cssClass="text-danger" element="div" />
                        </div>
                        <div class="form-group">
                            <label>Tên</label>
                            <form:input type="text" id="lastname" path="lastName" class="form-control unicase-form-control text-input"  />
                            <form:errors path="lastName" cssClass="text-danger" element="div" />
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <form:input type="email" id="email" path="email" class="form-control unicase-form-control text-input"  />
                            <form:errors path="email" cssClass="text-danger" element="div" />
                        </div>
                        <div class="form-group">
                            <label class="info-title">Số điện thoại</label>
                            <form:input type="number" id="phone" path="phone" class="form-control unicase-form-control text-input"  />
                            <form:errors path="phone" cssClass="text-danger" element="div" />
                        </div>
                        <div class="form-group">
                            <label class="info-title">Loại tài khoản</label>
                            <form:select path="userRole" class="form-control unicase-form-control text-input">
                                <option value="customer">Người mua</option>
                                <option value="seller">Người bán</option>

                            </form:select>
                            <form:errors path="userRole" cssClass="text-danger" element="div" />
                        </div>
                        <div class="form-group">
                            <label class="info-title">Tên đăng nhập</label>
                            <form:input type="text" id="username" path="username" class="form-control" />
                            <form:errors path="username" cssClass="text-danger" element="div" />
                        </div>
                        <div class="form-group">
                            <label class="info-title">Mật khẩu</label>
                            <form:input type="password" id="password" path="password" class="form-control unicase-form-control text-input"  />
                            <form:errors path="password" cssClass="text-danger" element="div" />
                        </div>
                        <div class="form-group">
                            <label class="info-title">Nhập lại mật khẩu</label>
                            <form:input type="password" id="confirm-password" path="confirmPassword" class="form-control unicase-form-control text-input"  />
                            <form:errors path="password" cssClass="text-danger" element="div" />
                        </div>
                        <div class="form-group">
                            <label class="info-title">Ảnh đại diện</label>
                            <form:input type="file" id="avatar" path="file" class="form-control unicase-form-control text-input" />
                            <form:errors path="file" cssClass="text-danger" element="div" />
                        </div>
                        <button type="submit" class="btn-upper btn btn-primary checkout-page-button">Đăng ký</button>
                        
                    </form:form>


                </div>
                <!-- create a new account -->
            </div><!-- /.row -->
        </div><!-- /.sigin-in-->
    </div><!-- /.container -->
</div><!-- /.body-content -->
