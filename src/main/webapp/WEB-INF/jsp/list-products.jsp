<%-- 
    Document   : list-products
    Created on : Oct 2, 2022, 1:51:51 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="page-content">
    <div class="page-header">
        <div class="container-fluid">
            <h2 class="h5 no-margin-bottom">Danh sách sản phẩm</h2>
        </div>
    </div>
    <section class="no-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">                           
                    <div class="block">
                        <div class="title"><strong>Tìm kiếm sản phẩm đã bán theo thời gian và từ khoá</strong></div>
                        <div class="block-body">
                            <form class="form-inline">
                                <div class="form-group">
                                    <input name="fromDate" type="date" class="mr-sm-3 form-control">
                                </div>
                                <div class="form-group">
                                    <input name="toDate" type="date" class="mr-sm-3 form-control form-control">
                                </div>
                                <div class="form-group">
                                    <label for="inlineFormInput" class="sr-only">Name</label>
                                    <input name="kw" type="text" placeholder="Nhập từ khoá cần tìm" class="mr-sm-1 form-control">
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Tìm" class="btn btn-primary">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${!products.isEmpty()}">
                <div class="public-user-block block">
                    <div class="row d-flex align-items-center">                   
                        <div class="col-lg-3 d-flex align-items-center">
                            <h4>Sản phẩm</h4>
                        </div>

                        <div class="col-lg-5">
                            <div class="details d-flex">
                                <h5 class="item">Đơn giá</h5>
                                <h5 class="item">Danh mục</h5>
                                <h5 class="item">Trạng thái</h5>
                                <h5 class="item">Ngày đăng</h5>
                            </div>
                        </div>
                       
                    </div>
                    <c:forEach items="${products}" var="p" >

                        <div class="row d-flex align-items-center">                   
                            <div class="col-lg-3 d-flex align-items-center">
                                <div class="avatar"> <img src="${p.image}" alt="..." class="img-fluid"></div><a href="#" class="name"><strong class="d-block">${p.name}</strong><span class="d-block"></span></a>
                            </div>

                            <div class="col-lg-5">
                                <div class="details d-flex">
                                    <div class="item"><strong>${p.price}</strong></div>
                                    <div class="item"><strong>${p.categoryId.name}</strong></div>
                                    <div class="item"><strong>${p.status}</strong></div>
                                    <div class="item">${p.createdDate}</div>
                                </div>
                            </div>
                            <div class="col-lg-4 text-center">
                                <div class="details d-flex">
                                    <div class="item"><a class="btn btn-info" href="<c:url value="/seller/products/${p.id}" />">Xem</a></div>
                                    <c:url value="/api/products/${p.id}" var="endpoint" />
                                    <div class="item"><button class="btn btn-success" onclick="pauseProduct('${endpoint}')">Dừng</button></div>
                                    <div class="item"><button class="btn btn-danger" onclick="delProduct('${endpoint}')">Xoá</button></div>
                                    <div class="item"><a class="btn btn-secondary" href="<c:url value="/seller/products/${p.id}/comments" />">Bình luận</a></div>
                                    
                                </div>
                            </div>
                        </div>
                        <br>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${products.isEmpty()}">
                <div class="public-user-block block">
                    <div class="row d-flex align-items-center">                   
                        <strong class="d-block">Không có kết quả</strong>
                    </div>
                </div>
            </c:if>
        </div>
    </section>
</div>
