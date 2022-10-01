<%-- 
    Document   : userbase
    Created on : Sep 23, 2022, 3:49:57 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="MediaCenter, Template, eCommerce">
        <meta name="robots" content="all">
        <title><tiles:insertAttribute name="title" /></title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="<c:url value="/user/assets/css/bootstrap.min.css"/>">

        <!-- Customizable CSS -->
        <link rel="stylesheet" href="<c:url value="/user/assets/css/main.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/assets/css/blue.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/assets/css/owl.carousel.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/assets/css/owl.transitions.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/assets/css/animate.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/assets/css/rateit.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/assets/css/bootstrap-select.min.css"/>">

        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="<c:url value="/user/assets/css/font-awesome.css"/>">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Barlow:200,300,300i,400,400i,500,500i,600,700,800"
              rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800'
              rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    </head>
    <body class="cnt-home">
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="content" />
        <tiles:insertAttribute name="footer" />
        <script src="<c:url value="/user/assets/js/jquery-1.11.1.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/bootstrap-hover-dropdown.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/owl.carousel.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/echo.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/jquery.easing-1.3.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/bootstrap-slider.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/jquery.rateit.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/lightbox.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/bootstrap-select.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/wow.min.js"/>"></script>
        <script src="<c:url value="/user/assets/js/scripts.js"/>"></script>
        <script src="<c:url value="/user/cart.js"/>"></script>
        <script src="<c:url value="/user/product.js" />"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
    </body>