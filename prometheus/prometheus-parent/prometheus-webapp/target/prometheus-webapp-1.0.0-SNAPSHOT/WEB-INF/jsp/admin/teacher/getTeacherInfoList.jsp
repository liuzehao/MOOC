<%--@elvariable id="teacherList" type="java.util.List<com.genghis.prometheus.admin.teacher.model.TeacherVO>"--%>
<%--@elvariable id="teacherVO" type="com.genghis.prometheus.admin.teacher.model.TeacherVO"--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html lang="en" class="no-js">
<head>
    <title>管理员页面</title>
    <%@include file="../../includes/common.jsp" %>
    <script type="text/javascript" src="<c:url value="/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"/>"
            type="text/javascript"></script>
    <script src="<c:url value="/assets/global/plugins/jquery-validation/js/additional-methods.js"/>"
            type="text/javascript"></script>
    <script src="<c:url value="/js/admin/admin.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/admin/teacher.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/common.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/plugins/cover/cover.js"/>" type="text/javascript"></script>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo">
<%@include file="../../includes/top.jsp" %>
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
                                <a href="#"><spring:message code="HOME_PAGE"/></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="#" ><spring:message code="BASIC_INFORMATION_MAINTENANCE"/></a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="#"><spring:message code="TEACHER_BASIC_INFORMATION_MAINTENANCE"/></a>
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
                                    <spring:message code="TEACHER_BASIC_INFORMATION"/>
                                </div>
                                <div class="actions">
                                    <a class="btn btn-default" data-toggle="modal" href="#form" id="add">
                                        <i class="fa fa-plus faa-shake animated-hover"></i><spring:message code="COMMON_ADD"/></a>
                                    <a  onclick="deleteManyTeacherInfo()" class="btn btn-default"><i class="fa fa-trash-o faa-spin animated-hover"></i>
                                        <spring:message code="COMMON_DELETE"/></a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div style="text-align:right">
                                    <form id="query">
                                    <spring:message code="TEACHER_NUMBER"/>：
                                    <input name="teacherId" id="queryTeacherId" class="input-small"
                                           style="margin-bottom: 0" style="height:25px" type="text" value="">
                                    <spring:message code="TEACHER_NAME"/>：
                                    <input type="text" name="teacherName" id="queryTeacherName" value=""
                                           style="margin-bottom: 0" class="input-small" style="height:25px"  >
                                    <%--<input type="hidden" name="teacherId" id="teacherId" value="${teacherVO.teacherId}" autoHidden="autoHidden">--%>
                                    <a class="btn btn-xs btn-default green-haze"  style="height:25px"
                                       onclick="queryTeacherInfo()">
                                    <i class="fa fa-search faa-shake animated-hover"></i><spring:message code="COMMON_QUERY"/></a>
                                    </form>
                                </div>
                                <div class="table-scrollable">
                                    <table class="table table-hover">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="14%">
                                        <col width="15%">
                                        <col width="15%">
                                        <col width="14%">
                                        <col width="10%">
                                        <col width="2%">
                                        <col width="2%">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th><spring:message code="TEACHER_NUMBER"/> </th>
                                            <th><spring:message code="TEACHER_NAME"/></th>
                                            <th class="hidden-480"><spring:message code="TEACHER_COLLEGE"/></th>
                                            <th><spring:message code="TEACHER_RESEARCH_ROOM"/></th>
                                            <th><spring:message code="TEACHER_TEL"/></th>
                                            <th><spring:message code="TEACHER_EMAIL"/></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="teacherVO" items="${teacherList}">
                                        <tr>
                                            <td style="text-align:center">
                                                <input type="checkbox" name="teacherIds" value="${teacherVO.teacherId}" class='checkbox'>
                                            </td>
                                            <td>${teacherVO.teacherId}</td>
                                            <td>${teacherVO.teacherName}</td>
                                            <td class="hidden-480">${teacherVO.collegeVO.collegeName}</td>
                                            <td>${teacherVO.researchRoomVO.researchRoomName}</td>
                                            <td>${teacherVO.telephone}</td>
                                            <td>${teacherVO.email}</td>
                                            <td><a onclick="deleteTeacherInfo('${teacherVO.teacherId}')">
                                                <i class="fa fa-trash-o faa-spin animated-hover" style="color:grey"></i></a></td>
                                            <td><a href="#form" data-toggle="modal" onclick="showTeacherInfo('${teacherVO.teacherId}')">
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
    <!-- END PAGE HEADER-->
<div class="row">
    <div id="form" class="modal fade" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color:#44b6ae;">
                    <button class="close" aria-hidden="true" data-dismiss="modal" type="button" onclick="toTeacherBasicInfo()"></button>
                    <h4  class="modal-title" style="color: #fff;font-family:Microsoft Yahei; font-weight: 300;"><spring:message code="TEACHER_ADD"/></h4>
                </div>
                <form class="form-horizontal" role="form" id="info">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="TEACHER_NUMBER"/>：</label>
                            <div class="col-md-6">
                                <input id="teacherId" name="teacherId" class="form-control input-medium" type="text" placeholder="包含数字">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="TEACHER_NAME"/>：</label>
                            <div class="col-md-6">
                                <input id="teacherName" name="teacherName" class="form-control input-medium" type="text" placeholder="至多包含8个汉字">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="TEACHER_COLLEGE"/>：</label>
                            <div class="col-md-6">
                                <input id="collegeName" name="collegeName" autocomplete="off" class="form-control input-medium" type="text" flag="flagStaticCollegeName" placeholder="请选择学院">
                                <input type="hidden" name="collegeId" id="collegeId" value="" autoHidden="autoHidden">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="TEACHER_RESEARCH_ROOM"/>：</label>
                            <div class="col-md-6">
                                <input id="researchRoomName" name="researchRoomName" autocomplete="off" class="form-control input-medium" type="text" flag="flagStaticResearchRoomName" placeholder="请选择教研室">
                                <input type="hidden" name="researchRoomId" id="researchRoomId" value="" autoHidden="autoHidden"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="TEACHER_EMAIL"/>：</label>
                            <div class="col-md-6">
                                <input id="email" name="email" class="form-control input-medium" type="text" placeholder="您的邮箱">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="TEACHER_TEL"/>：</label>
                            <div class="col-md-6">
                                <input id="telephone" name="telephone" class="form-control input-medium" type="text" placeholder="您的联系方式">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"><spring:message code="TEACHER_COURSE"/>：</label>
                            <div class="col-md-9">
                                <input id="courseName" name="courseName" class="form-control input-medium" autocomplete="off" flag="flagStaticCourseName" type="text" placeholder="您所教授的课程名">
                                <input type="hidden" id="courseId" name="courseId" value="" autoHidden="autoHidden"/>
                            </div>
                            <div class="actions">
                                <a class="btn btn-sm green-haze" type="button" style="font-size: 90%; border-width: 1px; border-color: #44b6ae; position: relative; left: 425px; top: -30px" href="#">
                                    <i class="fa fa-plus-square-o"></i>
                                    <spring:message code="TEACHER_COURSE_ADD"/>
                                </a>
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
</div>
<script>
$(function (){
    formValidate.init();
    modal.init();
})
</script>
</body>
</html>

