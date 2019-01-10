<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns=”http://www.w3.org/1999/xhtml” lang=”zh-CN”>
<html>
<head lang="en">
    <%@include file="../../includes/common.jsp" %>
    <title></title>
    <script src="<c:url value="/js/admin/admin.js"/>" type="text/javascript"></script>
</head>
<body>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header" style="background-color:#44b6ae;">
            <button class="close" aria-hidden="true" data-dismiss="modal" type="button"></button>
            <h4  class="modal-title" style="color: #fff;font-family:Microsoft Yahei; font-weight: 300;"><spring:message code="STUDENT_ADD"/></h4>
        </div>
        <div class="modal-body">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="STUDENT_NUMBER"/>：</label>
                    <div class="col-md-9" >
                        <input class="form-control input-medium" type="text" style="border-color: #000000;">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="STUDENT_NAME"/>：</label>
                    <div class="col-md-9" >
                        <input class="form-control input-medium" type="text"style="border-color: #000000;">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="STUDENT_COLLEGE"/>：</label>
                    <div class="col-md-9">
                        <input class="form-control input-medium" type="text" style="border-color: #000000;">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="STUDENT_PROFESSION"/>：</label>
                    <div class="col-md-9">
                        <input class="form-control input-medium" type="text" style="border-color: #000000;">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"><spring:message code="STUDENT_EMAIL"/>：</label>
                    <div class="col-md-9">
                        <input class="form-control input-medium" type="text"  style="border-color: #000000;">
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn green-haze" type="button"><spring:message code="COMMON_SAVE"/></button>
            <button class="btn default" data-dismiss="modal" type="button" onclick="toStudentBasicInfo()"><spring:message code="COMMON_EXIT"/></button>
        </div>
    </div>
</div>
</body>
</html>
