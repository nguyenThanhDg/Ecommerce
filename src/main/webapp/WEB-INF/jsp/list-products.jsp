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
            <h2 class="h5 no-margin-bottom">Danh sach</h2>
        </div>
    </div>
    <section class="no-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">                           
                    <div class="block">
                        <div class="title"><strong>Tim kiem san pham da ban theo thoi gian va tu khoa</strong></div>
                        <div class="block-body">
                            <form class="form-inline">
                                <div class="form-group">
                                    <input name="fromDate" type="date" placeholder="tu ngay" class="mr-sm-3 form-control">
                                </div>
                                <div class="form-group">
                                    <input name="toDate" type="date" placeholder="den ngay" class="mr-sm-3 form-control form-control">
                                </div>
                                <div class="form-group">
                                    <label for="inlineFormInput" class="sr-only">Name</label>
                                    <input name="kw" type="text" placeholder="nhap tu khoa can tim" class="mr-sm-1 form-control">
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="tim" class="btn btn-primary">
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${!products.isEmpty()}">
                <div class="public-user-block block">
                    <div class="row d-flex align-items-center">                   
                            <div class="col-lg-4 d-flex align-items-center">
                                <h4>Ten san pham</h4>
                            </div>
                            <div class="col-lg-4 text-center">
                                <h4>Ngay mua</h4>
                            </div>
                            <div class="col-lg-4">
                                <div class="details d-flex">
                                    <h4 class="item">Don gia</h4>
                                    <h4 class="item">So luong</h4>
                                    <h4 class="item">Tong tien</h4>
                                </div>
                            </div>
                    </div>
                    <c:forEach items="${products}" var="p" >

                        <div class="row d-flex align-items-center">                   
                            <div class="col-lg-4 d-flex align-items-center">
                                <div class="avatar"> <img src="${p.image}" alt="..." class="img-fluid"></div><a href="#" class="name"><strong class="d-block"></strong><span class="d-block"></span></a>
                            </div>
                            <div class="col-lg-4 text-center">
                                <div class="contributions"></div>
                            </div>
                            <div class="col-lg-4">
                                <div class="details d-flex">
                                    <div class="item"><i class="icon-info"></i><strong></strong></div>
                                    <div class="item"><i class="fa fa-gg"></i><strong></strong></div>
                                    <div class="item"><i class="icon-flow-branch"></i><strong></strong></div>
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
                        <strong class="d-block">khong co ket qua</strong>
                    </div>
                </div>
            </c:if>
        </div>
    </section>
    <footer class="footer">
        <div class="footer__block block no-margin-bottom">
            <div class="container-fluid text-center">
                <!-- Please do not remove the backlink to us unless you support us at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                <p class="no-margin-bottom">2018 &copy; Your company. Download From <a target="_blank" href="https://templateshub.net">Templates Hub</a>.</p>
            </div>
        </div>
    </footer>
</div>
