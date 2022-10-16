<%-- 
    Document   : adminheader
    Created on : Sep 23, 2022, 8:51:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header">   
    <nav class="navbar navbar-expand-lg">
        <div class="search-panel">
            <div class="search-inner d-flex align-items-center justify-content-center">
                <div class="close-btn">Đóng <i class="fa fa-close"></i></div>
                <form id="searchForm" action="#">
                    <div class="form-group">
                        <input type="search" name="search" placeholder="What are you searching for...">
                        <button type="submit" class="submit">Tìm kiếm</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="container-fluid d-flex align-items-center justify-content-between">
            <div class="navbar-header">
                <!-- Navbar Header--><a href="<c:url value="/seller/" />" class="navbar-brand">
                    <div class="brand-text brand-big visible text-uppercase"><strong class="text-primary">Dark</strong><strong>Admin</strong></div>
                    <div class="brand-text brand-sm"><strong class="text-primary">D</strong><strong>A</strong></div></a>
                <!-- Sidebar Toggle Btn-->
                <button class="sidebar-toggle"><i class="fa fa-long-arrow-left"></i></button>
            </div>
            <div class="right-menu list-inline no-margin-bottom">
                <!-- Languages dropdown    -->
                <div class="list-inline-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle"><img src="<c:url value="/admin/img/flags/16/GB.png"/>" alt="English"><span class="d-none d-sm-inline-block">Tiếng Việt</span></a>
                    <div aria-labelledby="languages" class="dropdown-menu">
                        <a rel="nofollow" href="#" class="dropdown-item">
                            <img src="<c:url value="/admin/img/flags/16/DE.png"/>" alt="English" class="mr-2">
                            <span>Tiếng Anh</span></a><a rel="nofollow" href="#" class="dropdown-item">
                            <img src="<c:url value="/admin/img/flags/16/FR.png"/>" alt="English" class="mr-2">
                            <span>Tiếng Pháp  </span>
                        </a>
                    </div>
                </div>
                <!-- Log out               -->
                <div class="list-inline-item logout">                   <a id="logout" href="<c:url value="/logout" />" class="nav-link">Đăng xuất <i class="icon-logout"></i></a></div>
            </div>
        </div>
    </nav>
</header>
