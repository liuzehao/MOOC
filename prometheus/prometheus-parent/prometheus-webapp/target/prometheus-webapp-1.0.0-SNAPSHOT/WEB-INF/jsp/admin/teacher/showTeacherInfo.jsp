<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--@elvariable id="teacherVO" type="com.genghis.prometheus.admin.teacher.model.TeacherVO"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns=”http://www.w3.org/1999/xhtml” lang=”zh-CN”>
<html>
<head lang="en">
    <%@include file="../../includes/common.jsp" %>
    <title></title>
    <script src="<c:url value="/js/admin/teacher.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/admin/admin.js"/>" type="text/javascript"></script>
</head>
<body>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header" style="background-color:#44b6ae;">
            <button class="close" aria-hidden="true" data-dismiss="modal" type="button" onclick="toTeacherBasicInfo()"></button>
            <h4  class="modal-title" style="color: #fff;font-family:Microsoft Yahei; font-weight: 300;"><spring:message code="TEACHER_UPDATE"/></h4>
        </div>
        <div class="modal-body">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_NUMBER"/>:</label>
                    <div class="col-md-9">
                        <input class="form-control input-medium" type="text" id="teacherId" name="teacherId" value="${teacherVO.teacherId}" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_NAME"/>：</label>
                    <div class="col-md-9">
                        <input class="form-control input-medium" type="text" id="teacherName" name="teacherName" value="${teacherVO.teacherName}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_COLLEGE"/>：</label>
                    <div class="col-md-9">
                        <input class="form-control input-medium" type="text" id="collegeName" flag="flagStaticCollegeName" autocomplete="off" name="collegeName"
                               value="${teacherVO.collegeVO.collegeName}">
                        <input type="hidden" name="collegeId" id="collegeId"
                               value="${teacherVO.collegeVO.collegeId}"  autoHidden="autoHidden">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_RESEARCH_ROOM"/>：</label>
                    <div class="col-md-9">
                        <input class="form-control input-medium" type="text" id="researchRoomName" flag="flagStaticResearchRoomName"
                               autocomplete="off" name="researchRoomName"
                               value="${teacherVO.researchRoomVO.researchRoomName}">
                        <input type="hidden" name="researchRoomId" id="researchRoomId"
                               value="${teacherVO.researchRoomVO.researchRoomId}"  autoHidden="autoHidden">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_EMAIL"/>：</label>
                    <div class="col-md-9">
                        <input class="form-control input-medium" type="text"  id="email" name="email" value="${teacherVO.email}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_TEL"/>：</label>
                    <div class="col-md-9">
                        <input class="form-control input-medium" type="text"  id="telephone" name="telephone" value="${teacherVO.telephone}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="TEACHER_COURSE"/>：</label>
                    <div class="col-md-9">
                        <input class="form-control input-medium" type="text" id="course" name="course" value="${teacherVO.course}">
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
            <button class="btn green-haze" type="button" onclick="saveUpdateResult()"><spring:message code="COMMON_SAVE"/></button>
            <button class="btn default" data-dismiss="modal" type="button" onclick="toTeacherBasicInfo()"><spring:message code="COMMON_EXIT"/></button>
        </div>
    </div>
</div>
</body>
</html>
