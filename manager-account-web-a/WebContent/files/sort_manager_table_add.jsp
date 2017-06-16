<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Demo</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../css/common.css" />
		<link rel="stylesheet" href="../css/welcome.css" />
		<link rel="stylesheet" type="text/css" href="../css/jk_zy_baogao.css"/>
         <link rel="stylesheet" href="../css/jquery.ptTimeSelect.css" /><!-- 日历样式 -->
         <style type="text/css">
			td span{white-space: nowrap;}
		</style>
		 
		 
		 <!--时间选择CSS  -->
		<link rel="stylesheet" type="text/css" href="../css/jquery.datetimepicker.css"/>
		
		<link rel="stylesheet" type="text/css" href="../css/jquery.datetimepicker.css"/>
		
		<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
		
	
		<script type="text/javascript" src="../js/jquery.datetimepicker.full.js"></script>
		
		 
		 <style type="text/css">
			.ofile {
			    position: absolute;
			    top:274px;
			    left:50px;
			    display: inline-block;
			    background: #feffff;
			    border: 1px solid #26a2f1;
			    padding: 4px 12px;
			    overflow: hidden;
			    color: #26a2f1;
			    text-decoration: none;
			    text-indent: 0;
			    line-height: 20px;
			}
			.ofile input {
			    position: absolute;
			    font-size: 16px;
			    right: 0;
			    top: 0;
			    opacity: 0;
			}
			
			.choose-list li,.choosed-list li{overflow: hidden;padding: 10px 0px;}
			.choose-list span{display: inline-block;width: 100%;float:left;text-align: center;padding-left: 0px !important;}
			.choosed-list span{display: inline-block;;width: 100%;float:left;text-align: center;}
			.choose-list span+span{display: inline-block;width: 1000%;}
			.choosed-list span+span{width:100%;}
			  
		</style>
		
