<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="page-header navbar navbar-fixed-top">
    <!-- BEGIN HEADER -->
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="index.html">
                <img src="../../assets/admin/layout/img/logo.png" alt="logo" class="logo-default"/>
            </a>
            <div class="menu-toggler sidebar-toggler">
            </div>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN HORIZANTAL MENU -->
        <div class="hor-menu hor-menu-light hidden-sm hidden-xs" style="margin-top: 20px;">

            <!--按钮样式1：返回 -->
            <a href="index.html">
                <span style="font-family:Arial;font-size:20px;font-weight:bold;font-style:normal;text-decoration:underline;color:ghostwhite;margin-left: 50px;">学习模块
                </span>
            </a>
            <!--按钮样式2：下拉菜单一列 -->
            <a href="index.html" style="margin-left: 60px;">
                <span style="font-family:Arial;font-size:20px;font-weight:bold;font-style:normal;text-decoration:underline;color:ghostwhite;margin-left: 50px;">练习模块
                </span>
            </a>
            <a href="index.html" style="margin-left: 60px;">
                <span style="font-family:Arial;font-size:20px;font-weight:bold;font-style:normal;text-decoration:underline;color:ghostwhite;margin-left: 50px;">考试模块
                </span>
            </a>
            <a href="index.html" style="margin-left: 60px;">
                <span style="font-family:Arial;font-size:20px;font-weight:bold;font-style:normal;text-decoration:underline;color:ghostwhite;margin-left: 50px;">竞赛模块
                </span>
            </a>
        </div>
        <!-- END HORIZANTAL MENU -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <div class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
        </div>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN TOP NAVIGATION MENU -->
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
                <li class="dropdown dropdown-extended dropdown-notification" id="header_home_bar">
                    <a class="dropdown-toggle"
                       style="margin-top: 10px; margin-right: 5px; height: 20px; padding-bottom: 19px; padding-top: 17px;"
                       data-close-others="true" data-hover="dropdown" data-toggle="dropdown" onclick="toGetSettingInfo()"
                       title="设置" href="#">
                        <i class="fa fa-cog"></i><span style="color: white">设置</span>
                    </a>
                </li>
                <!-- BEGIN USER LOGIN DROPDOWN -->
                <li class="dropdown dropdown-extended dropdown-notification" id="header_quit_bar">
                    <a class="dropdown-toggle"
                       style="margin-top: 10px; margin-right: 5px; height: 20px; padding-bottom: 19px; padding-top: 17px;"
                       data-close-others="true"
                       data-hover="dropdown" data-toggle="dropdown" onclick="toHome()" title="退出" href="#">
                        <i class="fa fa-sign-out "></i><span style="color: white">退出</span>
                    </a>
                </li>
                <!-- END USER LOGIN DROPDOWN -->
            </ul>
        </div>
        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END HEADER INNER -->
</div>
<script>
    function toHome() {
        location.href = basePath;
    }

    function toGetSettingInfo() {
        location.href = basePath + "toGetSettingInfo";
    }

</script>
