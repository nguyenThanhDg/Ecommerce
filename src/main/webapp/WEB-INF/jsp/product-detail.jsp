<%-- 
    Document   : product-detail
    Created on : Sep 24, 2022, 11:46:36 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-xs-12 col-sm-12 col-md-12">
    <div class="breadcrumb">
        <div class="container">
            <div class="breadcrumb-inner">
                <ul class="list-inline list-unstyled">
                    <li><a href="<c:url value="/" />">Trang chủ</a></li>
                    <li class='active'>${product.name}</li>
                </ul>
            </div><!-- /.breadcrumb-inner -->
        </div><!-- /.container -->
    </div>
    <div class="detail-block">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                <img class="imgd" alt="" src="${product.image}">
            </div>
            <div class="col-sm-12 col-md-8 col-lg-8">
                <div class="product-info">
                    <h1 class="name">${product.name}</h1>

                    <div class="rating-reviews m-t-20">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="pull-left">
                                    <c:forEach var = "i" begin = "1" end = "${avg}">
                                        <span class="fa fa-star checked"></span>
                                    </c:forEach>
                                </div>
                                <div class="pull-left">
                                    <div class="reviews">
                                        <a href="#product-tabs" class="lnk">(${amountComment} đánh giá)</a>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.rating-reviews -->

                    <div class="description-container m-t-20">
                        <p>${product.description}</p>
                       
                    </div><!-- /.description-container -->

                    <div class="price-container info-container m-t-30">
                        <div class="row">

                            <div class="col-sm-6 col-xs-6">
                                <div class="price-box">
                                    <fmt:setLocale value="vi_VN" />
                                    <fmt:formatNumber var="formattedSalary" value="${product.price}" type="currency" currencyCode="VND" />
                                    <c:set var="trimmedSalary" value="${fn:replace(formattedSalary, '.00', '')}" />
                                    <span class="priced price">${trimmedSalary}</span>
                                </div>
                            </div>

                            <div class="col-sm-6 col-xs-6">
                                <div class="favorite-button m-t-5">
                                    <a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="Wishlist"
                                       href="#">
                                        <i class="fa fa-heart"></i>
                                    </a>
                                </div>
                            </div>

                        </div><!-- /.row -->
                    </div><!-- /.price-container -->

                    <div class="quantity-container info-container">
                        <div class="row">
                            <c:url value="/api/cart" var="u" />
                            <div class="add-btn1">
                                <a href="javascript:;"
                                   onclick="addToCart('${u}',${product.id}, '${product.name}', '${product.price}', '${product.image}')"
                                   class="btn btn-primary"><i class="fa fa-shopping-cart inner-right-vs"></i> THÊM VÀO GIỎ
                                </a>
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.quantity-container -->
                </div>
            </div></div>

        <br>
        <div class="product-tabs inner-bottom-xs">
            <div class="row">
                <div class="col-sm-6 col-md-6 col-lg-6">
                    <div class="product-tab">

                        <div class="product-reviews">
                            <h4 class="title">Đánh giá của khách hàng</h4>

                            <div class="reviews">
                                <div class="review"
                                     <ul id="comments" class="list-group"">
                                    </ul>
                                </div>

                            </div><!-- /.reviews -->
                        </div><!-- /.product-reviews -->


                        <div class="product-add-review">
                            <sec:authorize access="isAuthenticated()">
                                <div class="review-form">
                                    <div class="form-container">
                                        <form class="cnt-form">

                                            <div class="row">
                                                <div class="form-group">
                                                    <label for="exampleInputReview">Nhận xét <span class="astk">*</span></label>
                                                    <textarea class="form-control txt txt-review" placeholder="Nhập vào nội dung bình luận của bạn" id="contentId"></textarea>
                                                </div><!-- /.form-group -->                                       
                                            </div><!-- /.row -->
                                            <c:url value="/api/products/${product.id}/comments" var="endpoint" />
                                            <div class="action text-right">
                                                <button class="btn btn-primary btn-upper" onclick="addComment('${endpoint}', ${product.id})">Thêm nhận xét</button>
                                            </div><!-- /.action -->

                                        </form><!-- /.cnt-form -->

                                    </div><!-- /.form-container -->
                                </div><!-- /.review-form -->
                            </sec:authorize>
                        </div><!-- /.product-add-review -->

                    </div><!-- /.product-tab -->
                </div>

            </div>

        </div>
    </div>





    <br>


    <sec:authorize access="!isAuthenticated()">
        <strong>Vui lòng <a href="<c:url value="/login" />">đăng nhập</a> để bình luận!!!</strong>
    </sec:authorize>





    <script>
        window.onload = function () {
            loadComments('${endpoint}');
            document.getElementById(${rate}).checked = true;
        };
    </script>
