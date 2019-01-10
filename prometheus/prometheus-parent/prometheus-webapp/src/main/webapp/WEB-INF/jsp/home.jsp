<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--@elvariable id="studentList" type="java.util.List<com.genghis.prometheus.admin.student.model.StudentVO>"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <title>Home</title>
    <%@include file="includes/common.jsp" %>
    <%--<script src="<c:url value="/js/client/client.js"/>" type="text/javascript"></script>--%>
    <script src="<c:url value="/js/admin/admin.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/admin/student.js"/>" type="text/javascript"></script>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo">
<div class="page-header navbar navbar-fixed-top"  >
    <div class="top-menu">
        <a href="loginFront"><h4 style="margin-top: 13px; margin-right: 20px; color:#ffffff">登  陆</h4></a>
    </div>
    <div class="top-menu">
        <a href="stRegister"><h4 style="margin-top: 13px; margin-right: 80px; color:#ffffff">注 册</h4></a>
    </div>
</div>
<div class="page-container" style="margin-top: 180px;" >
    <div class="col-md-12" ></div>
    <div class="">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="col-md-3" style="padding-left: 0px; padding-right: 0px;">
                <h1 style="margin-left: 30px;color:red;">学</h1>
                <a href="loginFront"><img width="255" height="250" src="img/home/exam_u7_normal.jpg"  ></a>
            </div>
            <div  class="col-md-3" style="padding-left: 0px; padding-right: 0px;">
                <h1 style="margin-left: 60px; color:blue;">练</h1>
                <a href=""><img width="255" height="250" src="img/home/learn_u3_normal.jpg" ></a>
            </div>
            <div class="col-md-3" style="padding-left: 0px; padding-right: 0px;">
                <h1 style="margin-left: 30px;color:#ffff00;">考</h1>
                <a href=""><img width="255" height="250" src="img/home/match_u5_normal.jpg"></a>
            </div>
            <div class="col-md-3" style="padding-left: 0px; padding-right: 0px;">
                <h1 style="margin-left: 30px;color:#45d926;">赛</h1>
                <a href=""><img width="255" height="250" src="img/home/study_u1_normal.jpg"></a>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
</body>
</html>
