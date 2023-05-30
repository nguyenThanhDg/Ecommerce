<%-- 
    Document   : products
    Created on : Sep 24, 2022, 1:43:05 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                                <div class="tag-list">
                                    <c:forEach items="${category}" var="c" >
                                        <a class="item" title="Phone" href="<c:url value="/products/" >
                                               <c:param name="cateId" value="${c.id}" />
                                           </c:url>"">${c.name}</a>
                                    </c:forEach>
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
                        <div class="col col-sm-12 col-md-12 col-xs-12 col-lg-12 text-right">
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
                                            </div>
                                            <!-- /.product-image -->

                                            <div class="product-info text-left">
                                                <h3 class="name"><a href="detail.html">${p.name}</a></h3>
                                                <div class="rating rateit-small"></div>
                                                <div class="description"></div>
                                                <fmt:setLocale value="vi_VN" />
                                                <fmt:formatNumber var="formattedSalary" value="${p.price}" type="currency" currencyCode="VND" />
                                                <c:set var="trimmedSalary" value="${fn:replace(formattedSalary, '.00', '')}" /> 
                                                <div class="product-price"> <span class="price"> ${trimmedSalary}</span> <span

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
                                                            <li class="lnk wishlist"> <a class="add-to-cart" href="detail.html" title="Yêu thích">
                                                                    <i class="icon fa fa-heart"></i> </a> </li>
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

