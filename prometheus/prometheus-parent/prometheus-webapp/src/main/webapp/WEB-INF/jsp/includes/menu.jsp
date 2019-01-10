<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String permissionNum = request.getParameter("permissionNum");       // 开始时间id
    String permissionLeafNum = request.getParameter("permissionLeafNum");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<input type="hidden" id="permissionNum" name="permissionNum" value="<%=permissionNum%>"/>
<input type="hidden" id="permissionLeafNum" name="permissionLeafNum" value="<%=permissionLeafNum%>"/>
<ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
    <li class="sidebar-toggler-wrapper">
        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
        <div class="sidebar-toggler hidden-phone">
        </div>
        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
    </li>
    <li class="sidebar-search-wrapper">
        <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
        <!-- END RESPONSIVE QUICK SEARCH FORM -->
    </li>
    <li id="permission_1">
        <a href="javascript:;">
            <i class="fa fa-user faa-pulse animated-hover"></i>
            <span class="title">客户管理</span>
            <span class="arrow "> </span>
        </a>
        <ul class="sub-menu">
            <li id="permissionLeaf_1_1"><a href="<%=basePath%>client/getClientListDo">客户列表</a></li>
        </ul>
    </li>
</ul>
<script type="text/javascript">
    var permissionNum=$("#permissionNum").val();
    var permissionLeafNum=$("#permissionLeafNum").val();
    $("#permission_"+permissionNum).addClass("active");
    $("#permissionSpan_"+permissionNum).addClass("selected");
    $("#permissionLeaf_"+permissionNum+"_"+permissionLeafNum).addClass("active");

</script>