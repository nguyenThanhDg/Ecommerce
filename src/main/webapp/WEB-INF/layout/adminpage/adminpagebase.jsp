<%-- 
    Document   : adminbase
    Created on : Sep 23, 2022, 8:51:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">


    <!-- index.html  21 Nov 2019 03:44:50 GMT -->

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
        <title>Otika - Admin Dashboard Template</title>
        <!-- General CSS Files -->
        <link rel="stylesheet" href="<c:url value="/adminpage/assets/css/app.min.css"/>">
        <!-- Template CSS -->
        <link rel="stylesheet" href="<c:url value="/adminpage/assets/css/style.css"/>">
        <link rel="stylesheet" href="<c:url value="/adminpage/assets/css/components.css"/>">
        <!-- Custom style CSS -->
        <link rel="stylesheet" href="<c:url value="/adminpage/assets/css/custom.css"/>">
        <link rel='shortcut icon' type='image/x-icon' href='<c:url value="/adminpage/assets/img/favicon.ico"/>' />
    </head>
    <body>
        <div class="loader"></div>
        <div id="app">
            <div class="main-wrapper main-wrapper-1">
                <tiles:insertAttribute name="header" />
                <tiles:insertAttribute name="nav" />
                <div class="main-content">
                    <tiles:insertAttribute name="content" />
                    <tiles:insertAttribute name="btn" />
                </div>
                <tiles:insertAttribute name="footer" />
            </div>
        </div>
        <script src="<c:url value="/adminpage/assets/js/app.min.js"/>"></script>
        <!-- JS Libraies -->
        <script src="<c:url value="/adminpage/assets/bundles/apexcharts/apexcharts.min.js"/>"></script>
        <!-- Page Specific JS File -->
        <script src="<c:url value="/adminpage/assets/js/page/index.js"/>"></script>
        <script src="<c:url value="/adminpage/admin.js"/>"></script>
        <script src="<c:url value="/adminpage/assets/js/page/widget-chart.js"/>"></script>
        <script src="<c:url value="/adminpage/assets/js/scripts.js"/>"></script>
        <script src="<c:url value="/adminpage/assets/bundles/chartjs/chart.min.js"/>"></script>
        <script src="<c:url value="/adminpage/assets/bundles/jquery.sparkline.min.js"/>"></script>
        <script src="<c:url value="/adminpage/assets/bundles/apexcharts/apexcharts.min.js"/>"></script>
        <script src="<c:url value="/adminpage/assets/bundles/jqvmap/dist/jquery.vmap.min.js"/>"></script>
        <script src="<c:url value="/adminpage/assets/bundles/jqvmap/dist/maps/jquery.vmap.world.js"/>"></script>
        <script src="<c:url value="/adminpage/assets/bundles/jqvmap/dist/maps/jquery.vmap.indonesia.js"/>"></script>
        <!-- Custom JS File -->
        <script src="<c:url value="/adminpage/assets/js/custom.js"/>"></script>
    </body>
</html>