</head>
<body>
		<!--遮罩层-->
		<div class="zhy_zhezhao_pop " style="height:800px;"></div>
		<div class="zhy_popa dialog_1 " style="width: 450px;margin-left: -225px;display: none;">
			<p class="color66">请稍候...<span class="pull-right close_icon" onclick="hidePop()"></span></p>
			<div class="pop_content text-center">
				<img src="${res_uri}/img/loading_load.gif" />
				<div style="height: 15px;"></div>
			  	<p>处理中，请稍候...</p>
			</div>
		</div>
		<!--遮罩层 end-->
		<div class="main_content add_block" >
		  <div class='div_bordered'>
		  	<div class="panel panel-default choose_block">
		  		<a href="sort_manager_table_list.jsp" class="colorbg font14 pull-right mr15">&lt;&lt;返回列表</a>
		  		<div class="panel-heading color333">新增排班表</div>
		  		<div class="divider">
		  		</div>
				<form class="form-horizontal old_block" id="addShiftTableForm" role="form">
					<input type="hidden" name="shiftPlanBaseId" id="shiftPlanBaseId">
					<input type="hidden" name="teamIds" id="teamIds">
					<input type="hidden" name="teamNames" id="teamNames">
					<div id="hiddenDiv"></div>
				   <div class="form-group" >
				      <label for="name1" class="col-sm-2 control-label">排班表名称：</label>
				      <div class="col-sm-10">
				         <input type="text" class="form-control input150 validate[required,custom[illegallyStr],maxSize[32]]" id="tableName" name="tableName" placeholder="请输入排班表名称" value=""/>
				         <em class="colorred">*</em>
				      </div>
				   </div>
				   <div class="form-group" >
				      	<label for="" class="col-sm-2 control-label">排班方案：</label>
				      	<div class="col-sm-10">
				         	<div class="btn-group inline " id="idType">
							   	<button type="button" class="btn btn-default dropdown-text" value="" style="width: 126px;">
							   		请选择
							   	</button>
							   	<button type="button" class="btn btn-default dropdown-toggle">
							      	<span class="caret"></span>
							      	<span class="sr-only">切换下拉菜单</span>
							   	</button>
							   	<ul class="dropdown-menu" >
							   		
							   			<li><a value="170526162324601112" href="javascript:setShiftPlan('170526162324601112');">护理一组6月排班方案</a></li>
							   		
							   			<li><a value="170424134942749884" href="javascript:setShiftPlan('170424134942749884');">小组二排班方案</a></li>
							   		
							   			<li><a value="170424115027241712" href="javascript:setShiftPlan('170424115027241712');">小组一排班方案</a></li>
							   		
							   			<li><a value="170421151209250270" href="javascript:setShiftPlan('170421151209250270');">两班制</a></li>
							   		
							   			<li><a value="170421150012808183" href="javascript:setShiftPlan('170421150012808183');">三班倒</a></li>
							   		
							   			<li><a value="170421140407561241" href="javascript:setShiftPlan('170421140407561241');">asfa</a></li>
							   		
							   			<li><a value="170421140256608899" href="javascript:setShiftPlan('170421140256608899');">TESTaaa</a></li>
							   		
							   			<li><a value="170421111712314113" href="javascript:setShiftPlan('170421111712314113');">方案B</a></li>
							   		
							   	</ul>
							</div>
				      	</div>
				   </div>
				   <div class="form-group" >
				      <label for="" class="col-sm-2 control-label">排班日期：</label>
				      <div class="col-sm-10">
				        	<div class="inline relative mr0">
								<input type="text" class="form-control" style="width: 125px;"
									id="sTime" name="sTime" readonly="readonly" placeholder="开始日期">
								<span class="date_icon" style="left: 94px;"><i></i></span>
							</div>
							<div class="inline">至</div>
							<div class="inline relative mr0">
								<input type="text" class="form-control mr0" id="eTime"
									name="eTime" style="width: 125px;" readonly="readonly" placeholder="结束日期"/>
								<span class="date_icon" style="left: 94px;"><i></i></span>
							</div>
				      </div>
				   </div>
				   <div class="form-group" >
				      <label for="name1" class="col-sm-2 control-label">排班类型：</label>
				      <div class="col-sm-10" id="sex1_1">
					      	<div class="checkbox-inline">
					           
					               <input type="radio" name="shiftType"  onclick="cleanChosen()" checked="checked" value="1">组员排班
					            
					          </div>
					          <div class="checkbox-inline">
					            
					               <input type="radio" name="shiftType"  onclick="setupLabel()" value="2">小组排班
					            
					          </div>
			          </div>
				   </div>
				  
				   <div class="divider"></div>
				   <div class="panel-heading">
						<div class="">
							<a class="on" href="javascript:void(0);">选择小组：</a>
						</div>
						<div class="form-group inline">
							<div class=" mt20 mr15 ">
								<input type="text" name="keyWord" class="form-control input200" placeholder="请输入小组名称" value="" />
								<button type="button" class="btn btn_white20 " style="vertical-align: 0px; height: 30px; line-height: 25px; padding: 0px 9px; margin-right: 10px;" onclick="searchSub()">搜索</button>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 sitepop" style="position: static; width: 100%; margin: 0 0; height: auto; min-height: 0px; ">
							<div class="row " style="width: 70%" >
<!-- 								<div class="arrow-right"></div> -->
								<div class="pull-left col-xs-6 col-sm-6" id="nurseTb">








	<!-- <p class="text-left">未选小组</p> -->
	<table class="table mb0 div_bordered">
		<thead>
			<tr>
				<th width="100%" class="border_right">未选小组</th>
				<!-- <th width="50%" class="border_right">组长姓名</th> -->
			</tr>
		</thead>
	</table>
	<ul class="list-group choose-list" style="border-top: 0px;" id="unChosenSt">
		
		
			<li class="list-group-item" onclick="addSite(this)" value="14">
				
				<span>y组</span>
				
				<!-- <span></span> -->
			</li>
		
			<li class="list-group-item" onclick="addSite(this)" value="9">
				
				<span>C组</span>
				
				<!-- <span></span> -->
			</li>
		
			<li class="list-group-item" onclick="addSite(this)" value="8">
				
				<span>B组</span>
				
				<!-- <span></span> -->
			</li>
		
			<li class="list-group-item" onclick="addSite(this)" value="7">
				
				<span>A组</span>
				
				<!-- <span></span> -->
			</li>
		
	</ul>
