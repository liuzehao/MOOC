 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--@elvariable id="studentList" type="java.util.List<com.genghis.prometheus.admin.student.model.StudentVO>"--%>
<%--@elvariable id="studentVO" type="com.genghis.prometheus.admin.teacher.model.StudentVO"--%>
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
    <%@include file="../../includes/common.jsp" %>
    <%--<script src="<c:url value="/js/client/client.js"/>" type="text/javascript"></script>--%>
    <script type="text/javascript" src="<c:url value="/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"/>"
            type="text/javascript"></script>
    <script src="<c:url value="/assets/global/plugins/jquery-validation/js/additional-methods.js"/>"
            type="text/javascript"></script>
    <script src="<c:url value="/js/admin/admin.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/admin/student.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/common.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/plugins/cover/cover.js"/>" type="text/javascript"></script>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo">
<%@include file="../../includes/top.jsp" %>

<!-- END PAGE HEADER-->
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
                        <a href="getTeacherInfoList">
                            <spring:message code="TEACHER_BASIC_INFORMATION_MAINTENANCE"/></a>
                    </li>
                    <li>
                        <a href="getStudentInfoList">
                            <spring:message code="STUDENT_BASIC_INFORMATION_MAINTENANCE"/></a>
                    </li>

                </ul>
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
                            <a href="#"><spring:message code="HOME_PAGE"/></a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li>
                            <a href="#"><spring:message code="BASIC_INFORMATION_MAINTENANCE"/></a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li>
                            <a href="#"><spring:message code="STUDENT_BASIC_INFORMATION_MAINTENANCE"/></a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <!--BEGIN TEACHER INFORMATION TABLE -->
                    <div class="portlet box green-haze">
                        <div class="portlet-title">
                            <div class="caption">
                                <spring:message code="STUDENT_BASIC_INFORMATION"/>
                            </div>
                            <div class="actions">
                                <a class="btn btn-default" data-toggle="modal" href="#form" id="add">
                                    <i class="fa fa-plus faa-shake animated-hover"></i><spring:message code="COMMON_ADD"/></a>
                                <a href="#" class="btn btn-default" onclick="deleteManyStudentInfo()"><i
                                        class="fa fa-trash-o faa-spin animated-hover"></i><spring:message code="COMMON_DELETE"/></a>
                                <a class="btn btn-default" type="button"href="#"><i class="fa fa-plus"></i>
                                    <spring:message code="STUDENT_IMPORT"/>
                                </a>
                                <div class="btn-group">
                                    <a class="btn btn-default" href="#" data-toggle="dropdown">
                                        <i class="fa fa-columns faa-shake animated-hover "></i>
                                        专业筛选<i class="fa fa-angle-down"></i>
                                    </a>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li>
                                            <a href="#">计算机</a>
                                        </li>
                                        <li>
                                            <a href="#">网络工程</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div style="text-align:right">
                                <form id="query">
                                <spring:message code="STUDENT_NUMBER"/>：
                                <input style="margin-bottom: 0" class="input-small" type="text" value="" name="StudentId" id="queryStudentId">
                                <spring:message code="STUDENT_NAME"/>：
                                <input style="margin-bottom: 0"class="input-small" type="text" value="" name="StudentName" id="queryStudentName">
                                <a class="btn btn-xs btn-default green-haze" onclick="queryStudentInfo()">
                                    <i class="fa fa-search faa-shake animated-hover"></i><spring:message code="COMMON_QUERY"/></a>
                               </form>
                            </div>
                            <div class="table-scrollable">
                                <table class="table table-hover">
                                    <col width="9%">
                                    <col width="18%">
                                    <col width="17%">
                                    <col width="18%">
                                    <col width="18%">
                                    <col width="18%">
                                    <col width="2%">
                                    <thead>
                                    <tr>
                                        <th style="text-align:center"></th>
                                        <th><spring:message code="STUDENT_NUMBER"/></th>
                                        <th><spring:message code="STUDENT_NAME"/></th>
                                        <th class="hidden-480"><spring:message code="STUDENT_COLLEGE"/></th>
                                        <th><spring:message code="STUDENT_PROFESSION"/></th>
                                        <th><spring:message code="STUDENT_EMAIL"/></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="studentVO" items="${studentList}">
                                    <tr>
                                        <td style="text-align:center"><input type="checkbox" name="studentIds" value="${studentVO.studentId}"></td>
                                        <td>${studentVO.studentId}</td>
                                        <td>${studentVO.studentName}</td>
                                        <td class="hidden-480">${studentVO.collegeVO.collegeName}</td>
                                        <td>${studentVO.professionVO.professionName}</td>
                                        <td>${studentVO.email}</td>
                                        <td><a href="#form" data-toggle="modal" onclick="showStudentInfo('${studentVO.studentId}')">
                                            <i class="fa fa-edit faa-spin animated-hover" style="color:grey"></i></a></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<div id="form" class="modal fade" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color:#44b6ae;">
                    <button class="close" aria-hidden="true" data-dismiss="modal" type="button"></button>
                    <h4  class="modal-title" style="color: #fff;font-family:Microsoft Yahei; font-weight: 300;"><spring:message code="STUDENT_ADD"/></h4>
                </div>

                <form class="form-horizontal" role="form" id="info">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="STUDENT_NUMBER"/>：</label>
                            <div class="col-md-6" >
                                <input id="studentId" name="studentId" class="form-control input-medium" type="text" style="border-color: #000000;" placeholder="包含数字" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="STUDENT_NAME"/>：</label>
                            <div class="col-md-6" >
                                <input id="studentName" name="studentName" class="form-control input-medium" type="text"style="border-color: #000000;" placeholder="至多包含8个汉字" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="STUDENT_COLLEGE"/>：</label>
                            <div class="col-md-6">
                                <input id="collegeName" name="collegeName" autocomplete="off" class="form-control input-medium" type="text" flag="flagStaticCollegeName" style="border-color: #000000;" placeholder="请选择学院" />
                                <input type="hidden" name="collegeId" id="collegeId" value="" autoHidden="autoHidden">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="STUDENT_PROFESSION"/>：</label>
                            <div class="col-md-6">
                                <input id="professionName" name="professionName" autocomplete="off" class="form-control input-medium" type="text" flag="flagStaticProfessionName" style="border-color: #000000;" placeholder="输入专业" />
                                <input type="hidden" name="professionId" id="professionId" value="" autoHidden="autoHidden">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="STUDENT_EMAIL"/>：</label>
                            <div class="col-md-6">
                                <input id="email" name="email" class="form-control input-medium" type="text"  style="border-color: #000000;" placeholder="你的邮箱" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn green-haze" type="submit"><spring:message code="COMMON_SAVE"/></button>
                        <button class="btn default" data-dismiss="modal" type="button" id="close"><spring:message code="COMMON_EXIT"/></button>
                    </div>
                </form>
            </div>
       </div>
 </div>
<script>
 $(function (){
     formValidate.init();
     modal.init();
 })
</script>
</body>
</html>

