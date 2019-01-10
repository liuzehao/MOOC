var basePath = (function() {
    var url = window.location + "";
    var h = url.split("//");
    var x = h[1].split("/");
    return h[0] + "//" + window.location.host + "/" + x[1] + "/";
})();
var requestMethod = {
    GET:"GET",
    POST:"POST",
    PUT:"PUT",
    DELETE:"DELETE"
};
$(function(){
    $.ajaxSetup({
        cache: false,
        error: doError,
        dataType: "json"
    })
});

function doError(data){
    if(data.status==404){
        toast.error("未找到请求地址");
        return
    }
    if(data.statusText.indexOf("Failure")!=-1){
        toast.error("操作超时，请检查网络连接");
        return
    }
    if(data.statusText=="timeout"){
        toast.error("操作超时，请检查网络连接");
    }else{
        toast.error(data.responseText);
    }
}
function onSortColumnDefault(sortColumn, sortDirection) {
    return {
        sortColumn:sortColumn,
        sortDirection:sortDirection
    }
}

function getCheckedIds(checkboxName){
        var checkedIds = [];
        $("input[name=" + checkboxName + "]:checked").each(function () {
            checkedIds.push(this.value);
        });
        return checkedIds;
    }

function goToUrl(url){
    showCover();
    location.href = basePath + url;
}
/**
 * 删除校验方法
 * @param checkboxName
 * @return {bool}若为true可继续删除，若为false，调用此函数的方法需要return;
 */
function delValidate(checkboxName, text) {
    text = text == undefined ? "删除" : text;
    var $checkbox = $("input[name=" + checkboxName + "]:checkbox");
    if ($checkbox.size() <= 0) {
        alertMsg.warn("没有可操作的记录！");
        return false;
    }
    if ($checkbox.filter(":checked").size() < 1) {
        alertMsg.warn("请至少选择一个选项！");
        return false
    }
    return confirm("您确定要将这" + $checkbox.filter(":checked").size() + "项" + text + "吗？");
}
