//提示生成函数
function zhyAlert(str,flag){
	var $div=$("<div class='zhy_alert'></div>");
	$div.text(str);
    $div.appendTo("body");
	if(flag){
		setTimeout(function(){
		    $div.remove();
		},3000);
	}else{
		setTimeout(function(){
		    $div.remove();
		},2000);
	}
}
// 设置其他服务站宽度
function setTabWidth(){
	var w_wid=$(window).width(),
	    w_crent=$(".site_crent").outerWidth(),
	    w_other=$(".site_other").width(),
	    w_ul_left=$(".left_menu").outerWidth(),
	    w_sum=w_crent+w_other+w_ul_left;
	    var sum_width=0,len=$(".site_list span").length;
	    for(var i=0;i<len;i++){
		   	sum_width+=parseInt($(".site_list span").eq(i).width());
		   	if(sum_width<(w_wid-w_sum)){
		   		$(".site_list span").eq(i).show();
		   		$(".site_list").width(w_wid-w_sum)
		   	}else{
		   		$(".site_list span").eq(i).hide();
		   	}
	    }
	    if(sum_width<(w_wid-w_sum)){
	    	$(".site_other").hide()
	    }else{
	    	$(".site_other").show()
	    }
}
/*
 * 展示其他服务站
 * */
function showOtherSite(){
    $(".site_other").addClass("site_other_down");
	$(".site_other_absolute").slideDown();
}
/*
 * 隐藏其他服务站
 * */
function hideOtherSite(){
	$(".site_other").removeClass("site_other_down");
	$(".site_other_absolute").slideUp();
}
 /*
 * 改变当前服务站
 * */
function setOtherSite(obj){
	$(".site_crent font").text($(obj).text());
	setTabWidth();
	$(".site_other").removeClass("site_other_down");
	$(".site_other_absolute").slideUp();
}

//显示顶部固定条
// function showFixeTop(){
// 	if($(window).scrollTop()>20) {
// 		$(".fixed_top").fadeIn(300);
// 	}else{
// 		$(".fixed_top").fadeOut(300);
// 	};
// }

//自定义radio checkbox样式
function setupLabel(){
	if($('.label_check input').length) {
		$('.label_check').each(function(){
			$(this).removeClass('c_on');
		});
		$('.label_check input:checked').each(function(){
			$(this).parent('label').addClass('c_on');
		});
	};
	if($('.label_radio input').length) {
		$('.label_radio').each(function(){
			$(this).removeClass('r_on');
		});
		$('.label_radio input:checked').each(function(){
			$(this).parent('label').addClass('r_on');
		});
	};
}
function subStringTitle(){
  $("td").each(function(){
    if($(this).attr("title")){
      var str = $(this).attr("title");
      var str_null='';
      var len =str.length;
      var row = parseInt(len/30);
      if(row == 0){
        $(this).attr("title",str)
      }else{
        var arr = new Array();
        for(var i= 0 ;i < row ;i++){
            var arr_0= str.substr(i*30,30)+"\r";
            str_null+=arr_0
        }
        $(this).attr("title",str_null)
      }
    }
  })
}

function calcPageHeightI(doc) {
    var height  = doc.body.clientHeight
    return height
}
function loadIfrHeight(obj){
    var ifr= obj;
    var iDoc = ifr.contentDocument || ifr.document;
    var height = calcPageHeightI(iDoc);
    ifr.style.height = height+80 + 'px';
//  console.log(height)
}
//点击td选中checkbox或者radio
function tableTdchooseRC(obj){
    $(obj).siblings().find(":radio").click();
    $(obj).siblings().find(":checkbox").click();
    setupLabel();
}

