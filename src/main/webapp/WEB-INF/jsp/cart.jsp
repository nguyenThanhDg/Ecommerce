<%-- 
    Document   : cart
    Created on : Sep 24, 2022, 8:49:35 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="breadcrumb">
    <div class="container">
        <div class="breadcrumb-inner">
            <ul class="list-inline list-unstyled">
                <li><a href="#">Trang chủ</a></li>
                <li class='active'>Giỏ hàng</li>
            </ul>
        </div><!-- /.breadcrumb-inner -->
    </div><!-- /.container -->
</div><!-- /.breadcrumb -->

<div class="body-content outer-top-xs">
    <div class="container">
        <div class="row ">
            <div class="shopping-cart">
                <div class="shopping-cart-table ">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="cart-romove item">Xoá</th>
                                    <th class="cart-description item">Hình ảnh</th>
                                    <th class="cart-product-name item">Tên sản phẩm</th>
                                    <th class="cart-qty item">Số lượng</th>
                                    <th class="cart-sub-total item">Đơn giá</th>
                                </tr>
                            </thead><!-- /thead -->

                            <tbody>
                                <c:url value="/api/cart" var="u" />
                                <c:forEach items="${carts}" var="cart">
                                    <tr id="productId${cart.productId}">
                                        <td class="romove-item">
                                            <a onclick="deleteCartItem(${cart.productId})" title="cancel" class="icon">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </td>
                                        <td class="cart-image">
                                            <a class="entry-thumbnail" href="detail.html">
                                                <img src="${cart.image}" alt="">
                                            </a>
                                        </td>
                                        <td class="cart-product-name-info">
                                            <h4 class='cart-product-description' style="text-align: center">
                                                <a href="<c:url value="/products/${cart.productId}" />">${cart.productName}
                                                </a>
                                            </h4>
                                            <!--                                            <div class="row">
                                                                                            <div class="col-sm-12">
                                                                                                <div class="rating rateit-small"></div>
                                                                                            </div>
                                                                                            <div class="col-sm-12">
                                                                                                <div class="reviews">
                                                                                                    (06 Reviews)
                                                                                                </div>
                                                                                            </div>
                                                                                        </div> /.row 
                                                                                        <div class="cart-product-info">
                                                                                            <span class="product-color">COLOR:<span>Blue</span></span>
                                                                                        </div>-->
                                        </td>

                                        <td class="cart-product-quantity">
                                            <div class="quant-input">

                                                <input type="number" onblur="updateCart('${u}', this, ${cart.productId})" value="${cart.quantity}">
                                            </div>
                                        </td>
                                        <td class="cart-product-sub-total"><span class="cart-sub-total-price">${cart.price} VND</span></td>
                                    </tr>
                                </c:forEach>
                            </tbody><!-- /tbody -->

                            <tfoot>
                                <tr>
                                    <td colspan="7">
                                        <div class="shopping-cart-btn">
                                            <span class="">
                                                <a href="<c:url value="/products"/>" class="btn btn-upper btn-primary outer-left-xs">Tiếp tục mua sắm</a>

                                            </span>
                                        </div><!-- /.shopping-cart-btn -->
                                    </td>
                                </tr>
                            </tfoot>
                        </table><!-- /table -->
                    </div>
                </div><!-- /.shopping-cart-table -->

                <div class="col-md-4 col-sm-12 cart-shopping-total">
                    <table class="table">
                        <thead>
                            <tr >
                                <th>

                                    <div class="cart-grand-total" id="totalCart">
                                        Tổng tiền<span class="inner-left-md">${totalMoney.total} VND</span>
                                    </div>
                                </th>
                            </tr>
                        </thead><!-- /thead -->
                        <tbody>
                            <tr>
                                <td>
                                    <c:url value="/api/pay" var="u" />
                                    <div class="cart-checkout-btn pull-right">
                                        <button type="submit" onclick="pay('${u}')" class="btn btn-primary checkout-btn">Đặt hàng</button>
                                        
                                    </div>
                                </td>
                        <form action="pay-momo" method="post">
                            <button 
                                type="submit" 
                                class="btn btn-primary btn-block"
                                onclick="this.form.action = 'pay-momo';"
                                >
                                Thanh toán qua momo
                            </button>
                        </form>
                        </tr>
                        </tbody><!-- /tbody -->
                    </table><!-- /table -->
                </div><!-- /.cart-shopping-total -->
            </div><!-- /.shopping-cart -->
        </div> <!-- /.row
        <!-- ============================================== BRANDS CAROUSEL : END ============================================== -->
    </div><!-- /.container -->
</div><!-- /.body-content -->
