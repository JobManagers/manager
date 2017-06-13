function tabCloseAll(obj){
    $(".win_close").click();
    $("#div_pannel").html("");
}
function tabCloseohter(obj){
	$(obj).parents("li").siblings().find(".win_close").click();
	$(obj).parent().hide();
	$(obj).parent("li").find(".menua").click();
}
function CreateDiv(tabid, url, name) {
	// if (document.getElementById("div_" + tabid) == null) {
	var box = document.createElement("iframe");
	box.id = "div_" + tabid;
	box.src = url;
	// box.height = "100%";
	box.frameBorder = 0;
	box.width = "100%";
	document.getElementById("div_pannel").innerHTML="";
	document.getElementById("div_pannel").appendChild(box);
	var tablist = document.getElementById("div_tab").getElementsByTagName('li');
	var pannellist = document.getElementById("div_pannel").getElementsByTagName('iframe');
	if (tablist.length > 0) {
		for (i = 0; i < tablist.length; i++) {
			tablist[i].className = "";
		}
	}
	var tab = document.createElement("li");
	tab.className = "crent";
	tab.id = tabid;
	var litxt = "<span><i></i><a href=\"javascript:;\" onclick=\"javascript:CreateDiv('" + tabid + "','" + url + "','" + name + "')\" title=" + name + " class=\"menua\">" + name + "</a><a onclick=\"RemoveDiv('" + tabid + "')\" class=\"win_close\" title=\"关闭当前窗口\"><a></span>";
	tab.innerHTML = litxt;
	tab.onmousedown=function(event){
		//tab右键函数
		var e = event || window.event; 
	    if (event.button==2){ 
			if(e.preventDefault){ 
			    e.preventDefault(); 
			} 
			if (e.stopPropagation){ 
			    e.stopPropagation(); 
			}else{ 
			    e.returnValue = false; // 解决IE8右键弹出 
			    e.cancelBubble = true; 
			}
			var ul=$("<ul id='tab_right_menu'></ul>")
	       var close_all=$("<div id='tab_close_all' onclick='tabCloseAll(this)'>全部关闭</div>");
	       var close_other=$("<div id='tab_close_other' onclick='tabCloseohter(this)'>关闭其他</div>");
	       ul.append(close_all,close_other);
	       $(tab).append(ul);
	       return false;
		}
	}
	tab.onmouseleave=function(){
		setTimeout(function(){
			$(tab).find("#tab_right_menu").remove();
		},200)
		
	}
	if($("#"+tabid).length==0){
        document.getElementById("div_tab").appendChild(tab);
	}else{
		$("#"+tabid).addClass("crent");
	}
	iFrameHeight("div_" + tabid);
	if($(".left_menu").find("."+$(".crent").attr("id")).length==0){
		$(".left_menu").find(".on").removeClass("on");
	}else{
		$(".left_menu").find("."+$(".crent").attr("id")).addClass("on").siblings().removeClass("on");
	}
	return false;
}
function RemoveDiv(obj) {
	var ob = document.getElementById(obj);
	ob.parentNode.removeChild(ob);
	var tablist = $("#div_tab li");
	if(tablist.length > 0){
		tablist.eq(length-1).addClass('crent');
		$(".crent").find(".menua").click();
	}
	$(".right_main").width($(document.body).width()-180);
}
// 计算页面的实际高度，iframe自适应会用到
function calcPageHeight(doc) {
  height=$(window).height()-100
  return height
}
function iFrameHeight(id) {   
	$("#"+id).load(function(){
	    var ifr= document.getElementById(id);
	    var iDoc = ifr.contentDocument || ifr.document;
	    var height = calcPageHeight(iDoc);
	    ifr.style.height = height + 'px';
	    $("#div_pannel").height(height)
        $("iframe").each(function(){
			var ifr= this;
			var iDoc = ifr.contentDocument || ifr.contentWindow.document;
			var div_first= iDoc.getElementsByTagName("div")[0];
	        var classname = $.trim($(div_first).attr("class"));
	        // console.log(classname)
		    if(classname=='header'){
		    	window.location.href="http://yun.kanglaohui.com/cloud-portal/login/login.htm";
		    }
		})
	}); 
	$(".right_main").width($(document.body).width()-180);
}   
$(function(){
	// tabs拖动 s
	document.oncontextmenu=function(){return false;}
	$( "#div_tab" ).sortable({ axis: "x" ,containment: 'parent'}).disableSelection();
    // tabs拖动 e
    $(".right_main").width($(document.body).width()-180);
	$(window).resize(function(){
		$("iframe").each(function(){
			var ifr= this;
			var iDoc = ifr.contentDocument || ifr.document;
		    var height = calcPageHeight(iDoc);
		    ifr.style.height = height + 'px';
		     $("#div_pannel").height(height)
		}); 
		$(".right_main").width($(document.body).width()-180);
	});
	$("iframe").each(function(){
		// 子页面表单固定头部
		var $fixed_top =$(this).contents().find(".fixed_top");
		if($fixed_top){
  			if($(window).scrollTop()<87){
		  		$fixed_top.fadeOut(100);
		  	}else{
		  		$fixed_top.css("top",$(document).scrollTop()-102);
		  		$fixed_top.fadeIn(300);
		  	}
	  	}
	})
  	$(window).scroll(function(){
  		$("iframe").each(function(){
  			var $fixed_top =$(this).contents().find(".fixed_top");
  			// console.log($fixed_top);
  			if($fixed_top){
	  			if($(window).scrollTop()<87){
			  		$fixed_top.fadeOut(100);
			  	}else{
			  		$fixed_top.css("top",$(document).scrollTop()-102);
			  		// console.log($(document).scrollTop());
			  		$fixed_top.fadeIn(300);
			  	}
		  	}
  		})
  		
  	});


})
