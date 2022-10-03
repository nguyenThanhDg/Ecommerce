<%-- 
    Document   : adminbase
    Created on : Sep 23, 2022, 8:51:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head> 
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><tiles:insertAttribute name="title" /></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="<c:url value="/admin/vendor/bootstrap/css/bootstrap.min.css"/>">
        <!-- Font Awesome CSS-->
        <link rel="stylesheet" href="<c:url value="/admin/vendor/font-awesome/css/font-awesome.min.css"/>">
        <!-- Custom Font Icons CSS-->
        <link rel="stylesheet" href="<c:url value="/admin/css/font.css"/>">
        <!-- Google fonts - Muli-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,700">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="<c:url value="/admin/css/style.default.css"/>" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="<c:url value="/admin/css/custom.css"/>">
        <!-- Favicon-->
        <link rel="shortcut icon" href="<c:url value="/admin/img/favicon.ico"/>">
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
        <tiles:insertAttribute name="header" />
        <div class="d-flex align-items-stretch">
            <tiles:insertAttribute name="nav" />
            <tiles:insertAttribute name="content" />
            <tiles:insertAttribute name="footer" />
        </div>
        <script src="<c:url value="/admin/vendor/jquery/jquery.min.js"/>"></script>
        <script src="<c:url value="/admin/vendor/popper.js/umd/popper.min.js"/>"></script>
        <script src="<c:url value="/admin/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/admin/vendor/jquery.cookie/jquery.cookie.js"/>"></script>
        <script src="<c:url value="/admin/vendor/chart.js/Chart.min.js"/>"></script>
        <script src="<c:url value="/admin/vendor/jquery-validation/jquery.validate.min.js"/>"></script>
        <script src="<c:url value="/admin/js/charts-home.js"/>"></script>
        <script src="<c:url value="/admin/js/front.js"/>"></script>
        <script src="<c:url value="/admin/js/product.js"/>"></script>
        
    </body>
</html>