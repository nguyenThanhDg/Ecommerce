<%-- 
    Document   : products
    Created on : Sep 24, 2022, 1:43:05 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="body-content outer-top-xs">
    <div class='container'>
        <div class='row'>
            <div class='col-xs-12 col-sm-12 col-md-3 sidebar'> 
                <!-- ================================== TOP NAVIGATION ================================== -->

                <!-- /.side-menu --> 
                <!-- ================================== TOP NAVIGATION : END ================================== -->
                <div class="sidebar-module-container">
                    <div class="sidebar-filter"> 
                        <!-- ============================================== SIDEBAR CATEGORY ============================================== -->
                        <div class="sidebar-widget">
                            <h3 class="section-title">Mua sắm</h3>
                            <div class="widget-header">
                                <h4 class="widget-title">Danh sách </h4>
                            </div>
                            <div class="sidebar-widget-body">
                                <div class="accordion">
                                    <div class="accordion-group">
                                        <c:forEach items="${category}" var="c" >
                                            <div class="accordion-heading"> <a href="<c:url value="/products/" ><c:param name="cateId" value="${c.id}" /></c:url>" class="accordion-toggle collapsed">${c.name}
                                                    </a>
                                                </div>

                                        </c:forEach>
                                        <!-- /.accordion-heading -->

                                        <!-- /.accordion-body --> 
                                    </div>
                                </div>
                                <!-- /.accordion --> 
                            </div>
                            <!-- /.sidebar-widget-body --> 
                        </div>
                        <!-- /.sidebar-widget --> 
                        <!-- /.sidebar-widget --> 
                        <!-- ============================================== PRICE SILDER : END ============================================== --> 
                        <!-- ==============
                        <!-- /.sidebar-widget --> 
                        <!-- ===============
                        <!-- /.sidebar-widget --> 
                        <!-- ============================================== COLOR: END ============================================== --> 
                        <!-- =============
                        <!-- /.sidebar-widget --> 
                        <!-- ============================================== COMPARE: END ============================================== --> 
                        <!-- ============================================== PRODUCT TAGS ============================================== -->
                        <div class="sidebar-widget product-tag outer-top-vs">
                            <h3 class="section-title">Sản phẩm nổi bật</h3>
                            <div class="sidebar-widget-body outer-top-xs">
                                <div class="tag-list"> <a class="item" title="Phone" href="category.html">Phone</a> 
                                    <a class="item" title="Vest" href="category.html">Laptop</a>
                                    <a class="item" title="Smartphone" href="category.html">Máy tính bảng</a>
                                    <a class="item" title="Furniture" href="category.html">Quần áo</a>
                                    <a class="item" title="Sweatpants" href="category.html">Đồng hồ</a>
                                    <a class="item" title="Sneaker" href="category.html">Giày</a>
                                    <a class="item" title="Toys" href="category.html">Tai nghe</a>
                                    <a class="item" title="Rose" href="category.html">Nước hoa</a>
                                </div>
                                <!-- /.tag-list --> 
                            </div>
                            <!-- /.sidebar-widget-body --> 
                        </div>
                        <!-- /.sidebar-widget --> 
                        <!-- /.Testimonials -->


                        <!-- ============================================== Testimonials: END ============================================== -->

                        <!-- ============================================== NEWSLETTER ============================================== -->

                        <!-- /.sidebar-widget --> 
                        <!-- ============================================== NEWSLETTER: END ============================================== --> 


                    </div>
                    <!-- /.sidebar-filter --> 
                </div>
                <!-- /.sidebar-module-container --> 
            </div>
            <!-- /.sidebar -->
            <div class="col-xs-12 col-sm-12 col-md-9 rht-col">
                <div class="clearfix filters-container m-t-10">
                    <div class="row">
                        <div class="col col-sm-6 col-md-3 col-lg-3 col-xs-6">
                            <div class="filter-tabs">
                                <ul id="filter-tabs" class="nav nav-tabs nav-tab-box nav-tab-fa-icon">
                                    <li class="active"> <a data-toggle="tab" href="#grid-container"><i class="icon fa fa-th-large"></i>Lưới</a> </li>
                                    <li><a data-toggle="tab" href="#list-container"><i class="icon fa fa-bars"></i>Danh sách</a></li>
                                </ul>
                            </div>
                            <!-- /.filter-tabs --> 
                        </div>
                        <!-- /.col -->
                        <div class="col col-sm-12 col-md-5 col-lg-5 hidden-sm">
                            <div class="col col-sm-6 col-md-6 no-padding">
                                <div class="lbl-cnt"> <span class="lbl">Sắp xếp</span>
                                    <div class="fld inline">
                                        <div class="dropdown dropdown-small dropdown-med dropdown-white inline">
                                            <button data-toggle="dropdown" type="button" class="btn dropdown-toggle"> Loại <span class="caret"></span> </button>
                                            <ul role="menu" class="dropdown-menu">
                                                <li role="presentation"><a href="#">Loại sản phẩm</a></li>
                                                <li role="presentation"><a href="#">Giá:Thấp nhất</a></li>
                                                <li role="presentation"><a href="#">Giá:Cao nhất</a></li>
                                                <li role="presentation"><a href="#">Tên sản phẩm:A to Z</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- /.fld --> 
                                </div>
                                <!-- /.lbl-cnt --> 
                            </div>
                            <!-- /.col -->
                            <div class="col col-sm-6 col-md-6 no-padding hidden-sm hidden-md">
                                <div class="lbl-cnt"> <span class="lbl">Hiện</span>
                                    <div class="fld inline">
                                        <div class="dropdown dropdown-small dropdown-med dropdown-white inline">
                                            <button data-toggle="dropdown" type="button" class="btn dropdown-toggle"> 1 <span class="caret"></span> </button>
                                            <ul role="menu" class="dropdown-menu">
                                                <li role="presentation"><a href="#">1</a></li>
                                                <li role="presentation"><a href="#">2</a></li>
                                                <li role="presentation"><a href="#">3</a></li>
                                                <li role="presentation"><a href="#">4</a></li>
                                                <li role="presentation"><a href="#">5</a></li>
                                                <li role="presentation"><a href="#">6</a></li>
                                                <li role="presentation"><a href="#">7</a></li>
                                                <li role="presentation"><a href="#">8</a></li>
                                                <li role="presentation"><a href="#">9</a></li>
                                                <li role="presentation"><a href="#">10</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- /.fld --> 
                                </div>
                                <!-- /.lbl-cnt --> 
                            </div>
                            <!-- /.col --> 
                        </div>
                        <!-- /.col -->
                        <div class="col col-sm-6 col-md-4 col-xs-6 col-lg-4 text-right">
                            <div class="pagination-container">
                                <ul class="list-inline list-unstyled">
                                    <c:forEach begin="1" end="${Math.ceil(counter/8)}" var="i" >
                                        <li><a href="<c:url value="/products" />?page=${i}">${i}</a></li>
                                    </c:forEach>

                                </ul>
                                <!-- /.list-inline --> 
                            </div>
                            <!-- /.pagination-container --> </div>
                        <!-- /.col --> 
                    </div>
                    <!-- /.row --> 
                </div>

                <div class="category-product">
                    <div class="row">
                        <c:forEach items="${products}" var="p" >
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="item">
                                    <div class="products">
                                        <div class="product">
                                            <div class="product-image">
                                                <div class="image">
                                                    <a href="<c:url value="/products/${p.id}" />">
                                                        <img src="${p.image}" alt="">
                                                    </a>
                                                </div>
                                                <!-- /.image -->

                                                <div class="tag new"><span>mới</span></div>
                                            </div>
                                            <!-- /.product-image -->

                                            <div class="product-info text-left">
                                                <h3 class="name"><a href="detail.html">${p.name}</a></h3>
                                                <div class="rating rateit-small"></div>
                                                <div class="description"></div>
                                                <div class="product-price"> <span class="price"> ${p.price} VND </span> <span

                                                        <!-- /.product-price -->

                                                </div>
                                                <!-- /.product-info -->
                                                <c:url value="/api/cart" var="u" />
                                                <div class="cart clearfix animate-effect">
                                                    <div class="action">
                                                        <ul class="list-unstyled">
                                                            <li class="add-cart-button btn-group">
                                                                <button class="btn btn-primary icon" onclick="addToCart('${u}',${p.id}, '${p.name}', ${p.price}, '${p.image}')" data-toggle="dropdown" type="button"> <i
                                                                        class="fa fa-shopping-cart"></i> </button>
                                                                <button class="btn btn-primary cart-btn" type="button">Thêm vào giỏ</button>
                                                            </li>
                                                            <li class="lnk wishlist"> <a class="add-to-cart" href="detail.html" title="Wishlist">
                                                                    <i class="icon fa fa-heart"></i> </a> </li>
                                                            <li class="lnk"> <a class="add-to-cart" href="detail.html" title="Compare"> <i
                                                                        class="fa fa-signal"></i> </a> </li>
                                                        </ul>
                                                    </div>
                                                    <!-- /.action -->
                                                </div>
                                                <!-- /.cart -->
                                            </div>
                                            <!-- /.product -->

                                        </div>
                                        <!-- /.products -->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>



                    </div>
                    <!-- /.row -->
                </div>
            </div>

        </div>
        <!-- /.body-content --> 
        <!-- ============================================================= FOOTER ============================================================= -->

        <!-- ============================================== INFO BOXES ============================================== -->

