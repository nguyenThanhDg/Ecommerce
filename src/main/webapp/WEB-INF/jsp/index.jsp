
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="body-content outer-top-vs" id="top-banner-and-menu">
    <div class="container">
        <div class="row">
            <!-- ============================================== SIDEBAR ============================================== -->
            <div class="col-xs-12 col-sm-12 col-md-3 sidebar">

                <!-- ================================== TOP NAVIGATION ================================== -->
                <div class="side-menu animate-dropdown outer-bottom-xs">
                    <div class="head"><i class="icon fa fa-align-justify fa-fw"></i> Danh sách</div>
                    <nav class="yamm megamenu-horizontal">
                        <ul class="nav">
                            <c:forEach items="${category}" var="c" >
                                <li class="dropdown menu-item">
                                    <a href="
                                       <c:url value="/products/" >
                                           <c:param name="cateId" value="${c.id}" />
                                       </c:url>"
                                       class="dropdown-toggle">${c.name}
                                    </a>

                                </li>
                            </c:forEach>

                            <!-- /.menu-item -->

                        </ul>
                        <!-- /.nav -->
                    </nav>
                    <!-- /.megamenu-horizontal -->
                </div>
                <!-- /.side-menu -->
                <!-- ================================== TOP NAVIGATION : END ================================== -->


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
                <!-- ============================================== PRODUCT TAGS : END ============================================== -->
                <!-- ============================================== NEWSLETTER ============================================== -->

                <!-- /.sidebar-widget -->
                <!-- ============================================== NEWSLETTER: END ============================================== -->




            </div>
            <!-- /.sidemenu-holder -->
            <!-- ============================================== SIDEBAR : END ============================================== -->

            <!-- ============================================== CONTENT ============================================== -->
            <div class="col-xs-12 col-sm-12 col-md-9 homebanner-holder">
                <!-- ========================================== SECTION – HERO ========================================= -->

                <div id="hero">
                    <div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
                        <div class="item" style="background-image: url(https://ruby.vn/wp-content/uploads/2022/02/anh-bia-ruby.jpg);">
                            <div class="container-fluid">
                                <div class="caption bg-color vertical-center text-left">
                                    <div class="slider-header fadeInDown-1">Nhãn hàng nổi bật</div>
                                    <div class="big-text fadeInDown-1"> Bộ sưu tập mới </div>
                                    <div class="excerpt fadeInDown-2 hidden-xs"> <span>Thoả thích mua sắm.</span> </div>
                                    <div class="button-holder fadeInDown-3"> <a href="<c:url value="/products" />"
                                                                                class="btn-lg btn btn-uppercase btn-primary shop-now-button">Mụa ngay</a> </div>
                                </div>
                                <!-- /.caption -->
                            </div>
                            <!-- /.container-fluid -->
                        </div>
                        <!-- /.item -->

                        <div class="item" style="background-image: url(https://bloganchoi.com/wp-content/uploads/2019/03/anh-dai-dien-19.jpg);">
                            <div class="container-fluid">
                                <div class="caption bg-color vertical-center text-left">
                                    <div class="slider-header fadeInDown-1">Mùa hè 2022</div>
                                    <div class="big-text fadeInDown-1" style="color: white"> Tưng bừng mua sắm </div>
                                    <div class="excerpt fadeInDown-2 hidden-xs"> <span>Việc gì khó cứ để mình lo.</span> </div>
                                    <div class="button-holder fadeInDown-3"> <a href="href="<c:url value="/products" />""
                                                                                class="btn-lg btn btn-uppercase btn-primary shop-now-button">Mua ngay</a> </div>
                                </div>
                                <!-- /.caption -->
                            </div>
                            <!-- /.container-fluid -->
                        </div>
                        <!-- /.item -->

                    </div>
                    <!-- /.owl-carousel -->
                </div>

                <!-- ========================================= SECTION – HERO : END ========================================= -->


                <!-- ============================================== SCROLL TABS ============================================== -->
                <div id="product-tabs-slider" class="scroll-tabs outer-top-vs">
                    <div class="more-info-tab clearfix ">
                        <h3 class="new-product-title pull-left">Sản phẩm mới</h3>
                        <ul class="nav nav-tabs nav-tab-line pull-right" id="new-products-1">
                            <li class="active"><a href="<c:url value="/products" />">Tất cả</a></li>
