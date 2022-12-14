<%-- 
    Document   : login
    Created on : Sep 23, 2022, 5:28:41 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- ============================================== HEADER : END ============================================== -->
  <div class="breadcrumb">
    <div class="container">
      <div class="breadcrumb-inner">
        <ul class="list-inline list-unstyled">
          <li class='active'>Đăng nhập</li>
        </ul>
      </div><!-- /.breadcrumb-inner -->
    </div><!-- /.container -->
  </div><!-- /.breadcrumb -->

  <div class="body-content">
    <div class="container">
      <div class="sign-in-page">
        <div class="row">
          <!-- Sign-in -->
          <div class="col-md-10 col-sm-6 sign-in">
            <h4 class="">Đăng nhập</h4>
            <c:if test="${param.error != null}">
                    <div class="alert alert-danger">
                        Đăng nhập thất bại
                    </div>

                </c:if>
                <c:if test="${param.accessDenied != null}">
                    <div class="alert alert-danger">
                        Bạn không có quyền truy cập
                    </div>
                </c:if>
                <!-- Login Form s-->
                <c:url value="/login" var="action" />
            <form class="register-form outer-top-xs" role="form" method="post" action="${action}">
              <div class="form-group">
                <label class="info-title" for="exampleInputEmail1">Tên đăng nhập<span>*</span></label>
                <input type="text" class="form-control unicase-form-control text-input" name="username">
              </div>
              <div class="form-group">
                <label class="info-title" for="exampleInputPassword1">Mật khẩu<span>*</span></label>
                <input type="password" class="form-control unicase-form-control text-input" name="password">
              </div>
              <div class="radio outer-xs">
                <label>
                  <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Nhớ mật khẩu
                </label>
                <a href="#" class="forgot-password pull-right">Quên mật khẩu</a>
              </div>
              <button type="submit" class="btn-upper btn btn-primary checkout-page-button">Đăng nhập</button>
            </form>
          </div>
          <!-- Sign-in -->
        </div><!-- /.row -->
      </div><!-- /.sigin-in-->
    </div><!-- /.container -->
  </div><!-- /.body-content -->

