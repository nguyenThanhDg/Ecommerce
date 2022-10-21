<%-- 
    Document   : 404page
    Created on : Oct 20, 2022, 1:59:08 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<section class="section">
    <div class="container mt-5">
        <div class="page-error">
            <div class="page-inner">
                <h1>404</h1>
                <div class="page-description">
                    The page you were looking for could not be found.
                </div>
                <div class="page-search">
                    <form>
                        <div class="form-group floating-addon floating-addon-not-append">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fas fa-search"></i>
                                    </div>
                                </div>
                                <input type="text" class="form-control" placeholder="Search">
                                <div class="input-group-append">
                                    <button class="btn btn-primary btn-lg">
                                        Search
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="mt-3">
                        <a href="<c:url value="/admin/"/> ">Back to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
