<%-- 
    Document   : adminfooter
    Created on : Sep 23, 2022, 8:52:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav id="sidebar">
    <!-- Sidebar Header-->
    <div class="sidebar-header d-flex align-items-center">
        <div class="avatar"><img style="height: 100%" src="${currentUser.avatar}" alt="avatar" class="img-fluid rounded-circle"></div>
        <div class="title">
            <h1 class="h5">${currentUser.lastName}</h1>
        </div>
    </div>
    <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
    <ul class="list-unstyled">
        <li class="active"><a href="index.html"> <i class="icon-home"></i>Home </a></li>
        <li><a href="tables.html"> <i class="icon-grid"></i>Tables </a></li>
        <li><a href="charts.html"> <i class="fa fa-bar-chart"></i>Charts </a></li>
        <li><a href="<c:url value="/seller/add-product" />"> <i class="icon-padnote"></i>Them san pham</a></li>
        <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-windows"></i>Quan li san pham</a>
            <ul id="exampledropdownDropdown" class="collapse list-unstyled ">
                <li><a href="#">Danh sach san pham hien tai</a></li>
                <li><a href="<c:url value="/seller/add-product" />">Them san pham</a></li>
                <li><a href="#">Sua san pham</a></li>
            </ul>
        </li>
        <li><a href="login.html"> <i class="icon-logout"></i>Login page </a></li>
</nav>
