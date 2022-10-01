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

        <br>
        <div class="product-tabs inner-bottom-xs">
            <div class="row">
                <div class="col-sm-12 col-md-3 col-lg-3"> 
                    <ul id="product-tabs" class="nav nav-tabs nav-tab-cell">
                        <a data-toggle="tab" href="#review">REVIEW</a>
                    </ul>
                </div>
                <div class="col-sm-12 col-md-9 col-lg-9">
                    <div class="tab-content">
                        <div id="review" class="tab-pane">
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
                                        <h4 class="title">Viết nhận xét của bạn</h4>
                                        <div class="review-table">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th class="cell-label">&nbsp;</th>
                                                            <th>1 star</th>
                                                            <th>2 stars</th>
                                                            <th>3 stars</th>
                                                            <th>4 stars</th>
                                                            <th>5 stars</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td class="cell-label">Chất lượng</td>
                                                            <td><input type="radio" name="quality" class="radio" value="1"></td>
                                                            <td><input type="radio" name="quality" class="radio" value="2"></td>
                                                            <td><input type="radio" name="quality" class="radio" value="3"></td>
                                                            <td><input type="radio" name="quality" class="radio" value="4"></td>
                                                            <td><input type="radio" name="quality" class="radio" value="5"></td>
                                                        </tr>
                                                        
                                                    </tbody>
                                                </table><!-- /.table .table-bordered -->
                                            </div><!-- /.table-responsive -->
                                        </div><!-- /.review-table -->

                                        <div class="review-form">
                                            <div class="form-container">

                                                <form class="cnt-form">

                                                    <div class="row">
                                                        <div class="form-group">
                                                            <label for="exampleInputReview">Nhận xét <span class="astk">*</span></label>
                                                            <textarea class="form-control txt txt-review" placeholder="Nhap noi dung binh luan" id="contentId"></textarea>
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
                        </div><!-- /.tab-pane -->
                    </div>
                </div>

            </div>

        </div>
    </div>





    <br>
    

    <sec:authorize access="!isAuthenticated()">
        <strong>Vui long <a href="<c:url value="/login" />">dang nhap</a> de binh luan!!!</strong>
    </sec:authorize>





    <script>
        window.onload = function () {
            loadComments('${endpoint}');
        };
    </script>
