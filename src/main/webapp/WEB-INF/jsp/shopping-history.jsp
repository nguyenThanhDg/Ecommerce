<%-- 
    Document   : shopping-history
    Created on : Oct 15, 2022, 9:53:43 PM
    Author     : Admin
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="breadcrumb">
    <div class="container">
        <div class="breadcrumb-inner">
            <ul class="list-inline list-unstyled">
                <li><a href="home.html">Home</a></li>
                <li class='active'>Lịch sử</li>
            </ul>
        </div><!-- /.breadcrumb-inner -->
    </div><!-- /.container -->
</div>
<div class="body-content">
    <div class="container">
        <div class="my-wishlist-page">
            <div class="row">
                <div class="col-md-12 my-wishlist">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th colspan="4" class="heading-title">Lịch sử mua hàng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${orders}" var="o">
                                    <c:url value="/api/orders/commit/${o[6]}" var="endpoint2" />
                                    <tr>
                                        <td class="col-md-2"><img src="${o[4]}" alt="phoro"></td>
                                        <td class="col-md-3">
                                            <div class="product-name"><a href="#">${o[5]}</a></div>
                                            <div class="rating">
                                                <i class="fa fa-star rate"></i>
                                                <i class="fa fa-star rate"></i>
                                                <i class="fa fa-star rate"></i>
                                                <i class="fa fa-star rate"></i>
                                                <i class="fa fa-star non-rate"></i>
                                            </div>
                                            <fmt:setLocale value="vi_VN" />
                                            <fmt:formatNumber var="formattedSalary" value="${o[1]}" type="currency" currencyCode="VND" />
                                            <c:set var="trimmedSalary" value="${fn:replace(formattedSalary, '.00', '')}" /> 
                                            <div class="price">
                                                ${trimmedSalary}
                                            </div>
                                        </td>
                                        <td class="col-md-2 price">
                                            ${o[2]}
                                        </td>
                                        <td class="col-md-2">
                                            ${o[0]}
                                        </td>
                                        <c:if test="${(o[3] == ('Hoàn thành')) && o[7] == ('Money')}">
                                            <td class="col-md-2">
                                                <a href="#" class="btn-upper btn btn-info">Thanh toán bằng tiền mặt</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${(o[3] == ('Hoàn thành')) && o[7] == ('Momo')}">
                                            <td class="col-md-2">
                                                <a href="#" class="btn-upper btn btn-info">Thanh toán bằng Momo </a>
                                            </td>
                                        </c:if>
                                        <c:if test="${o[3] != ('Hoàn thành')}" var="e">
                                            <td class="col-md-2">
                                                <a href="#" class="btn-upper btn btn-info">${o[3]}</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${o[3] == ('Chờ thanh toán')}" var="e">
                                            <c:url value="/api/orders/cancel/${o[6]}" var="endpoint1" />
                                            <td class="col-md-1">
                                    <btn class="btn btn-success" onclick="commitOrder('${endpoint2}')">Thanh toán</btn>
                                    </td>
                                    <form action="pay-momo" method="post">
                                        <input type="hidden" name="myorderId" value="${o[6]}"/>
                                        <td class="col-md-1">
                                            <button 
                                                type="submit" 
                                                class="btn btn-primary btn-block"
                                                onclick="this.form.action = 'pay-momo';"
                                                >
                                                Momo
                                            </button>
                                        </td>
                                    </form>
                                    <td class="col-md-1">
                                    <btn class="btn btn-danger" onclick="cancelOrder('${endpoint1}')">Hủy</btn>
                                    </td>
                                </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div><!-- /.row -->
        </div><!-- /.sigin-in-->

    </div><!-- /.container -->
</div>
