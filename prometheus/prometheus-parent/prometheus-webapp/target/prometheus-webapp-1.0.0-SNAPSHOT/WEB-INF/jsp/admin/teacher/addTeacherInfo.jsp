<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--@elvariable id="teacherVO" type="com.genghis.prometheus.admin.teacher.model.TeacherVO"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns=”http://www.w3.org/1999/xhtml” lang=”zh-CN”>
<html>
<head lang="en">
    <%@include file="../../includes/common.jsp" %>
    <title></title>
    <script src="<c:url value="/js/admin/admin.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/admin/teacher.js"/>" type="text/javascript"></script>
</head>
<body>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header" style="background-color:#44b6ae;">
            <button class="close" aria-hidden="true" data-dismiss="modal" type="button" onclick="toTeacherBasicInfo()"></button>
            <h4  class="modal-title" style="color: #fff;font-family:Microsoft Yahei; font-weight: 300;"><spring:message code="TEACHER_ADD"/></h4>
        </div>
        <div class="modal-body">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_NUMBER"/>：</label>
                    <div class="col-md-9">
                        <input id="teacherId" class="form-control input-medium" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_NAME"/>：</label>
                    <div class="col-md-9">
                        <input id="teacherName" class="form-control input-medium" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_COLLEGE"/>：</label>
                    <div class="col-md-9">
                        <input id="collegeName" name="collegeName" autocomplete="off" class="form-control input-medium" type="text" flag="flagStaticCollegeName">
                        <input type="hidden" name="collegeId" id="collegeId" value="" autoHidden="autoHidden">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_RESEARCH_ROOM"/>：</label>
                    <div class="col-md-9">
                        <input id="researchRoomName" name="researchRoomName" autocomplete="off" class="form-control input-medium" type="text" flag="flagStaticResearchRoomName">
                        <input type="hidden" name="researchRoomId" id="researchRoomId" value="" autoHidden="autoHidden">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_EMAIL"/>：</label>
                    <div class="col-md-9">
                        <input id="email" class="form-control input-medium" type="text" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_TEL"/>：</label>
                    <div class="col-md-9">
                        <input id="telephone" class="form-control input-medium" type="text" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_COURSE"/>：</label>
                    <div class="col-md-9">
                        <input id="course" class="form-control input-medium" type="text" >
                    </div>
                    <div class="actions">
                        <a class="btn btn-sm green-haze" type="button" style="font-size: 90%; border-width: 1px; border-color: #44b6ae; position: relative; left: 425px; top: -30px" href="#">
                            <i class="fa fa-plus-square-o"></i>
                            <spring:message code="TEACHER_COURSE_ADD"/>
                        </a>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn green-haze" type="button" onclick="save()"><spring:message code="COMMON_SAVE"/></button>
            <button class="btn default" data-dismiss="modal" type="button"onclick="toTeacherBasicInfo()"><spring:message code="COMMON_EXIT"/></button>
        </div>
    </div>
</div>
</body>
</html>
