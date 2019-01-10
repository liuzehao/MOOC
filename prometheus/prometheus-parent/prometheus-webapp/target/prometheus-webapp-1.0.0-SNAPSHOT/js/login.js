var Login = function () {

    var handleLogin = function() {
        $('.login-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            onfocusout:false,
            onkeyup:false,
            onclick:false,
            rules: {
                loginName: {
                    required: true,
                    maxlength:12
                },
                password: {
                    required: true,
                    hasExceptLetterOrDigit:[],
                    maxlength:8,
                    ajax:{
                        url: "login/validate",
                        type: "post",
                        dataType:"json",
                        data: {
                            loginName: function (){
                                return $("#loginName").val();
                            },
                            password: function (){
                                return $("#password").val().md5();
                            }
                        }
                    }
                },
                remember: {
                    required: false
                }
            },

            messages: {
                loginName: {
                    required: "用户名不能为空！",
                    maxlength:"用户名字符长度至多12位",
                    ajax:"用户名不存在!"
                },
                password: {
                    required: "密码不能为空！",
                    hasExceptLetterOrDigit:"密码只能由字母或数字组成",
                    maxlength:"密码的字符长度至多8位",
                    ajax:"用户名或密码错误!"
                }
            },

            highlight: function (element) { // hightlight error inputs
                $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function (error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function (form) {
                $("#password").val($("#password").val().md5());
                form.submit();
            }
        });

        $('#password').keydown(function (e) {
            if (e.which == 13) {
                $(":submit").click();
            }
        });
        //输入密码回车默认登陆
        $("#loginName").keydown(function (e) {
            if (e.which == 13) {
                e.preventDefault();
                $("#password").focus();
            }
        }).focus();

    };

    return {
        //main function to initiate the module
        init: function () {
            handleLogin();
        }
    };
}();