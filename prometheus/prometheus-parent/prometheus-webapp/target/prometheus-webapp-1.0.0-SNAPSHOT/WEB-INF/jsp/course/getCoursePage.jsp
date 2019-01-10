<%--
 <%--
  Created by IntelliJ IDEA.
  User: WangXin
  Date: 2015/1/13
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>${StudyVO.courseName}</title>
    <%@ include file="/WEB-INF/jsp/includes/common.jsp" %>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo">
<%@include file="../includes/horizantal.jsp" %>
<script src="<c:url value="/js/admin/admin.js"/>" type="text/javascript"></script>
<div class="page-container">
    <!--BEGIN SIDE BAR-->
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu hidden-sm hidden-xs" data-auto-scroll="true" data-slide-speed="200">
            <li class="start active open">
                <a href="javascript:;">
                    <i class="fa fa-user"></i>
                    <span class="title">${studentVO.studentName}</span>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                   <span class="title">
                       <div class="ztree" id="treeInfo"></div>
                   </span>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                   <span class="title">
                        <button class="btn btn-default" style="margin-left: 135px; margin-top: -10px;" id="skip">跳阶申请
                        </button>
                   </span>
                </a>
            </li>
        </ul>
    </div>
    <%--END SIDE BAR--%>
    <!-- BEGIN CONTENT-->
    <div class="page-content-wrapper">
        <!-- BEGIN PAGE CONTENT-->
        <div class="page-content">
            <div class="row">
                <div class="col-md-12" style="margin-top: -25px; margin-left: -20px;">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <ul class="page-breadcrumb breadcrumb" style="margin-top: 0px">
                        <li style="margin-left: 140px;">
                            <span style="font-family:Arial;font-size:18px;font-weight:bold;font-style:normal;text-decoration:none;color:#00CCCC;">学习时长:</span>
                            <span style="font-family:Arial;font-size:18px;font-weight:bold;font-style:normal;text-decoration:none;color:black;">${StudyVO.courseTime}</span>
                        </li>
                        <li style="margin-left: 100px;">
                            <span style="font-family:Arial;font-size:18px;font-weight:bold;font-style:normal;text-decoration:none;color:#00CCCC;">积分: </span>
                            <span style="font-family:Arial;font-size:18px;font-weight:bold;font-style:normal;text-decoration:none;color:black;">${StudyVO.totalScore}
                                分
                                <i class="fa fa-question-circle" style="color:#00CCCC; cursor:help" title="单击查看积分规则" data-toggle="modal" data-target="#score"></i>
                            </span>
                        </li>
                        <li style="margin-left: 60px;">
                            <span style="font-family:Arial;font-size:18px;font-weight:bold;font-style:normal;text-decoration:none;color:#00CCCC;">排名：</span>
                        </li>
                        <li>
                            <a href="">
                                <span style="font-family:Arial;font-size:18px;font-weight:bold;font-style:normal;text-decoration:underline;color:#00CCCC;margin-left: 50px;">
                                本课学习统计
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <span style="font-family:Arial;font-size:18px;font-weight:bold;font-style:normal;text-decoration:underline;color:#00CCCC;margin-left: 80px;">
                                讨论区
                                </span>
                                <span style="font-family:Arial;font-size:18px;font-weight:bold;font-style:normal;text-decoration:underline;color:#00CCCC;">>></span></a>
                        </li>
                    </ul>
                </div>
                <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
            <div class="row">
                <img src="../picturelib/course/datastructure/datastructure.jpg" id="ContentShow"
                     style="width: 560px;height: 800px; margin-left: 182px;">
                <div calss="row" style="margin-bottom: 50px;">
                    <button class="btn btn-success dropdown-toggle" id="PageUp" data-toggle="dropdown" type="button"
                            style="margin-left: 182px; margin-top: 10px;">上一页
                        <i class="fa fa-angle-up"></i>
                    </button>
                    <button class="btn btn-success dropdown-toggle" id="NextPage" data-toggle="dropdown" type="button"
                            style="margin-left: 390px; margin-top: 10px;">下一页
                        <i class="fa fa-angle-down"></i>
                    </button>
                </div>
                <!--END MESSAGE_SHOW -->
            </div>
            <%--END PAGE CONTENT--%>
            <!--BEING LEADERBOARD -->
            <div class="bg-grey-steel " id="Leaderboard"
                 style="border:2px solid black;height: 450px; width:267px; position:absolute; top:80px;right:0px;display: none">
                <div style="overflow:auto">
                    <table>
                        <col width="10%">
                        <col width="20%">
                        <col width="30%">
                        <col width="30%">
                        <thead>
                        <tr>
                            <th class="text-center" colspan="4" style="font-weight: bold; font-size: 16px; color: black;">
                                课程排行榜
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <!--BEGIN LEADERBOARD BODY-->
                        <c:forEach var="CourseLeaderBoardList" items="${CourseLeaderBoardList}" begin="0" end="10" varStatus="current">
                            <tr style="cursor: Pointer;height: 40px">
                                <td class="text-center" style="vertical-align: middle; font-size:15px; font-weight: bold;">${current.index + 1}.</td>
                                <td class="text-center"><img  class="img-circle" src="${CourseLeaderBoardList.studentImage}" style="vertical-align: middle;width:30px; height:30px"/></td>
                                <td class="text-center" style="vertical-align: middle;font-size:15px; font-weight: bold">${CourseLeaderBoardList.studentName}</td>
                                <td class="text-center" style="vertical-align: middle;font-size:15px; font-weight: bold">${CourseLeaderBoardList.totalScore}分</td>
                            </tr>
                        </c:forEach>
                        <!--END LEADERBOARD BODY-->
                        </tbody>
                    </table>
                </div>
                <div style="border-top:1px solid #808080;width:267px;height: 45px;position: absolute;bottom:0px;left: 0px;">
                    <button class="btn red" id="LeaderboardClose" style="margin-left: 10px;margin-top: 5px">关闭</button>
                </div>
            </div>
            <!--END LEADERBOARD -->
            <!-- BEING LEADERBOARD BUTTON-->
            <a href="#" class="bg-green-haze text-center" id="LeaderboardBtn"
               style="height: auto;width: 30px;position: absolute;top: 120px; right:0px; display: block;
                         font-family:Arial; font-size:16px;font-weight:bold; text-decoration:none;">
                学习排行榜
            </a>
            <!-- END LEADERBOARD BUTTON-->
        </div>
        <%--END CONTENT--%>
    </div>