</div>
								<div class="pull-left col-xs-6 col-sm-6 ">
									<!-- <p class="text-left">已选小组</p> -->
					                <table class="table mb0 div_bordered" >
					                	<thead>
					                		<tr>
						                		<tr>
													<th width="100%" class="border_right">已选小组</th>
												</tr>
						                	</tr>
					                	</thead>
					                </table>
									<ul class="list-group choosed-list" style="border-top: 0px;" id="chosenSt">
										
									</ul>
								</div>
							</div>
						</div>
					</div>
				</form>

				
				<div class="form-group mb0 text-center" style='clear:both'>
				   	<div style="height: 50px;"></div>
				   	  <div class="divider"></div>
				      <div class="text-align:left;" id="setjoyRide">
						<button type="button" class="btn btn_green" onclick="addShiftTableNext()" >下一步</button>
						<button type="button" class="btn btn_whites" id="member_exit">取消</button>
				      </div>
				   </div>
			</div>
		  </div>
		</div>
		<form action="../shiftTable/editShiftTable" method="get">
			
		</form>
		
		<script type="text/javascript" src="../js/jquery.ptTimeSelect.js" ></script><!--日历插件-->
		<script type="text/javascript" src="../js/pickday.js" ></script><!--日历插件配置和调用-->
		<script type="text/javascript" src="../js/jquery.validationEngine-zh_CN.js" ></script>
		<script type="text/javascript" src="$../js/jquery.validationEngine.js" ></script>
		<script type="text/javascript" src="../js/member/echo_member_base.js"></script>		
		<script type="text/javascript" src="../js/jquery.ganged.js"></script><!-- 省市区联动 s -->
		<script type="text/javascript" src="../js/pro.js"></script><!--  省市区的json数据 -->
		<script type="text/javascript" src="../js/ajaxFileUpload.full.js" ></script>
		<script type="text/javascript" src="../js/jquery.cookie.js" charset="utf-8"></script>
		<script type="text/javascript" src="../js/jquery.joyride-2.1.js"></script> <!--向导 -->
		<script type="text/javascript" src="../js/jquery.placeholder.js"  charset="utf-8"></script><!-- placehoder兼容 -->
		<!--[if lt IE 10]>
			<script type="text/javascript">
				$(function() {
				      $('input, textarea').placeholder({force: true});
				});
			</script>
		<![endif]-->
		<script type="text/javascript">
			/* var chosenTeam = JSON.parse('${chosenTeam}'); */
			function setShiftPlan(shiftPlanBaseId){
				$("#shiftPlanBaseId").val(shiftPlanBaseId);
				
			}
			var mydate= new Date();
			
			//---获取当前月最后一天start
			var yearT =mydate.getFullYear();
		    var monthT =mydate.getMonth()+1;
			
			var daysT ;
			//当月份为二月时，根据闰年还是非闰年判断天数
			if(monthT == 2){
				daysT= yearT % 4 == 0 ? 29 : 28;
			}else if(monthT == 1 || monthT == 3 || monthT == 5 || monthT == 7 || monthT == 8 || monthT == 10 || monthT == 12){
			   //月份为：1,3,5,7,8,10,12 时，为大月.则天数为31；
			  daysT= 31;
			}else{
			  //其他月份，天数为：30.
			  daysT= 30;
			}
		  //输出天数
	      monthT=monthT<10?0+monthT:monthT;
		  var dT=new Date(yearT+"-"+monthT+"-"+daysT);
			//---获取当前月最后一天end
			
			 
			  
			  
			  
			
			
	  	    var year = mydate.getFullYear(), month = mydate.getMonth();
	  	    year = month == 0 ? year - 1 : year;
	  	    month = month == 0 ? 11 : month ;
	  	    var prevFrist = new Date(year, month, 1);
	  	    
			var picker_S = new Pikaday({
	            field:document.getElementById("sTime"),
	            firstDay: 1,
	           // maxDate: new Date(),
	            format: 'YYYY/MM/dd',
	            defaultDate: prevFrist,
	            yearRange: [1900,2330],
	            onOpen:function(){
	            	//picker_S.setMaxDate(new Date(picker_E));
	            },
	            onSelect:function(){
		           	   var MaxDate= new Date(picker_S);
		            	var year =MaxDate.getFullYear(),
		            	    month =MaxDate.getMonth()+1;
      		        var days ;
						//当月份为二月时，根据闰年还是非闰年判断天数
						if(month == 2){
						        days= year % 4 == 0 ? 29 : 28;
						}else if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
						   //月份为：1,3,5,7,8,10,12 时，为大月.则天数为31；
						  days= 31;
						}else{
						  //其他月份，天数为：30.
						  days= 30;
						}
					  //输出天数
				      month=month<10?0+month:month;
					  var d=new Date(year+"-"+month+"-"+days);
		              picker_E.setMaxDate(d);
		              picker_E.setDate(d);
		           }
			
		    });
		    var picker_E = new Pikaday({
	            field:document.getElementById("eTime"),
	            firstDay: 1,
	            minDate: new Date('2016/01/01'),
	            format: 'YYYY/MM/dd',
	            defaultDate: dT,
	            yearRange: [1900,2330],
	            onOpen:function(){
	            	picker_E.setMinDate(new Date(picker_S))
	            }
		    });
		   
			// 选择小组
		    function addSite(obj){
				var shiftType=$("input[name='shiftType']:checked").val();
				
				var teamCrews = '';
				$(".choosed-list").find("li").each(function(i,el){
					teamCrews = teamCrews+','+$(el).attr("value");
				});
				if(shiftType==1&&teamCrews!=''){
					alert("组员排班：只能选择一个小组");
					return;
				}
				
				
		    	$(obj).remove();//移除被选择项
				var teamId= $(obj).attr("value");
		  		var name =$(obj).find("span:first-child").text();
		  		var $li=$("<li  class='list-group-item'></li>");
		  		$li.attr("value",teamId);
		  		$li.attr("data-name",name);
		  		var $span=$('<i class="badge cancel_icon pull-right" onclick="cancelSite(this)"></i>');
		  		var html='<span>'+name+'</span>';
		  		$li.html(html);
		  		$span.appendTo($li.find("span:last-child"));
		  		$(".choosed-list").prepend($li);
			}
			// 删除选中的小组
			function cancelSite(obj){
				var teamId= $(obj).parents("li").attr("value");
				var name =$(obj).parents("li").attr("data-name");
				var $li =$('<li class="list-group-item" onclick="addSite(this)"></li>');//添加取消项
		  		$li.attr("value",teamId);
				var html='<span>'+name+'</span>';
				$li.html(html);
				$(".choose-list").prepend($li)//添加取消项
				$(obj).parents("li").remove();
			}
			
			
			// 小组搜索搜索
			function searchSub() {
				var keyWord = $("input[name='keyWord']").val().trim();
				$.ajax({
					type : "post",
					dataType: "html",
					url : "../shiftTable/queryTeam",
					async: false,
					data:{
						keyWord : keyWord,
					},
					success : function(data) {
						$("#nurseTb").empty();
						$("#nurseTb").html(data);
						// 新增的，添加到右侧的在左侧搜索不再显示
						$("#unChosenSt").find("li").each(function(){
							var unChoNurseId = $(this).attr("value");
					  		var unChoNurseName =$(this).find("span:first-child").text();
							var containThisTeam = false;
							$("#chosenSt").find("li").each(function(){
								var choNurseId = $(this).attr("value");
								containThisTeam = (unChoNurseId == choNurseId);
								if(unChoNurseId == choNurseId){
									return false;
								}
							});
							if(containThisTeam && unChoNurseName.indexOf(keyWord) > -1){
								$(this).remove();//移除被选择项
							}
						});
						// 修改时，已从右侧删除的选项，追加符合搜索条件的
						/* $.each(chosenTeam, function(i, _val){
							var _thisId = _val.id+'';
							var _thisName = _val.name+'';
							var containThisTeam = false;
							$("#chosenSt").find("li").each(function(){
								var teamId = $(this).attr("value");
								containThisTeam = (_thisId == teamId);
								if(_thisId == teamId){
									return false;
								}
							});
							if(!containThisTeam && _thisName.indexOf(keyWord) > -1){
								var $li =$('<li class="list-group-item" onclick="addSite(this)"></li>');//添加取消项
								$li.attr("value",_thisId);
								var html='<span>'+_thisName+'</span>';
								$li.html(html);
								$(".choose-list").prepend($li)//添加取消项
							}
						}); */
					}
				});
			}
			
			function cleanChosen(){
				setupLabel();
				$("#chosenSt").empty();
				searchSub();
			}
			
			function goNext(){
				var teamIds = '';
				var teamNames = '';
				$(".choosed-list").find("li").each(function(i,el){
					teamIds = teamIds+','+$(el).attr("value");
					teamNames = teamNames+','+$(el).attr("data-name");
				});
				if(teamCrews == ''){
					alert("请选择小组");
					return;
				}
				teamIds = teamIds.substr(1, teamIds.length-1);
				teamNames = teamNames.substr(1, teamNames.length-1);
				$("#teamIds").val(teamIds);
				$("#teamNames").val(teamNames);
			}
			
			function addShiftTableNext(){
			//排班表链接,写action重写
				window.location.href="sort_manager_table_informations.jsp";
			//----------------------------------------
				$("#addShiftTableForm").validationEngine({promptPosition: "inline"});
				var tableName=$("#tableName").val();
				var shiftPlanBaseId=$("#shiftPlanBaseId").val();
				var teamIds = '';
				var teamNames = '';
				$(".choosed-list").find("li").each(function(i,el){
					teamIds = teamIds+','+$(el).attr("value");
					teamNames = teamNames+','+$(el).attr("data-name");
				});
				
				teamIds = teamIds.substr(1, teamIds.length-1);
				teamNames = teamNames.substr(1, teamNames.length-1);
				var startDate=$("#sTime").val();
				var endDate=$("#eTime").val();
				var regx=/^[^<^>]*$/;
				if(!regx.test(tableName)){
					return;
				}
				if(tableName.length>32){
					return;
				}
				
				if(teamIds == ''){
					alert("请选择小组");
					return;
				}
				if(tableName==''){
					alert("请填写排班表名！");
					return;
				}
				if(shiftPlanBaseId==''){
					alert("请选择排班方案！");
					return;
				}
				
				
				
				var shiftType=$("input[name='shiftType']:checked").val();
				showPopC("dialog_1");
				$.post("../shiftTable/addShiftTableNext",{
					"tableName":tableName,
					"shiftPlanBaseId":shiftPlanBaseId,
					"teamIds":teamIds,
					"teamNames":teamNames,
					"startDate":startDate,
					"endDate":endDate,
					"shiftType":shiftType
					},function(obj){
						if(obj.result=='SUCC'){
							var shiftTableBaseId=obj.shiftTableBaseId;
							var startDateStr=obj.startDateStr;
							var endDateStr=obj.endDateStr;
							//注意：此处只是注释掉而已
							
							//window.location.href="../shiftTable/editShiftTable?startDateStr="+startDateStr+"&endDateStr="+endDateStr+"&shiftTableBaseId="+shiftTableBaseId+"&tableName="+tableName+"&shiftType="+shiftType+"&updateMark=no";
						}else{
							hidePopC();
							alert(obj.msg);
						}
						
						},"json");
				
			}
		    
			$("#addShiftTableForm").validationEngine({promptPosition: "inline"});
		</script>
	</body>
	
	
</html>