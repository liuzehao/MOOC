function coverToggle(content) {
    content = content==undefined?"内容加载中，请稍等...":content;
    if ($("#carpoCover").size() == 0) {
        var html = '<div id="carpoCover" class="coverDiv"></div>' +
                '<span id="carpoSpan" class="coverSpan"></span>';
        $("body").append(html);
    } else if ($("#carpoCover")[0].style.display != "none") {
        $("#carpoCover,#carpoSpan").hide();
        return;
    }
    $("#carpoSpan").html(content);
    if(content==""){
        $("#carpoSpan").removeClass("coverSpanBack")
    }else{
        $("#carpoSpan").addClass("coverSpanBack")
    }
    var rel = document.compatMode == 'CSS1Compat' ? document.documentElement : document.body;
    var width = Math.max(rel.scrollWidth, rel.clientWidth || 0) - 1;
    var height = Math.max(rel.scrollHeight, rel.clientHeight || 0) - 1;
    $("#carpoCover").css({
        width: width + 'px',
        height: height + 'px'
    }).show();
    $("#carpoSpan").css({
        top:(height - 20) / 2,
        left:(width - 160) / 2
    }).show();
}
function hideCover(){
    $("#carpoCover,#carpoSpan").hide();
}
function showCover(content){
    coverToggle(content);
    $("#carpoCover,#carpoSpan").show();
}