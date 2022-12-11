<%-- 
    Document   : userheader
    Created on : Sep 23, 2022, 3:50:09 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header class="header-style-1">

    <!-- ============================================== TOP MENU ============================================== -->
    <div class="top-bar animate-dropdown">
        <div class="container">
            <div class="header-top-inner">
                <div class="cnt-account">
                    <ul class="list-unstyled">
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li class="login"><a href="<c:url value="/history" />"><span>Lịch sử mua hàng</span></a></li>
                            <li class="myaccount"><a href="#"><span>${currentUser.lastName}</span></a></li>
                                    </c:if>
                            <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <li class="login"><a href="<c:url value="/login" />"><span>Đăng nhập</span></a></li>
                            <li class="login"><a href="<c:url value="/register" />"><span>Đăng ký</span></a></li>
                            </c:if>
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li class="login"><a href="<c:url value="/logout" />"><span>Đăng xuất</span></a></li>
                            </c:if>
                    </ul>
                </div>
                <!-- /.cnt-account -->

                <div class="clearfix"></div>
            </div>
            <!-- /.header-top-inner -->
        </div>
        <!-- /.container -->
    </div>
    <!-- /.header-top -->
    <!-- ============================================== TOP MENU : END ============================================== -->
    <div class="main-header">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
                    <!-- ============================================================= LOGO ============================================================= -->
                    <div class="logo"> 
                        <a href="<c:url value="/" />">
                            <img src="<c:url value="/user/assets/images/logo.png"/>" alt="logo">
                        </a>
                    </div>
                    <!-- /.logo -->
                    <!-- ============================================================= LOGO : END ============================================================= -->
                </div>
                <!-- /.logo-holder -->

                <div class="col-lg-7 col-md-6 col-sm-8 col-xs-12 top-search-holder">
                    <!-- /.contact-row -->
                    <!-- ============================================================= SEARCH AREA ============================================================= -->
                    <div class="search-area">
<<<<<<< HEAD
                        <form action="<c:url value="/products" />">
=======
                        <form action="<c:url value="/products/" />">
