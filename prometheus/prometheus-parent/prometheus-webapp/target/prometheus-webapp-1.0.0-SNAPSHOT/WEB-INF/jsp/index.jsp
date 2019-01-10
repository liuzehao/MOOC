<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js"> <!--<![endif]-->
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@ include file="includes/common.jsp" %>
</head>
<body class="page-header-fixed">
<%@include file="includes/top.jsp" %>
<div class="page-container" data-options="tools:'#tab-tools'">
    <div class="page-sidebar-wrapper">
        <div class="page-sidebar navbar-collapse collapse">
            <%@include file="includes/menu.jsp" %>
        </div>
    </div>
    <div class="page-content-wrapper" data-options="tools:'#tab-tools'">
        <div class="page-content" style="min-height:1033px !important">
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <ul class="page-breadcrumb breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">首页</a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li class="pull-right">
                            <span id="nowTime"></span>
                        </li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- BEGIN FOOTER -->
<%@include file="includes/footer.jsp" %>
<!-- END FOOTER -->
</body>

</html>
<script>
    $(function () {
        window.setInterval(setNowTime, 1000);
    });
    function setNowTime() {
        var nowDate = format(new Date(), "yyyy-MM-dd hh:mm:ss");
        $("#nowTime").html(nowDate)
    }

    function format(date, fmt) {
        var o = {
            "M+": date.getMonth() + 1,                 //月份
            "d+": date.getDate(),                    //日
            "h+": date.getHours(),                   //小时
            "m+": date.getMinutes(),                 //分
            "s+": date.getSeconds()                 //秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>