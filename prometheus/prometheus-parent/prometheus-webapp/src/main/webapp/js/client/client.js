var clientListTable = function () {
    var reloadTable = function (pageFlag) {
        $("#datatable_ajax").DataTable().draw(pageFlag)
    };
    var onSortColumn = function (sortColumn, sortDirection) {
        switch (sortColumn) {
            case "clientName":
                sortColumn = "client_name";
                break;
            case "version":
                sortColumn = "version";
                break;
        }
        return onSortColumnDefault(sortColumn, sortDirection);
    };
    var ruleClient = {
        objInfo: {
            name: {
                clientName: ["clientName", "客户名"],
                max: ["name", 50, "客户名"]
            },
            version: {
                checkEmpty: ["version", "版本号"],
                max: ["version", 40, "版本号"]
            }
        }
    };
    /**
     * dataTable事件初始化方法
     */
    var handleRecords = function () {
        var grid = new DataTable();
        var clientId = $("#clientNameQuery").getJcAutoCompleteHiddenValue();
        var $table = $("#datatable_ajax");
        grid.init({
            src: $table,
            url: basePath + "client/getClientListPage",
            onSortColumn: onSortColumn,
            onQuery: function (data) {
                data.id = clientId==undefined?"":clientId;
                data.version = $("#versionQuery").val();
            },
            dataTable: {
                "columns": [
                    {data: 'clientName', orderable: true},
                    {data: 'version', orderable: true},
                    {data: 'operate', orderable: false,
                        render: function (data, type, full) {
                            return '<a class="edit btn default btn-xs purple"' +
                                ' onclick="clientListTable.getUpdateFile(\'' + full.id + '\',\'' + full.clientName + '\',\'' + full.version+'\')"  id="edit' + full.id + '">' +
                                '<i class="fa fa-edit faa-shake animated-hover"></i>获取升级补丁</a>&nbsp;'
                        }
                    }
                ]
            }
        });

        var $tableWrapper = $("#datatable_ajax_wrapper");
        $tableWrapper.find(".dataTables_filter input").addClass("form-control input-medium input-inline"); // modify table search input
        $tableWrapper.find(".dataTables_length select").addClass("form-control input-small"); // modify table per page dropdown

        //重新载入按钮事件
        $("#reloadTable").click(function () {
            reloadTable(false);
        });

        //显示列选择按钮事件
        $('#datatable_ajax_column_toggler').find('input[type="checkbox"]').change(function () {
            var iCol = parseInt($(this).attr("data-column"));
            $table.DataTable().column(iCol).visible(!$table.DataTable().column(iCol).visible());
        });

        $("#getSql").click(function(){
            $("#updateForm").attr("action",basePath+"client/getUpdateSql").submit();
        })
        $("#getWar").click(function(){
            $("#updateForm").attr("action",basePath+"client/getUpdateWar").submit();
        })
    };

    return {
        init: function () {
            handleRecords();
        },
        addUserInfo: function () {
            $("#dialogTitle").text("用户添加");
            $("#userEditIframe").attr("src", basePath + "admin/user/addUserDo");
            $("#modalDialog").modal("show");
        },
        getUpdateFile: function (id,clientName,version) {
            $("#dialogTitle").text("增量获取");
            $("#id").val(id);
            $("#clientNameSpan").html(clientName);
            $("#versionSpan").html(version);
            $("#modalDialog").modal("show");
        },
        quit: function () {
            location.href = "about:blank";
            parent.parent.$("#modalDialog").modal("hide");
        },
        editSave: function () {
            var ruleEditUser = $.extend(true, {}, ruleUser, {
                objInfo: {
                    username: {
                        ajax: [basePath + "admin/user/validateUserName", {}, {id: "$('#checkId').val().trim()", username: "$('#username').val().trim()"},
                            backFunc, "text", "POST"]
                    },
                    email: {
                        ajax: [basePath + "admin/user/validateUserName", {}, {id: "$('#checkId').val().trim()", email: "$('#email').val().trim()"},
                            backFuncEmail, "text", "POST"]
                    }
                }
            });
            if (!JC.validate(ruleEditUser)) return;
            $("#saves").button('loading');
            $.ajax({
                url: basePath + "admin/user/editUser?id=" + $("#userId").val() + "&userType=" + $("#userType").val(),
                data: {
                    name: $("#name").val(),
                    username: $("#username").val(),
                    email: $("#email").val(),
                    password: $("#password").val() == $("#oldPassword").val() ? $("#password").val() : $("#password").val().md5(),
                    departmentIdList: $("#departmentIds").val(),
                    roleNames: $("#roleName").val()
                    //                输入框中的密码与原密码一致，则装入输入框密码，否则装入加密后的密码
                },
                dataType: "json",
                type: "POST",
                success: function () {
                    location.href = "about:blank";
                    parent.parent.$("#modalDialog").modal("hide");
                    var $table = parent.$("#datatable_ajax");
                    $table.DataTable().draw();
                    parent.toast.success();
                },
                error: doError
            })
        },
        addSave: function () {
            var ruleAddUser = $.extend(true, {}, ruleUser, {
                objInfo: {
                    username: {
                        ajax: [basePath + "admin/user/validateUserName", {}, {username: "$('#username').val().trim()"},
                            backFunc, "text", "POST"]
                    },
                    email: {
                        ajax: [basePath + "admin/user/validateUserName", {}, {email: "$('#email').val().trim()"},
                            backFuncEmail, "text", "POST"]
                    }
                }
            });
            if (!JC.validate(ruleAddUser)) return;
            $("#saves").button('loading');
            $.ajax({
                url: basePath + "admin/user/addUser?userType=" + $("#userType").val(),
                data: {
                    name: $("#name").val(),
                    username: $("#username").val(),
                    email: $("#email").val(),
                    password: $("#password").val().md5(),
                    departmentIdList: $("#departmentIds").val(),
                    roleNameList: $("#roleName").val()
                },
                dataType: "json",
                type: "POST",
                success: function () {
                    location.href = "about:blank";
                    parent.parent.$("#modalDialog").modal("hide");
                    var $table = parent.$("#datatable_ajax");
                    $table.DataTable().draw();
                    parent.toast.success();
                },
                error: doError
            })
        },
        reloadTable: reloadTable
    };


    function backFunc(data, returnObj) {
        returnObj.obj = $('#username')
        returnObj.errMsg = "此用户名已存在！"

        if (data == "true") {
            returnObj.bool = true;
        }
        if (data == "false") {
            returnObj.bool = false;
        }

        return returnObj;
    }

    function backFuncEmail(data, returnObj) {

        if (returnObj.obj = $('#email')) {
            returnObj.errMsg = "此邮箱已存在！"
        }
        if (data == "true") {
            returnObj.bool = true;
        }
        if (data == "false") {
            returnObj.bool = false;
        }

        return returnObj;
    }

}();