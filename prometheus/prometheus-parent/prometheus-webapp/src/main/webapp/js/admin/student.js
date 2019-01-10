/**
 * Edit by IntelliJ IDEA.
 * User: longshihui
 * Date: 15-1-17
 * Time: 上午10:00
 */

function queryStudentInfo() {
    var id = $("#queryStudentId").val();
    var name = $("#queryStudentName").val();
    var reg = new RegExp("[^\u4E00-\u9FA5]");
    if(id == "" && name == "") {
        bootbox.alert("请输入任意一项进行查询!");
        return;
    }
    else if( id != "" ) {
        if (isNaN(id)) {
            bootbox.alert("学号必须为数字");
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
            bootbox.alert("学号必须为数字");
            return;
        }
        if (reg.test(name)) {
            bootbox.alert("姓名只能由中文组成");
            return;
        }
    }
    $("#query").attr({action:"getStudentInfoList",method:"post"}).submit();
}

function save() {
    var profession = {
        professionId:$("#professionId").val(),
        professionName:$("#professionName").val()
    }
    var college = {
        collegeId:$("#collegeId").val(),
        collegeName:$("#collegeName").val()
    }
    var student = {
        studentId:$("#studentId").val(),
        studentName:$("#studentName").val(),
        collegeVO:college,
        professionVO: profession,
        email: $("#email").val()
    };
    $.ajax({
        url: basePath + "student/addStudentInfo",
        data: JSON.stringify(student),
        contentType: "application/json; charset=utf-8",
        type: requestMethod.POST,
        success: function (data) {
            if (data.ok) {
                window.location.href = basePath + "admin/getStudentInfoList";
            } else {
                alertMsg.error(data.returnMsg);
            }
        }
    });
}

function deleteManyStudentInfo() {
    if (!delValidate("studentIds"))return;
    coverToggle();
    $.ajax({
        url: basePath + "student/deleteManyStudentInfo",
        data: {
            studentIds: getCheckedIds("studentIds")
        },
        type: requestMethod.POST,
        success: function () {
            window.location.href = basePath + "admin/getStudentInfoList";
        }
    });
}

function showStudentInfo(id) {
    jQuery("#form").attr("form-type","edit");
    $.ajax({
        url: basePath + "student/showStudentInfo",
        data:{
            studentId:id
        },
        type: requestMethod.POST,
        dataType:"json",
        success: function (data) {
            $("#studentId").val(data.studentId);
            $("#studentName").val(data.studentName);
            $("#collegeName").val(data.collegeVO.collegeName);
            $("#collegeId").val(data.collegeVO.collegeId);
            $("#professionName").val(data.professionVO.professionName);
            $("#professionId").val(data.professionVO.professionId);
            $("#email").val(data.email);
        }
    });

}

function saveUpdateResult() {

    var profession = {
        professionId:$("#professionId").val(),
        professionName:$("#professionName").val()
    }
    var college = {
        collegeId:$("#collegeId").val(),
        collegeName:$("#collegeName").val()
    }
    var student = {
        studentId:$("#studentId").val(),
        studentName:$("#studentName").val(),
        collegeVO:college,
        professionVO: profession,
        email: $("#email").val()
    };

    $.ajax({
        url: basePath + "student/updateStudentInfo",
        data: JSON.stringify(student),
        contentType: "application/json; charset=utf-8",
        type: requestMethod.POST,
        success: function () {
            window.location.href = basePath + "admin/getStudentInfoList";
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
                });
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
                studentId: {
                    required:true,
                    isNum:[]
                },
                studentName:{
                    required:true,
                    isChinese:[],
                    maxlength:8
                },
                collegeName:{
                    required:true
                },
                professionName:{
                    required:true
                },
                email:{
                    required:true,
                    email:true
                }
            },
            messages:{
                studentId: {
                    required:"*学号不能为空!",
                    isNum:"*学号只能由数字组成"
                },
                studentName:{
                    required:"*名字不能为空!",
                    isChinese:"*名字只能由中文组成",
                    maxlength:"*至多包含8个汉字!"
                },
                collegeName:{
                    required:"*学院还没有选择!"
                },
                professionName:{
                    required:"*专业不能为空!"
                },
                email:{
                    required:"*电子邮箱不能为空!",
                    email:"*邮箱格式有误!请重新输入!"
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
        });


    }

    return {

        init:function (){
            handle();
        }

    }

}();