  function showPopMGuide(className){//页面加载时展示功能引导图
	var w_h = parseInt($("body").height());
    var t_h= parseInt($("."+className).height());
    var top=parseInt(w_h-t_h)/2;
    if(t_h>w_h){
    	$("."+className).height(w_h-50).css("overflow","scroll");
    	$("."+className).width($("."+className).width()+20)
    	top= 20;
    }
	$(".zhy_zhezhao_pop").css("height",w_h).show();
	$(".zhy_guide_tip").hide();
	$("." + className).css("top", top).show();
}

function showPopGuide(className){//点击展示功能引导图
   	var width;
   	if(className=="zhy_popa_guidea"){
   		width=1260;
   	}else if(className=="zhy_popa_guidec"){
   		width=950;
   	}else{
   		width=1174;
   	}
   	var mleft= -width/2;
   	$(".zhy_zhezhao_pop").css("top","0px");
    $("."+className).css({
   		"position":"absolute",
   		"marginLeft":mleft+"px",
   		"left":"50%",
   		"width":width+"px",
   		'right':'auto',
   		height:"auto",
   		opacity:1
   	});
   $(".helpcenter .login_box").removeClass("on");
   $(".helpcenter .login_box .dropdown-menu-header").css("display","none");
   $(".helpcenter .login_box").find(".arrow_up").removeClass("arrow_up").addClass("arrow_down");
   showPopMGuide(className);
}
function showGuideTip(){//展示帮助下拉列表
	$(".helpcenter .login_box").addClass("on");
	$(".helpcenter .login_box .dropdown-menu-header").css("display","block");
	$(".helpcenter .login_box").find(".arrow_down").removeClass("arrow_down").addClass("arrow_up");
	var t= $(".helpcenter .so-awesome").offset().top+30,
    l= $(".helpcenter .so-awesome").offset().left-180;
	$(".zhy_guide_tip").css({
    	left:l+"px",
    	top:t+"px"
    }).show();
}
function hideGuide(){//隐藏引导弹框 展示帮助下拉列表
	$(".zhy_popa_guide").css({"position":"fixed","marginLeft":'0px',"left":"auto"}).animate({
		right:"300px",
		top :'60px',
		height:0,
		width:0,
		opacity:0
	},800,function(){
		showGuideTip()
	})
}
function hideGuide2(){//隐藏引导弹框 展示帮助下拉列表
	$(".zhy_popa_guide").css({"position":"fixed","marginLeft":'0px',"left":"auto"}).animate({
		right:"300px",
		top :'60px',
		height:0,
		width:0,
		opacity:0
	},800,function(){
		$(".zhy_zhezhao_pop").hide();
	});

}
function hideGuideM(){//隐藏弹框和帮助下拉列表
	$(".helpcenter .login_box").removeClass("on");
	$(".helpcenter .login_box .dropdown-menu-header").css("display","none");
	$(".helpcenter .login_box").find(".arrow_up").removeClass("arrow_up").addClass("arrow_down");
	$(".zhy_guide_tip").hide();
	hidePopC();
}
 function goMoudel(classname){// 切换右侧 左侧菜单响应
	$(".left_menu .second_left").find(".on").removeClass("on");
	$("."+classname).addClass("on");
	$("."+classname).parents(".second_left").css("display","block").parent("li").addClass("on")
}
function showCallIfr(){//显示呼叫中心部分页面
   $("#mainf").hide();
   $("#callIframe").fadeIn(30);
   $(".call_min_icon").hide();
}
function closeCallIfr(){//隐藏呼叫中心部分页面
	$("#callIframe").hide();
	$("#mainf").fadeIn(30);
	$(".call_min_icon").show();
}
function setMainIfr(obj){//呼叫中心 - 工单管理
	var src=$(obj).attr("ahref");
	$("#callIframe").hide();
	$("#mainf").attr("src",src).show();
	$(".call_min_icon").show();
}
function CreateDiv(classname,url,name){
	$(".second_left").find(".on").removeClass("on");
	$(".second_left").find("."+classname).addClass("on");
	$(".second_left .on").parents(".second_left").slideDown().parent("li").addClass("on");
	$("#mainf").attr("src",url);
}
// 文字左右无缝滚动
 function  Marquee(){ 
		var right_a =$(".bgfcfaf2 .marquee").css("right");
		var b_wid=$(".bgfcfaf2").width()-400;
		var span_wid= $(".bgfcfaf2 .marquee span").eq(0).width();
		var span_len=$(".bgfcfaf2 .marquee span").length;
		if(span_len=1){
//			$(".bgfcfaf2 .marquee span").eq(0).css("margin-right","0px");
		}
		b_wid=b_wid-span_wid;
		right_a=parseInt(right_a);
		var sum_width=0;
	    $(".bgfcfaf2 .marquee span").each(function(){
	     	sum_width+=$(this).width();
	    });
		 if(right_a > -(sum_width+$(".bgfcfaf2 .marquee span").length*400)){
		    right_a=right_a-1;
		 	$(".bgfcfaf2 .marquee").css("right",right_a+"px")
		 }else{
		 	$(".bgfcfaf2 .marquee").css("right",b_wid+"px")
		 } 
		
}
 /*
  右侧区域宽高
  * */
 function calArea(){
 	var w_h = $(window).height(),
 	    w_w = $(window).width(),
 	    headr_h = $(".header").outerHeight(),
 	    ul_left_w = $(".left_menu").outerWidth(),
 	    bg_h = $("#mainFrame .bgfcfaf2:visible").outerHeight();
	 	var right_h = w_h-headr_h-bg_h;
	    $("#div_pannel").height(right_h);
	     $("#mainFrame").height(w_h-headr_h);
	    $(".right_main").width(w_w-ul_left_w);
 }
$(function(){
	calArea();
	$(window).resize(function(){
		calArea();
		if($(".zhy_mall_btn_biga").length!=0){
	    	left_menu_height= $("#mainFrame").height()-105;
	    	$(".left_menu").height(left_menu_height);
	    }else{
	    	left_menu_height= $("#mainFrame").height()-30;
	    	$(".left_menu").height(left_menu_height);
	    }
//  	$('#testDiv').slimScroll({
//			width: '175px',
//	       height: left_menu_height, 
//		   size: '5px',
//		   position: 'right',
//		   color: '#e5e5e5',
//		   alwaysVisible: true, 
//		   railVisible: true, 
//		   wheelStep: 10, 
//		   allowPageScroll: false,
//		   disableFadeOut: false 
//		});
		if($(".zhy_popa_guide:visible").length!=0){
			var str =$(".zhy_popa_guide:visible").attr("class");
			var arr =new Array();
			arr= str.split(" ");
			showPopGuide(arr[2])
		}
    })
	// 文字左右无缝滚动
	// 文字左右无缝滚动
	if($(".bgfcfaf2 .marquee").length==1){
		var b_wid=$(".bgfcfaf2").width()-400;
		var span_wid= $(".bgfcfaf2 .marquee span").eq(0).width();
		b_wid=b_wid-span_wid;
	    $(".bgfcfaf2 .marquee").css("right",b_wid+"px");
	    var MyMar=setInterval(Marquee,20); 
	    $(".bgfcfaf2 .marquee").mouseover(function() {clearInterval(MyMar);} )
	    $(".bgfcfaf2 .marquee").mouseout(function() {MyMar=setInterval(Marquee,20);}) 
	}
})    
    $(window).resize(function(){
    	
    })