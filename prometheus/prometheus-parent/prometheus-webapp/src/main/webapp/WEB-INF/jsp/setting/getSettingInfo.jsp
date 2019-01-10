<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>设置</title>
    <%@include file="../includes/common.jsp" %>
    <link href="/sls/metronic/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" type="text/css"
          rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/sls/metronic/assets/global/css/plugins.css">
    <script src="<c:url value="/js/common.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/assets/global/plugins/jquery-1.11.0.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/plugins/cover/cover.js"/>" type="text/javascript"></script>
</head>
<body>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <div class="page-content-setting">
        <!-- BEGIN PAGE HEADER中头部-->
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                <h3 class="page-title">
                    设置
                </h3>
                <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="col-md-12">
                <div class="tabbable tabbable-custom boxless tabbable-reversed">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab_0" data-toggle="tab">   <!--基本信息-->
                                基本信息 </a>
                        </li>
                        <li>
                            <a href="#tab_1" data-toggle="tab">         <!--修改密码-->
                                修改密码 </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_0">
                            <div class="portlet box green">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="fa fa-gift"></i>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <form action="#" class="form-horizontal">
                                        <div class="row">
                                            <div class="col-md-4 ">
                                                <div class="form-body">
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">姓名</label>
                                                        <div class="col-md-8">
                                                            <input type="text" class="form-control" value="${studentVO.studentName}" placeholder=""  onfocus=this.blur()>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">学号</label>
                                                        <div class="col-md-8">
                                                            <input type="text" class="form-control" value="${studentVO.studentId}"  placeholder="" onfocus=this.blur()>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">昵称</label>
                                                        <div class="col-md-8">
                                                            <input type="text" class="form-control" value="${studentVO.studentNikeName}" placeholder="">
                                                        </div>
                                                   </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">邮箱</label>
                                                        <div class="col-md-8" >
                                                            <div class="input-group">
																	<span class="input-group-addon">
																	<i class="fa fa-envelope"></i>
																	</span>
                                                                <input type="email" class="form-control" value="${studentVO.email}"
                                                                       placeholder="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="fileinput fileinput-new"
                                                             style="margin:-200px 0px 0px 500px "
                                                             data-provides="fileinput">
                                                            <div class="fileinput-preview thumbnail"
                                                                 style="width: 200px; height: 150px;"
                                                                 data-trigger="fileinput"></div>
                                                            <div>
																 <span class="btn default btn-file">
																 <span class="fileinput-new"> 选择图片 </span>
																 <span class="fileinput-exists"> 换一张 </span>
																 <input id="upImg" type="file" name="upImg">
																 </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue">提交</button>
                                                <button type="button" class="btn default">取消</button>
                                            </div>
                                        </div>
                                    </form>
                                    <!-- END FORM-->
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_1">
                            <div class="portlet box green">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="fa fa-gift"></i>
                                    </div>
                                </div>
                                <div class="portlet-body form">
                                    <!-- BEGIN FORM-->
                                    <form action="#" class="form-horizontal">
                                        <div class="form-body">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">原密码</label>

                                                <div class="col-md-3">
                                                    <input type="text" class="form-control" placeholder="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">新密码</label>

                                                <div class="col-md-3">
                                                    <input type="text" class="form-control" placeholder="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">确认密码</label>

                                                <div class="col-md-3">
                                                    <input type="text" class="form-control" placeholder="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions fluid">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn blue">提交</button>
                                                <button type="button" class="btn default">取消</button>
                                            </div>
                                        </div>
                                    </form>
                                    <!-- END FORM-->
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- END PAGE CONTENT-->
    </div>
</div>
<!-- END CONTENT -->
</body>
</html>

