<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <title>用户列表</title>
    <%@include file="../includes/common.jsp" %>
    <script src="<c:url value="/js/client/client.js"/>" type="text/javascript"></script>
    </head>
<body class="page-header-fixed">
<%@include file="../includes/top.jsp" %>
<div class="page-container" data-options="tools:'#tab-tools'">
    <div class="page-sidebar-wrapper">
        <div class="page-sidebar navbar-collapse collapse">
            <jsp:include page="../includes/menu.jsp">
                <jsp:param name="permissionNum" value="1"/>
                <jsp:param name="permissionLeafNum" value="1"/>
            </jsp:include>
        </div>
    </div>
    <div class="page-content-wrapper">
        <div class="page-content" style="min-height:1033px !important">
            <!-- BEGIN PAGE HEADER-->
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">自动更新</h3>
                    <ul class="page-breadcrumb breadcrumb">
                        <li><i class="fa fa-home"></i><span>主页</span><i class="fa fa-angle-right"></i></li>
                        <li><span>客户管理</span><i class="fa fa-angle-right"></i></li>
                        <li><span>自动更新</span></li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <div class="col-md-12">
                    <!-- Begin: life time stats -->
                    <div class="portlet box grey-cascade">
                        <div class="portlet-title">
                            <div class="caption"><i class="fa fa-user"></i></div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"></a>
                            </div>
                            <div class="actions">
                                <a href="#" onclick="clientListTable.addUserInfo()" class="btn btn-default"
                                   id="datatable_ajax_new"><i class="fa fa-plus faa-shake animated-hover"></i>添加用户</a>
                                <a href="#" class="btn btn-default" id="reloadTable"><i
                                        class="fa fa-refresh faa-spin animated-hover"></i>重新载入</a>

                                <div class="btn-group">
                                    <a class="btn btn-default" href="#" data-toggle="dropdown">
                                        <i class="fa fa-columns faa-shake animated-hover "></i>
                                        选择列 <i class="fa fa-angle-down"></i>
                                    </a>
                                    <div id="datatable_ajax_column_toggler"
                                         class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
                                        <label><input type="checkbox" checked data-column="0">客户名</label>
                                        <label><input type="checkbox" checked data-column="1">版本号</label>
                                        <label><input type="checkbox" checked data-column="2">操作</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-container">
                                <table id="datatable_ajax" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr role="row" class="heading">
                                        <th>客户名</th>
                                        <th>版本号</th>
                                        <th>操作</th>
                                    </tr>
                                    <tr role="row" class="filter">
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm" flag="flagClientAutoComplete"
                                                   name="clientNameQuery" id="clientNameQuery" placeholder="客户名" autocomplete="off">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control form-filter input-sm"
                                                   name="versionQuery" id="versionQuery" placeholder="版本号">
                                        </td>
                                        <td>
                                            <div class="margin-bottom-5">
                                                <a class="btn btn-sm yellow filter-submit margin-bottom">
                                                    <i class="fa fa-search faa-shake animated-hover"></i>查询</a>
                                                <a class="btn btn-sm red filter-cancel">
                                                    <i class="fa fa-refresh faa-spin animated-hover"></i>重置</a>
                                            </div>
                                        </td>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr class="heading">
                                        <th>客户名</th>
                                        <th>版本号</th>
                                        <th>操作</th>
                                    </tr>
                                    </tfoot>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- End: life time stats -->
                </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
    </div>
</div>
<!-- BEGIN FOOTER -->
<%@include file="../includes/footer.jsp" %>
<div class="modal fade" id="modalDialog" tabindex="-1" role="basic" aria-hidden="true" data-keyboard="false"
     data-backdrop="static">
    <div class="modal-dialog" style="width: 500px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="dialogTitle"></h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body form">
                    <form id="updateForm" class="form-horizontal">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="control-label col-sm-3">客户名</label>
                                    <div class="col-sm-9">
                                        <p class="form-control-static" id="clientNameSpan"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="control-label col-sm-3">当前版本</label>
                                    <div class="col-sm-9">
                                        <p class="form-control-static" id="versionSpan"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="control-label col-sm-3">升级到版本</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control input-medium" id="targetVersion" name="targetVersion"/>
                                        <input type="hidden" id="id" name="id"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <button type="button" class="btn blue" id="getSql">获取sql</button>
                <button type="button" class="btn blue" id="getWar">获取war</button>
                <button type="button" class="btn blue" id="recordUpdate">记录此次升级</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- END FOOTER -->
<div class="modal fade" id="deleteRowConfirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">确认</h4>
            </div>
            <div class="modal-body">确认删除当前行？</div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <button type="button" class="btn blue" id="deleteRow">删除</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</body>
</html>
<script type="text/javascript">
        $(function () {
            clientListTable.init();
        });
</script>