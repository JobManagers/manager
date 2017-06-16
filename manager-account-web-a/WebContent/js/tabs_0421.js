
// 文字左右无缝滚动
function  Marquee(){ 
	var left= $(".bgfcfaf2 .marquee").offset().left;
	var top= $(".bgfcfaf2 .marquee").offset().top;
	var w= $(".bgfcfaf2 .marquee span").length-1;
	if(w >=0){
	    var laSpan= $(".bgfcfaf2 .marquee span").eq(w);
		var laSpan_w= -$(".bgfcfaf2 .marquee span").width()+180;
		if(laSpan.offset().left >laSpan_w) 
		{
			newPos=new Object();
			newPos.left=left-1;
			newPos.top=top;
			$(".bgfcfaf2 .marquee").offset(newPos)
		}else if(laSpan.offset().left <=laSpan_w) {
			$(".bgfcfaf2 .marquee").css("left","100%")
		} 
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
    $(".right_main").width(w_w-ul_left_w);
 }
$(function(){
	calArea()
	$(window).resize(function(){
		calArea()
    })
	// 文字左右无缝滚动
	if($(".bgfcfaf2 .marquee").length==1){
		var MyMar=setInterval(Marquee,40); 
	    $(".bgfcfaf2 .marquee").mouseover(function() {clearInterval(MyMar);} )
	    $(".bgfcfaf2 .marquee").mouseout(function() {MyMar=setInterval(Marquee,40);})
	}
    
   
    
	
	// $("iframe").each(function(){
	// 	// 子页面表单固定头部
	// 	var $fixed_top =$(this).contents().find(".fixed_top");
	// 	if($fixed_top){
 //  			if($(window).scrollTop()<87){
	// 	  		$fixed_top.fadeOut(100);
	// 	  	}else{
	// 	  		$fixed_top.css("top",$(document).scrollTop()-102);
	// 	  		$fixed_top.fadeIn(300);
	// 	  	}
	//   	}
	// })
 //  	$(window).scroll(function(){
 //  		$("iframe").each(function(){
 //  			var $fixed_top =$(this).contents().find(".fixed_top");
 //  			// console.log($fixed_top);
 //  			if($fixed_top){
	//   			if($(window).scrollTop()<87){
	// 		  		$fixed_top.fadeOut(100);
	// 		  	}else{
	// 		  		$fixed_top.css("top",$(document).scrollTop()-102);
	// 		  		// console.log($(document).scrollTop());
	// 		  		$fixed_top.fadeIn(300);
	// 		  	}
	// 	  	}
 //  		})
  		
 //  	});


})
