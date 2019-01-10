jQuery.validator.addMethod("hasExceptLetter",function (value,element,param){
    var reg = new RegExp("[^a-z,A-Z]");
    return reg.test(value)? false:true;
},"只能由字母组成!");
jQuery.validator.addMethod("hasExceptLetterOrDigit",function (value,element,param){
    var reg = new RegExp("[^\\d,a-z,A-Z]");
    return reg.test(value)? false:true;
},"只能由字母或数字组成!")
jQuery.validator.addMethod("isNum",function(value,element,param){
    return isNaN(value)? false:true;
},"*只能输入数字!");
jQuery.validator.addMethod("isChinese",function(value,element,param){
    var chinese = new RegExp("[^\u4E00-\u9FA5]");
    return chinese.test(value)? false:true;
},"*只能由中文组成");
jQuery.validator.addMethod("ajax",function(value,element,param){
    var flag = false;
    $.ajax({
        url:param.url,
        type:param.type,
        data:param.data,
        dataType:param.dataType,
        async:false,
        success:function(data){
            flag = data;
        }
    })
    return Boolean(flag);
}, "ajax result is false");