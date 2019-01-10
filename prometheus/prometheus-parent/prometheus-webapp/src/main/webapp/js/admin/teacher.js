/**
 * Edit by IntelliJ IDEA.
 * User: longshihui
 * Date: 15-1-17
 * Time: 上午10:00
 */

var teacherRules = {
    objInfo: {
        teacherId: {
            checkEmpty: ["teacherId", "教师工号"]
        },
        teacherName: {
            checkEmpty: ["teacherName", "教师姓名"]
        },
        collegeId: {
            checkEmpty: ["collegeId", "学院名称"]
        },
        researchRoomId: {
            checkEmpty: ["researchRoomId", "教研室"]
        },
        course: {
            checkEmpty: ["course", "课程"]
        }
    }
};
function queryTeacherInfo() {
    var id = $("#queryTeacherId").val();
    var name = $("#queryTeacherName").val();
    var reg = new RegExp("[^\u4E00-\u9FA5]");
    if(id == "" && name == "") {
        bootbox.alert("请输入任意一项进行查询!");
        return;
    }
    else if( id != "" ) {
        if (isNaN(id)) {
            bootbox.alert("工号必须为数字");
            return;
        }
    }
    else if(name != "") {
        if (reg.test(name)) {
            bootbox.alert("姓名只能由中文组成");
            return;
        }
    }
    else{
        if (isNaN(id)) {
            bootbox.alert("工号必须为数字");
            return;
        }
        if (reg.test(name)) {
            bootbox.alert("姓名只能由中文组成");
            return;
        }
    }
    $("#query").attr({action:"getTeacherInfoList",method:"post"}).submit();
}

function toAddTeacherInfo() {
    window.location.href = basePath + "teacher/toAddTeacherInfo";
}

function save() {
//    if (!JC.validate(teacherRules))return;
    var college = {
        collegeId: $("#collegeId").val(),
        collegeName: $("#collegeName").val()
    };
    var researchRoom = {
        researchRoomId: $("#researchRoomId").val(),
        researchRoomName: $("#researchRoomName").val()
    };
    var course = {
        courseId:$("#courseId").val(),
        courseName:$("#courseName").val()
    }
    var teacher = {
        teacherId: $("#teacherId").val(),
        teacherName: $("#teacherName").val(),
        collegeVO: college,
        researchRoomVO: researchRoom,
        courseVO:course,
        email: $("#email").val(),
        telephone: $("#telephone").val()
    };
    $.ajax({
        url: basePath + "teacher/addTeacherInfo",
        data: JSON.stringify(teacher),
        contentType: "application/json; charset=utf-8",
        type: requestMethod.POST,
        success: function (data) {
            if (data.ok) {
                window.location.href = basePath + "admin/getTeacherInfoList";
            } else {
                alertMsg.error(data.returnMsg);
            }
        }
    });
}

function deleteTeacherInfo(teacherId) {
    bootbox.confirm("确定删除？",function (result){
        if(result){
            $.ajax({
                url: basePath + "teacher/deleteTeacherInfo",
                data: {teacherId: teacherId},
                type: requestMethod.POST,
                success: function () {
                    window.location.href = basePath + "admin/getTeacherInfoList";
                }
            });
        }
    })


}

function deleteManyTeacherInfo() {
    if (!delValidate("teacherIds"))return;
    coverToggle();
    $.ajax({
        url: basePath + "teacher/deleteManyTeacherInfo",
        data: {
            teacherIds: getCheckedIds("teacherIds")
        },
        type: requestMethod.POST,
        success: function () {
            window.location.href = basePath + "admin/getTeacherInfoList";
        }
    });
}

function showTeacherInfo(teacherId) {
    jQuery("#form").attr("form-type","edit");
    $.ajax({
        url: basePath + "teacher/showTeacherInfo",
        data:{
            teacherId:teacherId
        },
        type: requestMethod.POST,
        dataType:"json",
        success: function (data) {

           $("#teacherId").val(data.teacherId);
           $("#teacherName").val(data.teacherName);
           $("#collegeId").val(data.collegeVO.collegeId);
           $("#collegeName").val(data.collegeVO.collegeName);
           $("#researchRoomId").val(data.researchRoomVO.researchRoomId);
           $("#researchRoomName").val(data.researchRoomVO.researchRoomName);
           $("#courseName").val(data.courseVO.courseName);
           $("#courseId").val(data.courseVO.courseId);
           $("#email").val(data.email);
           $("#telephone").val(data.telephone);
        }
    });
}

function saveUpdateResult() {

    var college = {
        collegeId: $("#collegeId").val(),
        collegeName: $("#collegeName").val()
    };
    var researchRoom = {
        researchRoomId: $("#researchRoomId").val(),
        researchRoomName: $("#researchRoomName").val()
    };
    var course = {
        courseId:$("#courseId").val(),
        courseName:$("#courseName").val()
    }
    var teacher = {
        teacherId: $("#teacherId").val(),
        teacherName: $("#teacherName").val(),
        collegeVO: college,
        researchRoomVO: researchRoom,
        courseVO:course,
        email: $("#email").val(),
        telephone: $("#telephone").val()
    };
    $.ajax({
        url: basePath + "teacher/updateTeacherInfo",
        data: JSON.stringify(teacher),
        contentType: "application/json; charset=utf-8",
        type: requestMethod.POST,
        success: function () {
            window.location.href = basePath + "admin/getTeacherInfoList";
        }
    });
}

var saveHandle = function (){

    if($("#form").attr("form-type") == "add"){
        save();
    }
    else{
        saveUpdateResult();
    }

}

var modal = function (){
    return {
        init:function(){
            jQuery("#close").click(function(){
                jQuery("#info").get(0).reset();
                jQuery("*","#info").removeClass("has-error has-success");
                jQuery("span","#info").remove();
            })
            jQuery("#add").click(function(){
                jQuery("#form").attr("form-type","add");
            });
            jQuery("#form").attr("form-type","add");
        }
    }
}();

var formValidate = function (){

    var handle = function (){

        $("#info").validate({
            errorElement:"span",
            errorClass:"help-block col-md-3 has-error",
            rules:{
                teacherId: {
                    required:true,
                    isNum:[]
                },
                teacherName:{
                    required:true,
                    isChinese:[],
                    maxlength:8
                },
                collegeName:{
                    required:true
                },
                researchRoomName:{
                    required:true
                },
                email:{
                    required:true,
                    email:true
                },
                telephone:{
                    required:true,
                    isNum:[]
                }
            },
            messages:{
                teacherId: {
                    required:"*工号不能为空!",
                    isNum:"*工号只能由数字组成"
                },
                teacherName:{
                    required:"*名字不能为空!",
                    isChinese:"名字只能由中文组成",
                    maxlength:"*至多包含8个汉字!"
                },
                collegeName:{
                    required:"*学院还没有选择!"
                },
                researchRoomName:{
                    required:"*教研室还没有选择!"
                },
                email:{
                    required:"*电子邮箱不能为空!",
                    email:"*邮箱格式有误!请重新输入!"
                },
                telephone:{
                    required:"*联系方式不能为空!"
                }
            },
            errorPlacement:function (error,element){
                error.insertAfter(element.closest(".col-md-6"));
            },
            highlight:function (element){
                $(element).closest(".form-group").removeClass("has-success").addClass("has-error");
            },
            unhighlight: function(element){
                $(element).closest(".form-group").removeClass("has-error").addClass("has-success");
            },
            success: function(label){
                label.remove();
            },
            submitHandler: function (form){
                saveHandle();
            }
        })
    }

    return {

        init:function (){
            handle();
        }

    }

}();