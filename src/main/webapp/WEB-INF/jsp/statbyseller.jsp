<%-- 
    Document   : statbyseller
    Created on : Oct 20, 2022, 1:49:49 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<section class="section">
    <div class="section-body">
        <div class="row">
            <div class="col-xl-8 col-md-12 col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h4>Revenue Chart</h4>
                    </div>
                    <div class="card-body">
                        <ul class="list-inline text-center">
                            <li class="list-inline-item p-r-30"><i data-feather="arrow-up-circle" class="col-green"></i>
                                <h5 class="m-b-0">$675</h5>
                                <p class="text-muted font-14 m-b-0">Weekly Earnings</p>
                            </li>
                            <li class="list-inline-item p-r-30"><i data-feather="arrow-down-circle" class="col-orange"></i>
                                <h5 class="m-b-0">$1,587</h5>
                                <p class="text-muted font-14 m-b-0">Monthly Earnings</p>
                            </li>
                            <li class="list-inline-item p-r-30"><i data-feather="arrow-up-circle" class="col-green"></i>
                                <h5 class="mb-0 m-b-0">$45,965</h5>
                                <p class="text-muted font-14 m-b-0">Yearly Earnings</p>
                            </li>
                        </ul>
                        <div id="revenue"></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-12 col-lg-4">
                <div class="card l-bg-orange">
                    <div class="card-body">
                        <div class="text-white">
                            <div class="row">
                                <div class="col-md-6 col-lg-5">
                                    <h4 class="mb-0 font-26">$1,235</h4>
                                    <p class="mb-2">Avg Sales Per Month</p>
                                    <p class="mb-0">
                                        <span class="font-20">+11.25% </span>Increase
                                    </p>
                                </div>
                                <div class="col-md-6 col-lg-7">
                                    <div class="sparkline-bar p-t-50"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card l-bg-cyan">
                    <div class="card-body">
                        <div class="text-white">
                            <div class="row">
                                <div class="col-md-6 col-lg-5">
                                    <h4 class="mb-0 font-26">758</h4>
                                    <p class="mb-2">Avg new Cust Per Month</p>
                                    <p class="mb-0">
                                        <span class="font-20">+25.11%</span> Increase
                                    </p>
                                </div>
                                <div class="col-md-6 col-lg-7">
                                    <div class="sparkline-line-chart2 p-t-50"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-sm-12 col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h4>Summary</h4>
                        <div class="card-header-action">
                            <a href="#summary-chart" data-tab="summary-tab" class="btn active">Chart</a>
                            <a href="#summary-text" data-tab="summary-tab" class="btn">Text</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="summary">
                            <div class="summary-info" data-tab-group="summary-tab" id="summary-text">
                                <h4>$3,157</h4>
                                <div class="text-muted">Total Earning Today</div>
                                <div class="d-block mt-2">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                            <div class="summary-chart active" data-tab-group="summary-tab" id="summary-chart">
                                <canvas id="myChart" height="180"></canvas>
                            </div>
                            <div class="summary-item">
                                <h6 class="mt-3">Recent Purchase <span class="text-muted">(4 Items)</span></h6>
                                <ul class="list-unstyled list-unstyled-border">
                                    <li class="media">
                                        <img alt="image" src="assets/img/users/user-1.png"
                                             class="mr-3 user-img-radious-style user-list-img" width="40">
                                        <div class="media-body">
                                            <div class="media-right">$112</div>
                                            <div class="media-title"><a href="#">Sarah Smith</a></div>
                                            <div class="text-small text-muted">From <a href="#">London</a>
                                                <div class="bullet"></div> Monday
                                            </div>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <a href="#">
                                            <img alt="image" src="assets/img/users/user-2.png"
                                                 class="mr-3 user-img-radious-style user-list-img" width="40">
                                        </a>
                                        <div class="media-body">
                                            <div class="media-right">$225</div>
                                            <div class="media-title"><a href="#">Ashton Cox</a></div>
                                            <div class="text-small text-muted">From <a href="#">India</a>
                                                <div class="bullet"></div> Sunday
                                            </div>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <a href="#">
                                            <img alt="image" src="assets/img/users/user-3.png"
                                                 class="mr-3 user-img-radious-style user-list-img" width="40">
                                        </a>
                                        <div class="media-body">
                                            <div class="media-right">$479</div>
                                            <div class="media-title"><a href="#">John Doe</a></div>
                                            <div class="text-muted text-small">From <a href="#">China</a>
                                                <div class="bullet"></div> Friday
                                            </div>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <a href="#">
                                            <img alt="image" src="assets/img/users/user-4.png"
                                                 class="mr-3 user-img-radious-style user-list-img" width="40">
                                        </a>
                                        <div class="media-body">
                                            <div class="media-right">$669</div>
                                            <div class="media-title"><a href="#">Airi Satou</a></div>
                                            <div class="text-small text-muted">From <a href="#">Shilanka</a>
                                                <div class="bullet"></div> Tuesday
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-12 col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h4>Statistics</h4>
                        <div class="card-header-action">
                            <a href="#" class="btn active">Week</a>
                            <a href="#" class="btn">Month</a>
                            <a href="#" class="btn">Year</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <canvas id="myChart2" height="180"></canvas>
                        <div class="statistic-details mt-1">
                            <div class="statistic-details-item">
                                <div class="text-small text-muted"><span class="text-primary"><i
                                            class="fas fa-caret-up"></i></span> 12%</div>
                                <div class="detail-value">$125</div>
                                <div class="detail-name">Today</div>
                            </div>
                            <div class="statistic-details-item">
                                <div class="text-small text-muted"><span class="text-danger"><i
                                            class="fas fa-caret-down"></i></span> 33%</div>
                                <div class="detail-value">$3,564</div>
                                <div class="detail-name">This Week</div>
                            </div>
                            <div class="statistic-details-item">
                                <div class="text-small text-muted"><span class="text-primary"><i
                                            class="fas fa-caret-up"></i></span>19%</div>
                                <div class="detail-value">$14,687</div>
                                <div class="detail-name">This Month</div>
                            </div>
                            <div class="statistic-details-item">
                                <div class="text-small text-muted"><span class="text-primary"><i
                                            class="fas fa-caret-up"></i></span>29%</div>
                                <div class="detail-value">$88,568</div>
                                <div class="detail-name">This Year</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mt-4">
                    <div class="card-header">
                        <h4>Popular Browser</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col mb-4 mb-lg-0 text-center">
                                <div class="browser browser-chrome"></div>
                                <div class="mt-2 font-weight-bold">Chrome</div>
                                <div class="text-small text-muted"><span class="text-primary"><i
                                            class="fas fa-caret-up"></i></span> 38%</div>
                            </div>
                            <div class="col mb-4 mb-lg-0 text-center">
                                <div class="browser browser-firefox"></div>
                                <div class="mt-2 font-weight-bold">Firefox</div>
                                <div class="text-small text-muted"><span class="text-primary"><i
                                            class="fas fa-caret-up"></i></span> 22%</div>
                            </div>
                            <div class="col mb-4 mb-lg-0 text-center">
                                <div class="browser browser-safari"></div>
                                <div class="mt-2 font-weight-bold">Safari</div>
                                <div class="text-small text-muted"><span class="text-danger"><i
                                            class="fas fa-caret-down"></i></span> 27%</div>
                            </div>
                            <div class="col mb-4 mb-lg-0 text-center">
                                <div class="browser browser-opera"></div>
                                <div class="mt-2 font-weight-bold">Opera</div>
                                <div class="text-small text-muted">9%</div>
                            </div>
                            <div class="col mb-4 mb-lg-0 text-center">
                                <div class="browser browser-internet-explorer"></div>
                                <div class="mt-2 font-weight-bold">IE</div>
                                <div class="text-small text-muted"><span class="text-primary"><i
                                            class="fas fa-caret-up"></i></span> 4%</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="card card-statistic-2">
                    <div class="card-icon shadow-primary bg-cyan">
                        <i class="fas fa-hiking"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4 class="pull-right">New Clients</h4>
                        </div>
                        <div class="card-body pull-right">
                            10,225
                        </div>
                    </div>
                    <div class="card-chart">
                        <canvas id="chart-1" height="80"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="card card-statistic-2">
                    <div class="card-icon shadow-primary bg-purple">
                        <i class="fas fa-drafting-compass"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4 class="pull-right">Delivered Order</h4>
                        </div>
                        <div class="card-body pull-right">
                            2,857
                        </div>
                    </div>
                    <div class="card-chart">
                        <canvas id="chart-2" height="80"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="card card-statistic-2">
                    <div class="card-icon shadow-primary bg-green">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4 class="pull-right">Total Earning</h4>
                        </div>
                        <div class="card-body pull-right">
                            $17,458
                        </div>
                    </div>
                    <div class="card-chart">
                        <canvas id="chart-3" height="80"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-sm-12 col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <h4>Visitors</h4>
                    </div>
                    <div class="card-body">
                        <div id="visitorMap4" data-height="190"></div>
                    </div>
                    <div class="card-footer card-footer-grey pt-0">
                        <div class="statistic-details mt-4 align-items-center justify-content-center">
                            <div class="statistic-details-item col-sm-4 col-12">
                                <div class="detail-chart">
                                    <div class="sparkline-line-chart"></div>
                                </div>
                                <div class="detail-value">11,365</div>
                                <div class="detail-name">Visits</div>
                            </div>
                            <div class="statistic-details-item col-sm-4 col-12">
                                <div class="detail-chart">
                                    <div class="sparkline-line-chart"></div>
                                </div>
                                <div class="detail-value">32%</div>
                                <div class="detail-name">Referral</div>
                            </div>
                            <div class="statistic-details-item col-sm-4 col-12">
                                <div class="detail-chart">
                                    <div class="sparkline-line-chart"></div>
                                </div>
                                <div class="detail-value">68%</div>
                                <div class="detail-name">Organic</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mt-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3 col-6 mb-md-0 mb-4 text-center">
                                <div class="img-shadow flag-icon flag-icon-au"></div>
                                <div class="mt-2 font-weight-bold text-nowrap">Australia</div>
                                <div class="text-small text-muted">9,500</div>
                            </div>
                            <div class="col-sm-3 col-6 mb-md-0 mb-4 text-center">
                                <div class="img-shadow flag-icon flag-icon-br"></div>
                                <div class="mt-2 font-weight-bold text-nowrap">Brazil</div>
                                <div class="text-small text-muted"><span class="text-primary"><i
                                            class="fas fa-caret-up"></i></span> 7,328</div>
                            </div>
                            <div class="col-sm-3 col-6 text-center">
                                <div class="img-shadow flag-icon flag-icon-in"></div>
                                <div class="mt-2 font-weight-bold text-nowrap">India</div>
                                <div class="text-small text-muted"><span class="text-danger"><i
                                            class="fas fa-caret-down"></i></span> 5,830</div>
                            </div>
                            <div class="col-sm-3 col-6 text-center">
                                <div class="img-shadow flag-icon flag-icon-ch"></div>
                                <div class="mt-2 font-weight-bold text-nowrap">Switzerland</div>
                                <div class="text-small text-muted">4,763</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-12 col-lg-6 mt-lg-0 mt-sm-4">
                <div class="card">
                    <div class="card-header">
                        <h4>Referral URL</h4>
                    </div>
                    <div class="card-body">
                        <canvas id="myChart3" height="170"></canvas>
                        <div class="mb-4 mt-4">
                            <div class="text-small float-right font-weight-bold text-muted">558</div>
                            <div class="font-weight-bold mb-1">Google</div>
                            <div class="progress" data-height="4" data-toggle="tooltip" title="58%">
                                <div class="progress-bar bg-success" data-width="58%"></div>
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="text-small float-right font-weight-bold text-muted">338</div>
                            <div class="font-weight-bold mb-1">Facebook</div>
                            <div class="progress" data-height="4" data-toggle="tooltip" title="44%">
                                <div class="progress-bar bg-purple" data-width="44%"></div>
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="text-small float-right font-weight-bold text-muted">238</div>
                            <div class="font-weight-bold mb-1">Bing</div>
                            <div class="progress" data-height="4" data-toggle="tooltip" title="32%">
                                <div class="progress-bar bg-orange" data-width="32%"></div>
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="text-small float-right font-weight-bold text-muted">190</div>
                            <div class="font-weight-bold mb-1">Yahoo</div>
                            <div class="progress" data-height="4" data-toggle="tooltip" title="22%">
                                <div class="progress-bar bg-cyan" data-width="22%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-12 col-12 col-sm-12">
                <div class="card mt-sm-5 mt-md-0">
                    <div class="card-header">
                        <h4>Visitors</h4>
                    </div>
                    <div class="card-body">
                        <canvas id="donutChart"></canvas>
                        <ul class="p-t-30 list-unstyled">
                            <li class="padding-5"><span><i class="fa fa-circle m-r-5 col-black"></i></span>Search Engines<span
                                    class="float-right">30%</span></li>
                            <li class="padding-5"><span><i class="fa fa-circle m-r-5 col-green"></i></span>Direct Click<span
                                    class="float-right">50%</span></li>
                            <li class="padding-5"><span><i class="fa fa-circle m-r-5 col-orange"></i></span>Video Click<span
                                    class="float-right">20%</span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 col-12 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Authors</h4>
                    </div>
                    <div class="card-body">
                        <h3 class="card-title"><i class="fas fa-dollar-sign col-green font-30 p-b-10"></i> 763,215</h3>
                        <canvas id="line-chart3"></canvas>
                        <div class="row p-t-20">
                            <div class="col-4">
                                <p class="text-muted font-15 text-truncate m-b-5">Target</p>
                                <h5>
                                    <i class="fas fa-arrow-circle-up col-green m-r-5"></i>$15.3k
                                </h5>
                            </div>
                            <div class="col-4">
                                <p class="text-muted font-15 text-truncate m-b-5">Last
                                    week</p>
                                <h5>
                                    <i class="fas fa-arrow-circle-down col-red m-r-5"></i>$2.8k
                                </h5>
                            </div>
                            <div class="col-4">
                                <p class="text-muted text-truncate m-b-5">Last
                                    Month</p>
                                <h5>
                                    <i class="fas fa-arrow-circle-up col-green m-r-5"></i>$12.5k
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