</div>
<%--BEGIN MODAL--%>
<div id="score" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">积分规则</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <p>你猜猜我会给你多少分？</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn blue">关闭</button>
            </div>
        </div>
    </div>
</div>
<%--END MODAL--%>
</body>
</html>
<script>
    $(document).ready(function () {
        $("#LeaderboardBtn").click(function(){
            $("#Leaderboard").fadeIn(500);
            $(this).fadeOut(500);
        });
        $("#LeaderboardClose").click(function(){
            $("#Leaderboard").fadeOut(500);
            $("#LeaderboardBtn").fadeIn(500);
        });
        $("tr","#Leaderboard tbody").mouseover(function(){
            $(this).addClass("bg-grey-silver");
        })
        $("tr","#Leaderboard tbody").mouseout(function(){
            $(this).removeClass("bg-grey-silver");
        })
    })
    var zTreeObj;
    $(function () {
        var setting = {
            data: {
                simpleData: {
                    enable: true
                },
                showTitle: true,
                key: {
                    title: "title"
                }
            },
            view: {
            },
            callback: {
                onClick: show
            }
        };
        zTreeObj = $.fn.zTree.init($("#treeInfo"), setting, <%=request.getAttribute("tree")%>);
        zTreeObj.expandNode(zTreeObj.getNodes()[0]);
        $("#buildSysTree").click(function () {
            $("#sqlText").append("DROP TABLE IF EXISTS `sys_tree`;\n" +
                    "CREATE TABLE `sys_tree` (`tree_id` varchar(10) NOT NULL COMMENT '菜单ID'," +
                    "`parent_id` varchar(10) NOT NULL DEFAULT '' COMMENT '菜单父ID'," +
                    "`name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称'," +
                    "`title` varchar(100) NOT NULL DEFAULT '' COMMENT '显示信息'," +
                    "`url` varchar(100) DEFAULT '' COMMENT '菜单URL'," +
                    "`state` int(11) DEFAULT '0' COMMENT '课程审核状态'," +
                    "`exercise_id` int(11) DEFAULT NULL COMMENT '题目id号'," +
                    "`root_id` varchar(10) NOT NULL COMMENT '根节点（对应课程id）'," +
                    "`num` int(11) NOT NULL COMMENT '顺序'," +
                    "PRIMARY KEY (`tree_id`))" +
                    " ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';\n" + getSysTreeSql() + ";\n");
        })
    });
    var timer = null;
    var COURSE_UNLOCK = 1;
    var COURSE_LOCK = 0;
    function nextPageInterval(){
        var total = 3;
        $("#NextPage").attr("disabled",true);
        timer = setInterval(function(){
            $("#NextPage").html("下一页("+ total + "秒)" + "&nbsp;<i class='fa fa-angle-down'></i>");
            total--;
            if(total < 0){
                clearInterval(timer);
                $("#NextPage").attr("disabled",false);
                timer = null;
                $("#NextPage").html("下一页" + "&nbsp;<i class='fa fa-angle-down'></i>");
            }
        },1000);
    };

    var num = -1;
    //通过鼠标点击的方式对菜单进行遍历
    function show(even, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeInfo");
        function filter(node) {
            return (node.treeNum == treeNode.treeNum - 1);
        }
        var preNode = zTree.getNodesByFilter(filter, true);
        if (treeNode.treeNum == 0 || preNode.flag == COURSE_UNLOCK) {
            $("#ContentShow").attr("src", treeNode.treeUrl);
            if (treeNode.flag == COURSE_LOCK) {
                debLocking(treeNode);
            }
            num = treeNode.treeNum;
            window.scrollTo(0, 0);
        }
        else {
            alertMsg.error("该小节未解锁，无访问权限");
            window.scrollTo(0, 0);
        }
    }
    $("#NextPage").click( function(){
        var zTree = $.fn.zTree.getZTreeObj("treeInfo");
        num++;
        function filter(node) {
            return (node.treeNum == num);
        }
        var nextNode = zTree.getNodesByFilter(filter, true);
        $("#ContentShow").attr("src", nextNode.treeUrl);
        if(nextNode.flag == COURSE_LOCK) {
            nextPageInterval();
            debLocking(nextNode);
        }
        zTree.selectNode(nextNode,false);
        window.scrollTo(0,0);
    })
    $("#PageUp").click(function(){
        if(num>0) {
            var zTree = $.fn.zTree.getZTreeObj("treeInfo");
            num--;
            function filter1(node) {
                return (node.treeNum == num);
            }
            var node = zTree.getNodesByFilter(filter1, true)
            $("#ContentShow").attr("src", node.treeUrl);
            zTree.selectNode(node,false);
            window.scrollTo(0,0);
        }
    })
    //课程解锁
    function debLocking(node) {
        var treeVO = {
            id: node.id,
            flag: COURSE_UNLOCK,
            icon: "../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png"
        }
        $.ajax({
            url: basePath + "course/updateInfo",
            data: JSON.stringify(treeVO),
            contentType: "application/json; charset=utf-8",
            type: requestMethod.POST,
            success: function () {
                node.icon = "../js/zTree3.5/css/zTreeStyle/img/diy/unlock.png";
                node.flag = COURSE_UNLOCK;
                var zTree = $.fn.zTree.getZTreeObj("treeInfo");
                zTree.updateNode(node);
                zTree.expandNode(node, true, false, true);
            }
        });
    }

</script>