>>>>>>> efa557d96e97635cc51859bae09fc00b1d988675
                            <div class="control-group">
                                <ul class="categories-filter animate-dropdown">
                                    <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown"
                                                             href="category.html">Danh sách<b class="caret"></b></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <c:forEach items="${category}" var="c" >
                                                <li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value="/products/" ><c:param name="cateId" value="${c.id}" /></c:url>">${c.name}</a>
                                                </c:forEach>
                                        </ul>
                                    </li>
                                </ul>
                                <input class="search-field" name="kw" placeholder="Tìm kiếm..." />
                            </div>
                        </form>
                    </div>
                    <!-- /.search-area -->
                    <!-- ============================================================= SEARCH AREA : END ============================================================= -->
                </div>
                <!-- /.top-search-holder -->

                <div class="col-lg-2 col-md-3 col-sm-4 col-xs-12 animate-dropdown top-cart-row">
                    <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->

                    <div class=" dropdown-cart"> <a href="<c:url value="/cart"/>" class="dropdown-toggle lnk-cart">
                            <div class="items-cart-inner">
                                <div class="basket">
                                    <div class="basket-item-count"><span class="count" id="cartCounter">${cartCounter}</span></div>
                                    <div class="total-price-basket"> <span class="lbl">Giỏ hàng</span>
                                        <span class="value"  id="cartTotal">${cartTotal.total}</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                        <!-- /.dropdown-menu-->
                    </div>
                    <!-- /.dropdown-cart -->

                    <!-- ============================================================= SHOPPING CART DROPDOWN : END============================================================= -->
                </div>
                <!-- /.top-cart-row -->
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

    </div>
    <!-- /.main-header -->

    <!-- ============================================== NAVBAR ============================================== -->
    <div class="header-nav animate-dropdown">
        <div class="container">
            <div class="yamm navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button data-target="#mc-horizontal-menu-collapse" data-toggle="collapse" class="navbar-toggle collapsed"
                            type="button">
                        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
                            class="icon-bar"></span> <span class="icon-bar"></span> </button>
                </div>
                <div class="nav-bg-class">
                    <div class="navbar-collapse collapse" id="mc-horizontal-menu-collapse">
                        <div class="nav-outer">
                            <ul class="nav navbar-nav">
                                <li class="dropdown"> <a href="<c:url value="/" />">Trang chủ</a> </li>
                                <li class="dropdown"> <a href="<c:url value="/products" />">Danh sách</a> </li>
                                <li class="dropdown mega-menu">
                                    <a href="category.html" data-hover="dropdown" class="dropdown-toggle"
                                       data-toggle="dropdown">Điện tử <span class="menu-label hot-menu hidden-xs">hot</span> </a>
                                    <ul class="dropdown-menu container">
                                        <li>
                                            <div class="yamm-content">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-2 col-menu">
                                                        <h2 class="title">Laptops</h2>
                                                        <ul class="links">
                                                            <li><a href="#">Gaming</a></li>
                                                            <li><a href="#">Apple</a></li>
                                                            <li><a href="#">Dell</a></li>
                                                            <li><a href="#">Lenovo</a></li>
                                                            <li><a href="#">Microsoft</a></li>
                                                            <li><a href="#">Asus</a></li>
                                                            <li><a href="#">Acer</a></li>
                                                        </ul>
                                                    </div>
                                                    <!-- /.col -->

                                                    <div class="col-xs-12 col-sm-12 col-md-2 col-menu">
                                                        <h2 class="title">Phụ kiện</h2>
                                                        <ul class="links">
                                                            <li><a href="#">Routers & Modems</a></li>
                                                            <li><a href="#">CPUs, Processors</a></li>
                                                            <li><a href="#">PC Gaming Store</a></li>
                                                            <li><a href="#">Graphics Cards</a></li>
                                                            <li><a href="#">Components</a></li>
                                                            <li><a href="#">Webcam</a></li>
                                                            <li><a href="#">Memory (RAM)</a></li>
                                                            <li><a href="#">Motherboards</a></li>
                                                            <li><a href="#">Keyboards</a></li>
                                                            <li><a href="#">Headphones</a></li>
                                                        </ul>
                                                    </div>
                                                    <!-- /.col -->

                                                    <div class="col-xs-12 col-sm-12 col-md-2 col-menu">
                                                        <h2 class="title">Máy ảnh</h2>
                                                        <ul class="links">
                                                            <li><a href="#">Accessories</a></li>
                                                            <li><a href="#">Binoculars</a></li>
                                                            <li><a href="#">Telescopes</a></li>
                                                            <li><a href="#">Camcorders</a></li>
                                                            <li><a href="#">Digital</a></li>
                                                            <li><a href="#">Film Cameras</a></li>
                                                            <li><a href="#">Flashes</a></li>
                                                            <li><a href="#">Lenses</a></li>
                                                            <li><a href="#">Surveillance</a></li>
                                                            <li><a href="#">Tripods</a></li>
                                                        </ul>
                                                    </div>
                                                    <!-- /.col -->
                                                    <div class="col-xs-12 col-sm-12 col-md-2 col-menu">
                                                        <h2 class="title">Di động</h2>
                                                        <ul class="links">
                                                            <li><a href="#">Apple</a></li>
                                                            <li><a href="#">Samsung</a></li>
                                                            <li><a href="#">Huawei</a></li>
                                                            <li><a href="#">Asus</a></li>
                                                            <li><a href="#">Xiaomi</a></li>
                                                           
                                                            
                                                        </ul>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-4 col-menu custom-banner"> <a href="#"><img alt=""
                                                                                                                                       src="<c:url value="/user/assets/images/banners/top-menu-banner1.jpg"/>"></a> </div>
                                                </div>
                                                <!-- /.row -->
                                            </div>
                                            <!-- /.yamm-content -->
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown hidden-sm"> <a href="category.html">Giày <span
                                            class="menu-label new-menu hidden-xs">new</span> </a> </li>
                                <li class="dropdown hidden-sm"> <a href="category.html">Đồng hồ</a> </li>
                               
                                
<!--                                <li class="dropdown  navbar-right special-menu"> <a href="#">Get 30% off on selected items</a> </li>-->
                            </ul>
                            <!-- /.navbar-nav -->
                            <div class="clearfix"></div>
                        </div>
                        <!-- /.nav-outer -->
                    </div>
                    <!-- /.navbar-collapse -->

                </div>
                <!-- /.nav-bg-class -->
            </div>
            <!-- /.navbar-default -->
        </div>
        <!-- /.container-class -->

    </div>
    <!-- /.header-nav -->
    <!-- ============================================== NAVBAR : END ============================================== -->

</header>