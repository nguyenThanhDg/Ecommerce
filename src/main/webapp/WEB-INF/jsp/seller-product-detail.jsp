<%-- 
    Document   : seller-product-detail
    Created on : Oct 3, 2022, 9:21:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="page-content">
    <!-- Page Header-->
    <div class="page-header no-margin-bottom">
        <div class="container-fluid">
            <h2 class="h5 no-margin-bottom">Chỉnh sửa sản phẩm</h2>
        </div>
    </div>
    <!-- Breadcrumb-->
    <div class="container-fluid">
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
        </ul>
    </div>
    <section class="no-padding-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="block">
                        <div class="title"><strong>Chỉnh sửa</strong></div>
                        <div class="block-body">
                            <c:url value="/seller/add-product" var="action" />
                            <form:form method="post" action="${action}"  enctype="multipart/form-data" modelAttribute="product" class="form-horizontal">
                                <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">Tên</label>
                                    <div class="col-sm-9">
                                        <form:input type="text" id="name" path="name" class="form-control"  />
                                        <form:errors path="name" cssClass="text-danger" element="div" />
                                    </div>
                                </div>
                                <div class="line"></div>
                                <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">Thông tin</label>
                                    <div class="col-sm-9">
                                        <form:input type="text" id="description" path="description" class="form-control"  />
                                        <form:errors path="description" cssClass="text-danger" element="div" />
                                    </div>
                                </div>


                                <div class="line"></div>
                                <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">Danh mục</label>
                                    <div class="col-sm-9">
                                        <form:select path="categoryId" class="form-control mb-3 mb-3">
                                            <c:forEach items="${category}" var="c">
                                                <option value="${c.id}">${c.name}</option>
                                            </c:forEach>

                                        </form:select>
                                        <form:errors path="categoryId" cssClass="text-danger" element="div" />

                                    </div>

                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">Giá</label>
                                    <div class="col-sm-9">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <form:input type="number" id="price" path="price" class="form-control" />
                                                <form:errors path="price" cssClass="text-danger" element="div" />
                                                <div class="input-group-append"><span class="input-group-text">VND</span></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="line"></div>
                                <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">Hình ảnh</label>
                                    <div class="col-sm-9">
                                        <div class="form-group">

                                            <form:input type="file" id="image" path="file" class="form-control form-control-lg" />
                                            <form:errors path="file" cssClass="text-danger" element="div" />
                                        </div>
                                    </div>
                                </div>


                                <div class="line"></div>
                                <div class="form-group row">
                                    <div class="col-sm-9 ml-auto">
                                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>
