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
    <ul class="list-unstyled">
        <li class="active"><a href="index.html"> <i class="icon-home"></i>Trang chủ </a></li>
        <li><a href="tables.html"> <i class="icon-grid"></i>Bảng </a></li>
        <li><a href="charts.html"> <i class="fa fa-bar-chart"></i>Thống kê </a></li>
        <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-windows"></i>Quản lý sản phẩm</a>
            <ul id="exampledropdownDropdown" class="collapse list-unstyled ">
                <li><a href="<c:url value="/seller/products" />">Danh sách sản phẩm</a></li>
                <li><a href="<c:url value="/seller/add-product" />">Thêm sản phẩm</a></li>
            </ul>
        </li>
    </ul>
</nav>
