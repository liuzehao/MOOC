<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%--
  Created by IntelliJ IDEA.
  User: longshihui
  Date: 2015/1/13
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <title>学习模块</title>
    <%@include file="../includes/common.jsp"%>
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script type="text/javascript" src="<c:url value="/assets/global/plugins/jquery-knob/js/jquery.knob.js"/>"></script>
    <!-- END PAGE LEVEL PLUGINS -->
</head>
<!--END HEAD-->
<body  class="page-header-fixed page-sidebar-closed-hide-logo">
<%@include file="../includes/horizantal.jsp"%>
<div class="page-container">
    <div class="page-sidebar-wrapper">
        <!--BEGIN PERSON STUDY SCHEDULE-->
        <div class="page-sidebar">
                <!--BEGIN STUDENT NAME-->
                <div class="col-md-12" style="margin-bottom: 10px">
                    <p class="text-left" style="font-family:Arial;font-size:18px;font-weight:bold;font-style:normal;text-decoration:none;color:#000000;">
                        ${studentVO.studentName}
                    </p>
                </div>
                <!--END STUDENT NAME-->
                <!--BEGIN STUDY COURSE LIST-->
                <div class="col-md-12" style="margin-bottom: 20px">
                    <!--BEGIN LIST TITLE-->
                            <span class="col-md-4" style="font-size:16px">
                                <spring:message code="study.course"/>
                            </span>
                            <span class="col-md-4" style="font-size:16px">
                                <spring:message code="study.progress"/>
                            </span>
                            <span class="col-md-4" style="font-size:16px">
                                <spring:message code="study.time"/>
                            </span>
                    <!--END LIST TILLE-->
                </div>
                <!--END STUDY COURSE-->
                <!--BEGIN STUDY COURSE LIST-->
                <c:forEach var="StudyVO" items="${studyVOList}">
                    <div class="col-md-12" style="margin-bottom: 20px;">
                        <div class="col-md-4">
                            <a href="course/getCoursePage?courseId=${StudyVO.courseId}">${StudyVO.courseName}</a>
                        </div>
                        <div class="col-md-4">
                            <input class="knob" data-width="30" data-fgcolor="green" data-height="30" data-displayinput=false value="${StudyVO.studyProgressRate}" readonly>
                        </div>
                        <div class="col-md-4 font-blue" style="padding-right:0px">
                              ${StudyVO.courseTime}
                        </div>
                    </div>
                </c:forEach>
                <!--END SHOW COURSE LIST-->
        </div>
        <!--END PERSON STUDY SCHEDULE-->
    </div>
    <!--BEGIN PAGE CONTENT-->
    <div class="page-content-wrapper">
        <div class="page-content bg-grey-steel">
            <div class="row">
                <div class="col-md-12">
                    <!--BEGIN MODULE TITLE-->
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <a >
                            <h2>学习模块</h2>
                        </a>
                    </div>
                    <!--END MODULE TITLE-->
                    <!--BEGIN COURSE SELECT PART-->
                    <div class="col-md-12" style="margin-bottom:10px">
                        <c:forEach var="courseVO" items="${courseVOList}">
                            <div class="col-md-4" style="margin-bottom:20px;">
                                <a href="#"><img src="${courseVO.courseImage}" style="width: 324px; height: 99px;" /></a>
                            </div>
                        </c:forEach>
                    </div>
                    <!--END COURSE SELECT PART-->
                </div>
                <!--BEGIN RECENTLY MOUDLE-->
                <!--BEGIN MESSAGE SHOW-->
                <div class="bg-grey-silver " id="message_show" style="border:2px solid black; height: 320px; width:267px; position:absolute; top:20px;right:0px;overflow-y:auto; overflow-x:hidden;display: none;">
                       <div>
                          <p style="margin-top:20px"> <span style="font-family:Arial;font-size:16px;font-weight:bold;font-style:normal;text-decoration:none;color:saddlebrown;">
                                <spring:message code="study.finish"/>:
                            </span></p>
                            <c:forEach var="studyHistoryVO" items="${studyHistoryVOList}">
                                <p style="margin-left: 20px"><span style="font-family:Arial;font-size:16px;font-weight:bold;font-style:normal;text-decoration:none;color:red;">
                                    ${studyHistoryVO.courseName}
                                </span></p>
                                <p style="margin-left: 20px"><span style="font-family:Arial;font-size:12px;font-weight:bold;font-style:normal;text-decoration:none;color:#000000;">
                                    ${studyHistoryVO.title}
                                </span></p>
                                <p style="margin-left: 40px"><span style="font-family:Arial;font-size:12px;font-weight:bold;font-style:normal;text-decoration:none;color:#000000;">
                                     ${studyHistoryVO.logoutTime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a><span style="font-family:Arial;cursor:Pointer;font-size:12px;font-weight:bold;font-style:normal;text-decoration:none;color:#696969;">
                                        继续上次学习>></span>
                                    </a>
                                </span></p>
                             </c:forEach>
                       </div>
                </div>
                <!--END MESSAGE SHOW-->
                <!--BEGIN MESSAGE BUTTON-->
                <div class="bg-green-haze" id="message_btn" tabindex="0"
                     style="outline: medium none; position: absolute;top: 20px; width: 30px; right: 0px;">
                    <p style="text-align: center; margin-top: 15px;">
                        <span style="font-family:Arial;font-size:16px;font-weight:bold;font-style:normal;text-decoration:none;color:white;">历史记录</span>
                    </p>
                </div>
                <!--END MESSAGE BUTTON-->
                <!--END RECENTLY MODULE-->

            </div>
        </div>
    </div>
    <!--END PAGE CONTENT-->
</div>

<script>
    $(document).ready(function(){
        $(".knob").knob({
            'dynamicDraw': true,
            'thickness': 0.2,
            'tickColorizeValues': true,
            'skin': 'tron'
        });
        $("#message_btn").click(function(){
            $("#message_show").toggle();
        });
    })
    var date = new Date();
    var begin;
    var end;
    timer = null;
    $(window).load(function(){
        begin = date.getTime();
    })
    $(window).unload(function(){
        end = date.getTime();
        alert(end - begin);
    })
</script>
</body>
</html>
