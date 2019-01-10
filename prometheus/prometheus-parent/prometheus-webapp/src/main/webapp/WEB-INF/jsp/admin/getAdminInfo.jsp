<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <title>管理员页面</title>
    <%@include file="../includes/common.jsp" %>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo">
<%@include file="../includes/top.jsp" %>
<script src="<c:url value="/js/admin/admin.js"/>" type="text/javascript"></script>
<div class="page-container">
        <%--BEGIN SIDE BAR--%>
        <div class="page-sidebar navbar-collapse collapse">
            <ul class="page-sidebar-menu hidden-sm hidden-xs" data-auto-scroll="true" data-slide-speed="200">
                <li class="start active open">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i>
                        <span class="title"><spring:message code="BASIC_INFORMATION_MAINTENANCE"/></span>
                        <span class="arrow open"></span>
                        <span class="selected"></span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="admin/getTeacherInfoList">
                            <spring:message code="TEACHER_BASIC_INFORMATION_MAINTENANCE"/></a>
                        </li>
                        <li>
                            <a href="admin/getStudentInfoList">
                            <spring:message code="STUDENT_BASIC_INFORMATION_MAINTENANCE"/></a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- BEGIN PAGE HEADER-->
        <div class="page-content-wrapper">
            <div class="page-content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                        <ul class="page-breadcrumb breadcrumb" style="margin-top: 0;margin-bottom: 10px">
                            <li>
                                <i class="fa fa-home"></i>
                                <a href="index.html"><spring:message code="HOME_PAGE"/></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="#" ><spring:message code="BASIC_INFORMATION_MAINTENANCE"/></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                        </ul>
                        <!-- END PAGE TITLE & BREADCRUMB-->
                    </div>
                </div>
            </div>
        </div>
</div>
    <!-- END PAGE HEADER-->
</body>
</html>

