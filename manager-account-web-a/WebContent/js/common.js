//提示生成函数
function zhyAlert(str,flag){
	var $div=$("<div class='zhy_alert'></div>");
	$div.text(str);
    $div.appendTo("body");
    var ml=parseInt($div.width()/2);
    $div.css("marginLeft",ml);
	if(flag){
		setTimeout(function(){
		    $div.fadeOut().remove();
		},3000);
	}else{
		setTimeout(function(){
		    $div.fadeOut().remove();
		},2000);
	}
}
//提示生成函数
function ruzhu_zhyAlert(str){
	var $div=$("<div class='ruzhu_zhy_alert'></div>");
	$div.text(str);
    $div.appendTo("body");
    var ml=parseInt($div.width()/2);
    $div.css("marginLeft",ml);
	if(flag){
		setTimeout(function(){
		    $div.fadeOut().remove();
		},3000);
	}else{
		setTimeout(function(){
		    $div.fadeOut().remove();
		},2000);
	}
}
function setBodyHeight(){
	//页面高度 100%
		var h=$("body").height()<$(window).height()?$(window).height():$("body").height();
        $(".main_content> .col-sm-12").height(h-30);
}
// 评价星等级
function showLevelStar(){
	$(".atar_Show p").each(function(){//评分星级
	   var crent_val= $(this).attr("tip");
	   var crent_wid=  $(this).parent().width()*(crent_val/5);
	   $(this).css("width",crent_wid)
	});
}
showLevelStar();
;// 设置其他服务站宽度
function setTabWidth(){
	var w_wid=$(window).width(),
	    w_crent=$(".site_crent").outerWidth(),
	    w_other=$(".site_other").outerWidth(),
	    w_sum=w_crent+w_other;
	    var sum_width=0,len=$(".site_list span").length;
	    for(var i=0;i<len;i++){
		   	sum_width+=parseInt($(".site_list span").eq(i).outerWidth());
//		   	console.log($(".site_list span").eq(i).outerWidth())
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
//	     console.log(sum_width)
//  	if(w_wid<w_sum){
//  		$(".site_list").hide()
//  	}else{
//  		$(".site_list").width(w_wid-w_sum)
//      }
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
function setOtherSite(obj,url){
	$(".site_crent font").text($(obj).text());
	$(obj).parent().addClass("on").siblings().removeClass("on");
	setTabWidth();
	$(".site_other").removeClass("site_other_down");
	$(".site_other_absolute").slideUp();
	$("#mainf").attr("src",url);
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
	len <= 0 ? len=0:len;
	$(obj).siblings("#tLeftWord").children("span").text(len);
	var str= $(obj).val().slice(0,left_w_all);
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
		if(vis=="none"){//展开
			$(this).parent().addClass("on");
			$(this).siblings("ul").slideDown();
			if($(".zhy_mall_btn_biga").length!=0){
			    var h =$(window).height()-155;
			}else{
				var h =$(window).height()-80;
			}
			$('#testDiv').slimScroll({scrollBy: "1px" });
			if($(this).offset().top>=h){
				var scrollD= $(this).siblings("ul").find("li").length*40+'px';
			    $('#testDiv').slimScroll( {scrollBy: "40px" });
			}
		}else{
			$(this).parent().removeClass("on");
			$(this).parent().find("ul").slideUp();
			$('#testDiv').slimScroll({scrollBy: "1px" });
		}
		return false;	
	})
	//左侧二级菜单
	$("li",$(".second_left")).click(function(){
		$(".second_left li").removeClass("on")
		$(this).addClass("on");
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
		$(this).find(".dropdown-menu-header").show();
		$(this).find(".arrow_down").removeClass("arrow_down").addClass("arrow_up");
	},function(){
		$(this).find(".dropdown-menu-header").hide();
		$(this).find(".arrow_up").removeClass("arrow_up").addClass("arrow_down");
	})
	$(".dropdown-text,.dropdown-toggle").live("click",function(e){
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
	    e.stopPropagation()
    });
  $(".dropdown-menu-header li").click(function(){
  	$(this).parent().hide();
  })
  $(".dropdown-menu li").live("click",function(){
      $(this).parent("ul").siblings(".dropdown-text").text($(this).find("a").text());
      $(this).parent("ul").siblings(".dropdown-text").attr("value",$(this).find("a").attr("value"));
      $(this).parent("ul").siblings(".dropdown-text").parent().siblings(".selectError").hide();
      $(this).parent("ul").hide();
  });
  	$(".dropdown-menu li").each(function(){
  		if($(this).find("label").length){
  			var str="";
  				var len=$(this).parent().find(":checked").length;
  				if(len!=0){
  					$(this).parent().find(":checked").each(function(){
						str+=$(this).parent().text()+" ";
					})
  				}else{
  					str="请选择"
  				}
			    $(".multi_text").text(str)
  			$(this).click(function(e){
  				var str="";
  				var len=$(this).parent().find(":checked").length;
  				if(len!=0){
  					$(this).parent().find(":checked").each(function(){
						str+=$(this).parent().text()+" ";
					})
  				}else{
  					str="请选择"
  				}
//				$(this).parent("ul").siblings(".dropdown-text").text(str);
			    $(this).parent("ul").show();
			    $(".multi_text").text(str)
			   e.stopPropagation();
  			})
  			
	  	}else{
	  		$(this).click(function(){
	  			$(this).parent("ul").siblings(".dropdown-text").text($(this).find("a").text());
	  			$(this).parent("ul").hide();
	  		})
	  	}
  	});
  	$(".dropdown-menu").mouseleave(function(){
  		if($(this).find("label").length){
  			$(this).show();
  		}else{
  			$(this).hide();
  		}
  		
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
	// 设置其他服务站宽度
	if($(".zhy_pub_header .site_change").length){
		setTabWidth();
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
	}
	
	$(".selectbox_show + .inline").css({
        	"margin-top":"0px !important"
    });
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
	    
    });
    
    
})
var t=null;	
// 隐藏修改弹框
function hidePopM(className) {
	$("."+className).hide();
	$(".zhy_zhezhao_pop").hide();
}
//关闭窗口倒计时
function timeOut(n){
	var n= parseInt($('.timeout').eq(0).text());
	n--;
	if(n==0){
       hidePop();
	}else{
	    $('.timeout').text(n);
	}
}
//在主页面显示弹框
function showPopM(className,flag){
	var w_h = parseInt($("body").height());
    var t_h= parseInt($("."+className).height());
	var top=parseInt(w_h-t_h)/2;
	$(".zhy_zhezhao_pop").css("height",w_h).show();
	$("." + className).css("top", top).show().siblings(".zhy_popa").hide();
	if(flag){
	  t= setInterval("timeOut(6)",1000);
	}
	setupLabel();
}
//显示弹框
function showPopC(className){
	$(".zhy_zhezhao_pop").show();
	var top = $(document).scrollTop();
	var this_h = $("." + className).height();
	var win_all = $('html').height();
	var win_h = ($('html').height()-this_h-100)/2;
	$(".zhy_zhezhao_pop").height($("html").height());
	var this_h = $("." + className).height();
	top= top +win_h 
//	top< 0 ? top=0:top=top;
	if(this_h>(win_all-100)){
    	$("."+className).height(win_all-130).css("overflow-y","scroll");
    	$("."+className).width($("."+className).width()+20)
    	top= 20+$(document).scrollTop();
    }
	
	$("." + className).css("top", top).show().siblings(".zhy_popa").hide();
}
// 隐藏修改弹框
function hidePopC() {
	$(".zhy_zhezhao_pop").hide();
	$(".zhy_popa").hide();
}