<!--                            <li><a data-transition-type="backSlide" href="#smartphone" data-toggle="tab">Quần áo</a></li>
                            <li><a data-transition-type="backSlide" href="#laptop" data-toggle="tab">Điện tử</a></li>
                            <li><a data-transition-type="backSlide" href="#apple" data-toggle="tab">Giày</a></li>-->
                        </ul>
                        <!-- /.nav-tabs -->
                    </div>
                    <div class="tab-content outer-top-xs">
                        <div class="tab-pane in active" id="all">
                            <div class="product-slider">
                                <div class="owl-carousel home-owl-carousel custom-carousel owl-theme">

                                    <!-- /.item -->

                                    <c:forEach items="${products}" var="p" >
                                        <div class="item item-carousel">
                                            <div class="products">
                                                <div class="product">
                                                    <div class="product-image">
                                                        <div class="image">
                                                            <a href="<c:url value="/products/${p.id}"/>">
                                                                <img src="${p.image}" alt="">

                                                            </a>
                                                        </div>
                                                        <!-- /.image -->

                                                        <div class="tag new"><span>Mới</span></div>
                                                    </div>
                                                    <!-- /.product-image -->

                                                    <div class="product-info text-left">
                                                        <h3 class="name"><a href="<c:url value="/products/${p.id}"/>">${p.name}</a></h3>
                                                        <div class="rating rateit-small"></div>
                                                        <div class="description"></div>
                                                        <fmt:setLocale value="vi_VN" />
                                                        <fmt:formatNumber var="formattedSalary" value="${p.price}" type="currency" currencyCode="VND" />
                                                        <c:set var="trimmedSalary" value="${fn:replace(formattedSalary, '.00', '')}" /> 
                                                        <div class="product-price"> <span class="price"> ${trimmedSalary} </span> 
                                                        </div>
                                                        <!-- /.product-price -->

                                                    </div>
                                                    <!-- /.product-info -->
                                                    <c:url value="/api/cart" var="u" />
                                                    <div class="cart clearfix animate-effect">
                                                        <div class="action">

                                                            <ul class="list-unstyled">
                                                                <li class="add-cart-button btn-group">  
                                                                    <button onclick="addToCart('${u}',${p.id}, '${p.name}', ${p.price}, '${p.image}')" data-toggle="tooltip" class="btn btn-primary icon" type="button"
                                                                            title="Thêm"> <i class="fa fa-shopping-cart"></i> </button>
                                                                    <button class="btn btn-primary cart-btn" type="button">Thêm sản phẩm</button>
                                                                </li>
                                                                <li class="lnk wishlist"> <a data-toggle="tooltip" class="add-to-cart"
                                                                                             href="detail.html" title="Yêu thích"> <i class="icon fa fa-heart"></i> </a> </li>
                                                                <li class="lnk"> <a data-toggle="tooltip" class="add-to-cart" href="detail.html"
                                                                                    title="So sánh"> <i class="fa fa-signal" aria-hidden="true"></i> </a> </li>
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
                                    </c:forEach>
                                    <!-- /.item -->
                                </div>
                                <!-- /.home-owl-carousel -->
                            </div>
                            <!-- /.product-slider -->
                        </div>
                        <!-- /.tab-pane -->

                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.scroll-tabs -->
                <!-- ============================================== SCROLL TABS : END ============================================== -->
                <!-- ============================================== WIDE PRODUCTS ============================================== -->
                <div class="wide-banners outer-bottom-xs">
                    <div class="row">
                        <div class="col-md-4 col-sm-4">
                            <div class="wide-banner cnt-strip">
                                <div class="image"> <img class="img-responsive" src="<c:url value="/user/assets/images/banners/home-banner1.jpg"/>" alt="">
                                </div>
                            </div>
                            <!-- /.wide-banner -->
                        </div>

                        <div class="col-md-4 col-sm-4">
                            <div class="wide-banner cnt-strip">
                                <div class="image"> <img class="img-responsive" src="<c:url value="/user/assets/images/banners/home-banner3.jpg"/>" alt="">
                                </div>
                            </div>
                            <!-- /.wide-banner -->
                        </div>

                        <!-- /.col -->
                        <div class="col-md-4 col-sm-4">
                            <div class="wide-banner cnt-strip">
                                <div class="image"> <img class="img-responsive" src="<c:url value="/user/assets/images/banners/home-banner2.jpg"/>" alt="">
                                </div>
                            </div>
                            <!-- /.wide-banner -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.wide-banners -->

                <!-- ============================================== WIDE PRODUCTS : END ============================================== -->

                <!-- ============================================== FEATURED PRODUCTS : END ============================================== -->
                <!-- ============================================== WIDE PRODUCTS ============================================== -->
                <div class="wide-banners outer-bottom-xs">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="wide-banner1 cnt-strip">
                                <div class="image"> <img class="img-responsive" src="<c:url value="/user/assets/images/banners/home-banner.jpg"/>" alt="">
                                </div>
                                <div class="strip strip-text">
                                    <div class="strip-inner">
                                        <h2 class="text-right">Amazing Sunglasses<br>
                                            <span class="shopping-needs">Get 40% off on selected items</span>
                                        </h2>
                                    </div>
                                </div>
                                <div class="new-label">
                                    <div class="text">MỚI</div>
                                </div>
                                <!-- /.new-label -->
                            </div>
                            <!-- /.wide-banner -->
                        </div>
                        <!-- /.col -->
                        <div class="col-md-4">
                            <div class="wide-banner cnt-strip">
                                <div class="image"> <img class="img-responsive" src="<c:url value="/user/assets/images/banners/home-banner4.jpg"/>" alt="">
                                </div>


                                <!-- /.new-label -->
                            </div>
                            <!-- /.wide-banner -->
                        </div>

                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.wide-banners -->
                <!-- ============================================== WIDE PRODUCTS : END ============================================== -->


            </div>
            <!-- /.homebanner-holder -->
            <!-- ============================================== CONTENT : END ============================================== -->
        </div>

    </div>
    <!-- /.container -->
</div>
<!-- /#top-banner-and-menu -->

<!-- ============================================== INFO BOXES ============================================== -->

