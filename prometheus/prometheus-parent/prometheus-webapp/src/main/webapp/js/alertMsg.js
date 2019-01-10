var alertMsg = {
    init:function(){
        this.$alertMsgBox = $("#alertMsgBox");
        if(this.$alertMsgBox.size()==0){
            this.$alertMsgBox = $('' +
                '<div class="alertMsg" id="alertMsgBox">' +
                    '<div class="alertContent">' +
                    '   <div class="alertError" id="alertTypeDiv">' +
                            '<div class="alertInner"><h2 id="alertMsgH1">错误</h2><div class="msg" id="msgDiv"></div>' +
                        '</div>' +
                        '<div class="toolBar"><ul id="btnUl"></ul></div>' +
                    '</div>' +
                '</div>' +
                '<div class="alertFooter">' +
                '<div class="alertFooter_r">' +
                '<div class="alertFooter_c">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<input type="text" name="_alertFocusCtr" style="width: 0; height: 0; display: none;">' +
                '</div>');
            $("body").append(this.$alertMsgBox)
        }
        this.$alertMsgBox.stop().css("top","-"+this.$alertMsgBox.css("height"));
        clearTimeout(this.timer);
    },
    show:function(typeName,msg,className){
        this.init();
        this.$alertMsgBox.animate({"top": "+="+this.$alertMsgBox.height()+"px"}, "slow");
        $("#alertMsgH1").html(typeName);
        $("#msgDiv").html(msg);
        $("#alertTypeDiv").attr("class",className);
        this.timer = setTimeout("alertMsg.hide()",5000)
    },
    hide:function(){
        this.$alertMsgBox.animate({"top": "-="+this.$alertMsgBox.height()+"px"}, "slow");
        clearTimeout(this.timer)
    },
    warn:function  (msg,cover,callback) {
        this.general(msg,cover,callback,"警告","alertWarn");
    },
    error:function  (msg,cover,callback) {
        this.general(msg,cover,callback,"错误","alertError");
    },
    success:function (msg,cover,callback) {
        this.general(msg,cover,callback,"成功","alertSuccess");
    },
    info:function (msg,cover,callback) {
        this.general(msg,cover,callback,"信息","alertInfo");
    },
    general:function(msg,cover,callback,type,className){
        this.show(type,msg,className);
        this.cover(cover);
        this.bindCallback(callback)
    },
    cover:function(cover){
        if(cover=="cover"||cover){
            clearTimeout(this.timer);
            showCover("");
        }
    },
    bindCallback:function(arg){
        if(arg ==undefined || typeof arg=="function"){
            arg=[{text:"关闭",callback:arg}];
        }
        if (Object.prototype.toString.call(arg).slice(8, -1) === "Array") {
            var $btnUl = $("#btnUl").empty();
            for(var i in arg){
                var btn = $('<li><a class="button"><span>' + arg[i].text + '</span></a></li>');
                if(arg[i].text=="关闭"){
                    btn.find("a").click(alertMsg.close);
                }
                btn.find("a").click(arg[i].callback);
                $btnUl.append(btn);
            }
        }
    },
    close:function(){
        alertMsg.hide();
        hideCover();
    },
    timer:null
};
