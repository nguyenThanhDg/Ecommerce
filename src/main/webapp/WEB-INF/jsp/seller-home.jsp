<%-- 
    Document   : admin-home
    Created on : Sep 30, 2022, 1:49:58 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="page-content">
    <div class="page-header">
        <div class="container-fluid">
            <h2 class="h5 no-margin-bottom">Thong ke</h2>
        </div>
    </div>
    <section class="no-padding-top no-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="statistic-block block">
                        <div class="progress-details d-flex align-items-end justify-content-between">
                            <div class="title">
                                <div class="icon"><i class="icon-writing-whiteboard"></i></div><strong>So san pham</strong>
                            </div>
                            <div class="number dashtext-1">${countProduct}</div>
                        </div>
                        <div class="progress progress-template">
                            <div role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-1"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="statistic-block block">
                        <div class="progress-details d-flex align-items-end justify-content-between">
                            <div class="title">
                                <div class="icon"><i class="icon-contract"></i></div><strong>san pham da ban</strong>
                            </div>
                            <div class="number dashtext-2">${countOrder}</div>
                        </div>
                        <div class="progress progress-template">
                            <div role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-2"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="statistic-block block">
                        <div class="progress-details d-flex align-items-end justify-content-between">
                            <div class="title">
                                <div class="icon"><i class="icon-paper-and-pencil"></i></div><strong>Doanh thu</strong>
                            </div>
                            <div class="number dashtext-3">${totalRevenue}</div>
                        </div>
                        <div class="progress progress-template">
                            <div role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-3"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="no-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="line-cahrt block">
                        <canvas id="lineCahrt"></canvas>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <section class="no-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="line-cahrt block">
                        <canvas id="lineChartCustom2"></canvas>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <section class="no-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <c:forEach items="${hotProducts}" var="p">
                    <div class="col-lg-4">
                        <div class="user-block block text-center">
                            <div class="avatar"><img src="${p[1]}" alt="..." class="img-fluid">
                            </div><a href="#" class="user-title">
                                <h3 class="h5">${p[5]}</h3><span>${p[0]}</span></a>
                            <div class="contributions">${p[4]}</div>
                            <div class="details d-flex">
                                <div class="item"><strong>${p[2]}</strong></div>
                                <div class="item"><strong>${p[3].name}</strong></div>
                                <div class="item"><strong>${p[6]}</strong></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

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
                                <div class="avatar"> <img src="${p[1]}" alt="..." class="img-fluid"></div><a href="#" class="name"><strong class="d-block">${p[0]}</strong><span class="d-block">${p[2]} ${p[3]}</span></a>
                            </div>
                            <div class="col-lg-4 text-center">
                                <div class="contributions">${p[6]}</div>
                            </div>
                            <div class="col-lg-4">
                                <div class="details d-flex">
                                    <div class="item"><i class="icon-info"></i><strong>${p[4]}</strong></div>
                                    <div class="item"><i class="fa fa-gg"></i><strong>${p[5]}</strong></div>
                                    <div class="item"><i class="icon-flow-branch"></i><strong>${p[7]}</strong></div>
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
<script>
    window.onload = function () {
        let data = [];
        let labels = [];
        let data2 = [];
    <c:forEach items="${chart}" var="c">
        data.push(${c[3]});
        labels.push('${c[0]}');
        data2.push(${c[2]});
    </c:forEach>
        chart2(labels, data);
        chart1(labels, data2);
    }
</script>
