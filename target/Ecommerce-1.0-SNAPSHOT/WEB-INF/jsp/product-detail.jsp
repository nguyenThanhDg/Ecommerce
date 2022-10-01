<%-- 
    Document   : product-detail
    Created on : Sep 24, 2022, 11:46:36 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-xs-12 col-sm-12 col-md-12">
    <div class="breadcrumb">
        <div class="container">
            <div class="breadcrumb-inner">
                <ul class="list-inline list-unstyled">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Clothing</a></li>
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
                                    <div class="rating rateit-small"></div>
                                </div>
                                <div class="pull-left">
                                    <div class="reviews">
                                        <a href="#" class="lnk">(13 Reviews)</a>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.rating-reviews -->

                    <div class="description-container m-t-20">
                        <p>${product.description}</p>
                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                            pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                            mollit anim id est laborum.</p>
                    </div><!-- /.description-container -->

                    <div class="price-container info-container m-t-30">
                        <div class="row">


                            <div class="col-sm-6 col-xs-6">
                                <div class="price-box">
                                    <span class="priced price">${product.price} VND</span>
                                </div>
                            </div>

                            <div class="col-sm-6 col-xs-6">
                                <div class="favorite-button m-t-5">
                                    <a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="Wishlist"
                                       href="#">
                                        <i class="fa fa-heart"></i>
                                    </a>
                                    <a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="Add to Compare"
                                       href="#">
                                        <i class="fa fa-signal"></i>
                                    </a>
                                    <a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="E-mail"
                                       href="#">
                                        <i class="fa fa-envelope"></i>
                                    </a>
                                </div>
                            </div>

                        </div><!-- /.row -->
                    </div><!-- /.price-container -->

                    <div class="quantity-container info-container">
                        <div class="row">



                            <div class="add-btn1">
                                <a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart inner-right-vs"></i> ADD TO
                                    CART</a>
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /.quantity-container -->
                </div>
            </div></div>

    </div></div>