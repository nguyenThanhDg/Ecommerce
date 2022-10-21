<%-- 
    Document   : testadmin
    Created on : Oct 11, 2022, 9:16:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<section class="section">
    <div class="row ">
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="card">
                <div class="card-statistic-4">
                    <div class="align-items-center justify-content-between">
                        <div class="row ">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                <div class="card-content">
                                    <h5 class="font-15">New Booking</h5>
                                    <h2 class="mb-3 font-18">${allproducts.size()}</h2>
                                    <p class="mb-0"><span class="col-green">10%</span> Increase</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                <div class="banner-img">
                                    <img src="<c:url value="/adminpage/assets/img/banner/1.png"/>" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="card">
                <div class="card-statistic-4">
                    <div class="align-items-center justify-content-between">
                        <div class="row ">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                <div class="card-content">
                                    <h5 class="font-15"> Customers</h5>
                                    <h2 class="mb-3 font-18">${customers.size()}</h2>
                                    <p class="mb-0"><span class="col-orange">09%</span> Decrease</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                <div class="banner-img">
                                    <img src="<c:url value="/adminpage/assets/img/banner/2.png"/>" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="card">
                <div class="card-statistic-4">
                    <div class="align-items-center justify-content-between">
                        <div class="row ">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                <div class="card-content">
                                    <h5 class="font-15">New Project</h5>
                                    <h2 class="mb-3 font-18">128</h2>
                                    <p class="mb-0"><span class="col-green">18%</span>
                                        Increase</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                <div class="banner-img">
                                    <img src="assets/img/banner/3.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="card">
                <div class="card-statistic-4">
                    <div class="align-items-center justify-content-between">
                        <div class="row ">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                <div class="card-content">
                                    <h5 class="font-15">Revenue</h5>
                                    <h2 class="mb-3 font-18">$48,697</h2>
                                    <p class="mb-0"><span class="col-green">42%</span> Increase</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                <div class="banner-img">
                                    <img src="assets/img/banner/4.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4>Danh sach dang ki ban hang</h4>
                    <div class="card-header-form">
                        <form>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <th>Ten</th>
                                <th>Anh</th>
                                <th>Email</th>
                                <th>sdt</th>
                                <th>Ngay tao</th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                            <c:forEach items="${resellers}" var="s" >
                                <c:url value="/api/sellerConfirm/${s.id}/accept" var="endpoint1" />
                                <c:url value="/api/sellerConfirm/${s.id}/cancel" var="endpoint2" />
                                <tr>
                                    <td>${s.firstName} ${s.lastName}</td>
                                    <td class="text-truncate">
                                        <ul class="list-unstyled order-list m-b-0 m-b-0">
                                            <img class="avatar-lg avatar"
                                                 src="${s.avatar}" alt="user"
                                                 />
                                        </ul>
                                    </td>
                                    <td class="align-middle">
                                        ${s.email}
                                    </td>
                                    <td>${s.phone}</td>
                                    <td>${s.createdDate}</td>

                                    <td>
                                        <button onclick="cancelSeller('${endpoint2}')" class="btn btn-outline-danger">tu choi</button>
                                    </td>
                                    <td><button onclick="acceptSeller('${endpoint1}')" class="btn btn-outline-primary">Xac nhan 1</button></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4>Danh sach dang ki ban hang</h4>
                    <div class="card-header-form">
                        <form>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <th>Ten</th>
                                <th>Anh</th>
                                <th>Email</th>
                                <th>sdt</th>
                                <th>Ngay tao</th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                            <c:forEach items="${sellers}" var="s" >
                                <tr>
                                    <td>${s.firstName} ${s.lastName}</td>
                                    <td class="text-truncate">
                                        <ul class="list-unstyled order-list m-b-0 m-b-0">
                                            <img class="avatar-lg avatar"
                                                 src="${s.avatar}" alt="user"
                                                 />
                                        </ul>
                                    </td>
                                    <td class="align-middle">
                                        ${s.email}
                                    </td>
                                    <td>${s.phone}</td>
                                    <td>${s.createdDate}</td>

                                    <td>
                                        <a class="btn btn-outline-info" href="#">Xem thong tin</a>
                                    </td>
                                    <td><a href="#" class="btn btn-outline-primary">Xac nhan</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>