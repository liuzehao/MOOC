<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js" style="background-color: #ffffff">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="<c:url value="/assets/global/plugins/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/global/plugins/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/global/plugins/uniform/css/uniform.default.css"/>" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="<c:url value="/assets/global/plugins/select2/select2.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/admin/pages/css/login-soft.css"/>" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->
    <link href="<c:url value="/assets/global/css/components.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/global/css/plugins.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/admin/layout/css/layout.css"/>" rel="stylesheet" type="text/css"/>
    <link id="style_color" href="<c:url value="/assets/admin/layout/css/themes/light.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/admin/layout/css/custom.css"/>" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/global/plugins/bootstrap-toastr/toastr.min.css"/>"/>
    <!-- END THEME STYLES -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body  class="login" style="background-color: #ffffff !important;">
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="index.html">
        <%--<img src="<c:url value="/img/logo/logo2.png"/>" style="width:225px;height: 65px"/>--%>
    </a>
</div>
<!-- END LOGO -->
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGIN -->
<div class="content" style="background-color:#dcdcdc;">
    <!-- BEGIN LOGIN FORM -->
    <form class="login-form" action="login" method="post" >
        <h2 class="form-title" style="text-align: center;color:#000000 "><b><spring:message code="USER_LOGIN"/></b></h2>
        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9"><spring:message code="USER_NAME"/></label>

            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名"
                       name="loginName" maxlength="20" id="loginName" value="" style="border-color:#000000"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9"><spring:message code="USER_PASSWORD"/></label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码"
                       name="password" id="password" value="" style="border-color:#000000"/>
            </div>
        </div>
        <div class="form-actions">
            <label class="checkbox">
                <input style="margin-left: 0px;" type="checkbox" name="rememberMe"  value="true"/><span style="color:#000000;margin-left: 10px;">记住我</span></label>
            <button type="submit" class="btn blue pull-right" id="loginBtn" >
                <spring:message code="USER_LOGIN"/> <i class="m-icon-swapright m-icon-white"></i>
            </button>

        </div>
    </form>
    <!-- END LOGIN FORM -->
    <div class="copyright">
        <span style="color:#000000"><em><b>&copy; 学练考赛系统</b></em></span>
    </div>
</div>
<script src="<c:url value='/assets/global/plugins/respond.min.js'/>"></script>
<script src="<c:url value='/assets/global/plugins/excanvas.min.js'/>"></script>
<![endif]-->
<script src="<c:url value="/assets/global/plugins/jquery-1.11.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-migrate-1.2.1.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery.blockui.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery.cokie.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/uniform/jquery.uniform.min.js"/>" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<c:url value="/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-validation/js/additional-methods.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/backstretch/jquery.backstretch.min.js"/>"
        type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/select2/select2.min.js"/>"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<c:url value="/assets/global/scripts/metronic.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/admin/layout/scripts/layout.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/login.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/global/toast.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/bootstrap-toastr/toastr.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/plugins/ccjcJS/ccjcJS.min.js"/>" ></script>
<script>
    if (top != window) {
        top.location.href = "logout"
    }
    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Login.init();
        <%
            if(request.getAttribute("message")!=null){
        %>
        toast.error("<%=request.getAttribute("message")%>");
        <%
            }
        %>
    });
</script>
</body>
<!-- END BODY -->
</html>