//textarea 还可以输入多少字符
function textareaLeftWords(obj){
	var left_w_all=$(obj).siblings("#tLeftWord").attr("left-word"),
	            len=left_w_all-$(obj).val().length;
	len < 0 ? 0:$("#tLeftWord").children("span").text(len);
	var str= $(obj).val().substring(0,left_w_all-1);
	$(obj).val(str);
};
$(function(){
	//第一屏隐藏回到底部
	var ksst=0,ksn=1;
	$(".ks").click(function(){
		var myWar = setInterval(function(){
			if($(window).scrollTop()==0){
				clearInterval(myWar)
			}else{
				ksst= $(window).scrollTop();
				ksn+=1;
				ksst=ksst-ksn;
				$(window).scrollTop(ksst);
			}
		},1)
    });
    if($(window).scrollTop()==0){
		$(".ks").stop().hide();
	}else{
		$(".ks").stop().show();
	}
    $(window).scroll(function(){
    	if($(this).scrollTop()==0){
    		$(".ks").stop().hide();
    	}else{
    		$(".ks").stop().show();
    	}
    });
	/*头部用户*/
	  $(".ht_gm_top_dla").hover(function(){
		$(this).addClass('on').children().children().children().addClass('spa1');
	  },function(){
		$(this).removeClass('on').children().children().children().removeClass('spa1');
	  });
    /*用户--end*/
	//左侧菜单
	$(".left_menu .first_left").children("li").children("span").click(function(){
		var vis= $(this).siblings("ul.second_left").css("display");
		if(vis=="none"){
			$(this).parent().addClass("on");
			$(this).siblings("ul").slideDown();
		}else{
			$(this).parent().removeClass("on");
			$(this).parent().find("ul").slideUp();
		}
		return false;	
	})
	//左侧二级菜单
	$("li",$(".second_left")).click(function(){
		$(".second_left li").removeClass("on")
		$(this).addClass("on")
	})
	$(".left_menu .second_left").children("li").children("span").click(function(){
		var vis= $(this).siblings("ul.second_left").css("display");
		if(vis=="none"){
			$(this).parent().addClass("on");
			$(this).siblings("ul").slideDown();
		}else{
			$(this).parent().removeClass("on");
			$(this).parent().find("ul").slideUp();
		}
		return false;	
	})
	
	// $(window).scroll(function(){
	// 	showFixeTop();
	// })
	// showFixeTop();
    subStringTitle();
	//下拉列表js
	$(".login_box").hover(function(){
		$(".dropdown-menu-header").show();
		$(".arrow_down").removeClass("arrow_down").addClass("arrow_up");
	},function(){
		$(".dropdown-menu-header").hide();
		$(".arrow_up").removeClass("arrow_up").addClass("arrow_down");
	})
	$(".dropdown-text,.dropdown-toggle").live("click",function(){
		$(".areaError").hide()
		var s_ul=$(this).siblings(".dropdown-menu");
		$(".dropdown-menu:visible").not(s_ul).each(function(i,el){
				$(el).hide();
		})
	    if($(this).siblings(".dropdown-menu").css("display")=='none'){
	        $(this).siblings(".dropdown-menu").show();
	    }else{
	        $(this).siblings(".dropdown-menu").hide();
	    }
    });
  $(".dropdown-menu-header li").click(function(){
  	$(".dropdown-menu-header").hide();
  })
  $(".dropdown-menu li").live("click",function(){
      $(this).parent("ul").siblings(".dropdown-text").text($(this).find("a").text());
      $(this).parent("ul").siblings(".dropdown-text").attr("value",$(this).find("a").attr("value"));
      $(this).parent("ul").siblings(".dropdown-text").parent().siblings(".selectError").hide();
      $(this).parent("ul").hide();
  });
  	$(".dropdown-menu li").each(function(){
  		$(this).click(function(){
  			$(this).parent("ul").siblings(".dropdown-text").text($(this).find("a").text());
  			$(this).parent("ul").hide();
  		})
  	});
  	$(".dropdown-menu").mouseleave(function(){
  		$(this).hide();
  	})
  	//左侧菜单栏
  	$("#mainFrame .second_left li").click(function(){
  		$(this).addClass("on");
  		$(this).parents("li").siblings().find(".on").removeClass("on");
  	});
  	//头部搜索
  	$(".header .search_btn_white").click(function(){
  		$(this).removeClass("search_btn_white").siblings("input").show();
  	});
  	$(".header .search").mouseleave(function(){
  		$(this).find(".search_btn").addClass("search_btn_white").siblings("input").hide();
  	});
	$("textarea").siblings("#tLeftWord").css({
	  	"position":"absolute",
	  	"right":"15px"
	});
	// 设置其他服务站宽度
	// 设置其他服务站宽度
	if($(".zhy_pub_header .site_change").length){
		setTabWidth()
	}
    $(window).resize(function(){
    	setTabWidth();
    	 // 切换其他服务站显隐
		if($(".site_other").length==1){
			if($(".site_other:visible").length==1){
				$(".site_other:visible").mouseenter(function(){
					showOtherSite();
				});
				$(document).mousemove(function(e){
			    	var x1= $(".site_other").offset().left,
			        	    y1= $(".site_other").offset().top,
			        	    w1= $(".site_other").outerWidth(),
			        	    h1= $(".site_other").outerHeight();
			    	var x2= $(".site_other_absolute").offset().left,
					    y2= $(".site_other_absolute").offset().top,
					    w2= $(".site_other_absolute").outerWidth(),
					    h2= $(".site_other_absolute").outerHeight();
					    if(e.pageX<$(".left_menu").width()||e.pageY< y1){
			                 hideOtherSite();
					    }
				})
		    }
	    }
	    $(".site_other_absolute").mouseleave(function(e){
	    	var x1= $(".site_other").offset().left,
        	    y1= $(".site_other").offset().top,
        	    w1= $(".site_other").outerWidth(),
        	    h1= $(".site_other").outerHeight();
	    	var x2= $(".site_other_absolute").offset().left,
			    y2= $(".site_other_absolute").offset().top,
			    w2= $(".site_other_absolute").outerWidth(),
			    h2= $(".site_other_absolute").outerHeight();
			    if(e.pageY>y2){
	                 hideOtherSite();
			    }
	    });
	    
    })
     // 切换其他服务站显隐
   if($(".site_other:visible").length==1){
    	$(".site_other:visible").mouseenter(function(){
    			showOtherSite();
    	});
    	$(document).mousemove(function(e){
		    	var x1= $(".site_other").offset().left,
		        	    y1= $(".site_other").offset().top,
		        	    w1= $(".site_other").outerWidth(),
		        	    h1= $(".site_other").outerHeight();
		    	var x2= $(".site_other_absolute").offset().left,
				    y2= $(".site_other_absolute").offset().top,
				    w2= $(".site_other_absolute").outerWidth(),
				    h2= $(".site_other_absolute").outerHeight();
				    if(e.pageX<$(".left_menu").width()||e.pageY< y1){
		                 hideOtherSite();
				    }
		});
   }
   
    $(".site_other_absolute").mouseleave(function(e){
    	var x1= $(".site_other").offset().left,
    	    y1= $(".site_other").offset().top,
    	    w1= $(".site_other").outerWidth(),
    	    h1= $(".site_other").outerHeight();
		var x2= $(".site_other_absolute").offset().left,
			    y2= $(".site_other_absolute").offset().top,
			    w2= $(".site_other_absolute").outerWidth(),
			    h2= $(".site_other_absolute").outerHeight();
			    if(e.pageY>y2){
	                 hideOtherSite();
			    }
	 })
})
	
