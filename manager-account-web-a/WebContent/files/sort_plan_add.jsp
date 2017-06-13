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
<div class="zhy_zhezhao_pop " style="height:800px;" ></div>
<div class="main_content add_block" >
		  <div class='div_bordered'>
		  	<div class="panel panel-default choose_block">
		  		<a href="sort_plan_list.jsp" class="colorbg font14 pull-right mr15">&lt;&lt;返回列表</a>
		  		<div class="panel-heading color333">新增排班方案</div>
		  		<div class="divider">
		  		</div>
				<form class="form-horizontal old_block" action="../shiftPlan/addShiftPlan" id="addShiftPlanForm" role="form" data-ajax="true" data-ajax-success="shiftPlanAddOnSuccess" method="post">
					<div id="hiddenDiv"></div>
				   <div class="form-group" >
				      <label for="name1" class="col-sm-2 control-label">名称：</label>
				      <div class="col-sm-10">
				         <input type="text" class="form-control input200 validate[required,custom[illegallyStr],maxSize[32]]" id="planName" name="planName" placeholder="请输入排班方案名称" value=""/>
				         <em class="colorred">*</em>
				      </div>
				   </div>
				   <div class="form-group" >
				      <label for="name1" class="col-sm-2 control-label">说明：</label>
				      <div class="col-sm-10">
				        <textarea onkeyup="textareaLeftWords(this)"  style="width:30%"class="form-control validate[custom[illegallyStr],maxSize[160]]" rows="2" name="planDescription"></textarea>
						<em id="tLeftWord"  left-word="160" >还可以输入<span class="color333">160</span>字</em>
				      </div>
				   </div>
				   <div class="form-group" >
				      <label for="name1" class="col-sm-2 control-label">参考设置：</label>
				      <div class="col-sm-10">
				       		<button type="button" class="btn btn_white20" onclick="getDemo1()" id="demo1">三班倒</button>&nbsp;&nbsp;
				       		<button type="button" class="btn btn_white20" onclick="getDemo2()" id="demo2">两班倒</button>
				      </div>
				   </div>
				   
				  
				   	 <label for="name1" class="col-sm-2 control-label">排班方案：</label>
				   	 <div class="col-sm-5">
				   	 <div class="pull-right text-right mr15 so-awesome2">
						 <button type="button" class="btn_white site_add" onclick="addItem()" style="margin-top: 0px;"><i></i>继续添加</button>
					</div>
				   	
				   	 	<table class="table table-bordered  table-hover table_fixed">
				   	 			<thead>
				   	 				<tr>
										<th width="15%">班次名称</th>
										<th width="15%">开始时间</th>
										<th width="15%">结束时间</th>
										<th width="15%">连续天数</th>
										<th width="25%">执行顺序</th>
										<th width="15%">操作   </th>
									</tr>
				   	 			</thead>
								<tbody id="myTbody">
								<tr class="shift_tr" id="1_tr">
										<td>
											休<input type="hidden"  name="detailName" value="休">
										</td>
										<td><input type="hidden"  name="startTime" value=" "></td>
										<td><input type="hidden"  name="endTime" value=" "></td>
										<td>
											<input type="text" class="form-control input100 " name="days" onblur="validateDays(this.value,this)" value="1" placeholder="连续天数" />
										</td>
										<td>
											<span><a href="javascript:goUp('1')" class="colorblue">上移</a></span>
											<span><a href="javascript:goDown('1')" class="colorblue">下移</a></span>
											<input type="hidden" id="1_input" class="form-control input100" name="excOrder" value="1"  />
										</td>
										<td>
										</td>
								</tr>
								</tbody>
								
							</table>
				   	 </div>
				   
				</form>
				
				<div class="form-group mb0 text-center" style='clear:both'>
				   	<div style="height: 50px;"></div>
				   	  <div class="divider"></div>
				      <div class="text-align:left;" id="setjoyRide">
						<button type="button" class="btn btn_green" onclick="saveIt()">保存</button>
						<button type="button" class="btn btn_whites" onclick="cancelIt()" id="member_exit">取消</button>
				      </div>
				   </div>
			</div>
		  </div>
		</div>
	</body>
	<script type="text/javascript" src="../js/common.js" ></script>
	<script type="text/javascript" src="../js/jquery.ptTimeSelect.js" ></script><!--日历插件-->
	 <!-- 省市区联动 s -->  
	<script src="../js/jquery.ganged.select.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/pro.js"></script><!--  省市区的json数据 -->
	<!-- 省市区联动 e -->
	<script type="text/javascript">
	
		/****
		***
		省市区联动 调用
		*/
	    $('#jsAddress_0').ganged({'data': provinceList, 'width': 133, 'height': 32});
		$('.selcTime').datetimepicker({
				datepicker:false,
				format:'H:i',
				step:10
			});
			
			
			function validateName(obj,o){
				if(obj.length>2){
					zhyAlert("最多2个字符");
					$(o).val(obj.substring(0,2));
				}
				var regx=/^[^<^>]*$/;
				if(!regx.test(obj)){
					zhyAlert("不允许非法字符");
					$(o).val("");
				}
				
			}
			function validateDays(obj,o){
				var numRegx=/^[1-9]+$/;
				if(!numRegx.test(obj)){
					zhyAlert("只允许数字");
					$(o).val(1);
				}
				if(obj==''){
					zhyAlert("不允许空");
					$(o).val(1);
				}
				
				if(obj>7){
					zhyAlert("不能超过7");
					$(o).val(1);
				}
			}
			var preExOrder;
			function setPreExOrder(pre){
				preExOrder=pre;
			}
			function validateExcOrder(obj,o){
				var numRegx=/^[1-9]+$/;
				if(!numRegx.test(obj)){
					zhyAlert("只允许数字");
					$(o).val("");
					return;
				}
			
				
				var ordeQty=$("input[name='excOrder']").length;
				if(obj>ordeQty){
					zhyAlert("不能超过班次数");
					$(o).val(preExOrder);
					return;
				}
				
			}
			function validateTime(obj,o){
				if(obj==''){
					zhyAlert("不允许空");
					$(o).val("00:00");
					return;
				}
				
			}
			
			//删除
		  	function removeItem(obj,id){
		  		var trLength=$(".shift_tr").length;
		  		var inputVal=$("#"+id+"_input").val();
		  		$(obj).parent().parent().remove();//删除
		  		$(".shift_tr").each(function(index,e){
		  			var myIndex=index+1;
		  			$(this).find("[name='excOrder']").val(myIndex);
		  		});
		  	}
			//增加
			function addItem(){
				var trLength=$(".shift_tr").length;
				if(trLength>7){
					zhyAlert("不能超过7个班次");
					return ;
				}
				var newInt=parseInt(trLength+1);
				var contentX='<tr class="shift_tr" id="'+newInt+'_tr">'
					+'<td><input type="text" class="form-control input100" name="detailName" onblur="validateName(this.value,this)" placeholder="班次名称" /></td>'
					+'<td><input type="text" class="form-control input100 selcTime" name="startTime" value="00:00" onblur="validateTime(this.value,this)" placeholder="开始时间"/></td>'
					+'<td><input type="text" class="form-control input100 selcTime" name="endTime" value="00:00" onblur="validateTime(this.value,this)" placeholder="结束时间" /></td>'
					+'<td><input type="text" class="form-control input100 " name="days" value="1" onblur="validateDays(this.value,this)" placeholder="连续天数" /></td>'
					+'<td>'
					+'<span><a href="javascript:goUp(\''+newInt+'\')" class="colorblue">上移</a></span>'
					+'<span><a href="javascript:goDown(\''+newInt+'\')" class="colorblue">下移</a></span>'
					+'<input type="hidden" class="form-control input100" id="'+newInt+'_input" name="excOrder" value="'+newInt+'" /></td>'
					+'<td><i class="delete_icon" style="margin-left:5px;" onclick="removeItem(this,'+newInt+')"></i></td>'
				+'</tr>'
				$("#myTbody").append(contentX);
				
				$('.selcTime').datetimepicker({
					datepicker:false,
					format:'H:i',
					step:10
				});
			}
			//下移
			function goDown(id){
				var trLength=$(".shift_tr").length;
				var inputVal=$("#"+id+"_input").val();
				if(inputVal==trLength){
					return;
				}
				$("#"+id+"_input").val(parseInt(inputVal)+1);
				
				var nextId=$("#"+id+"_tr").next().attr("id");
				var nextInt=nextId.split("_")[0];
				
				var nextInputVal=$("#"+nextInt+"_input").val();
				$("#"+nextInt+"_input").val(parseInt(nextInputVal)-1);
				$("#"+id+"_tr").insertAfter($("#"+id+"_tr").next());
			}
			//上移/
			function goUp(id){
				var inputVal=$("#"+id+"_input").val();
				if(inputVal==1){
					return;
				}
				$("#"+id+"_input").val(parseInt(inputVal)-1);
				
				var prevId=$("#"+id+"_tr").prev().attr("id");
				var prevInt=prevId.split("_")[0];
				
				var prevInputVal=$("#"+prevInt+"_input").val();
				$("#"+prevInt+"_input").val(parseInt(prevInputVal)+1);
				$("#"+id+"_tr").insertBefore($("#"+id+"_tr").prev());
			}
			function shiftPlanAddOnSuccess(obj){
				if(obj.result=='SUCC'){
					window.location.href="../shiftPlan/shiftPlanIndex";
				}else{
					zhyAlert(obj.msg);
				}
			}
			function saveIt(){
				$(".shift_tr").each(function(index,e){
		  			var myIndex=index+1;
		  			var detailName=$(this).find("[name='detailName']").val();
		  			if(detailName.trim()==''){
		  				zhyAlert("班次名称不能为空");
		  				return ;
		  			}
		  		});
				$("#addShiftPlanForm").submit();
			}
			function cancelIt(){
				window.location.href="../shiftPlan/shiftPlanIndex";
			}
			
			
			//加载三班倒模板
			function getDemo1(){
				$("#myTbody").empty();
				var demo1='<tr class="shift_tr" id="1_tr">'
								+'<td><input type="text" class="form-control input100" name="detailName" onblur="validateName(this.value,this)" value="中" placeholder="班次名称"></td>'
								+'<td><input type="text" class="form-control input100 selcTime" name="startTime" value="8:00" onblur="validateTime(this.value,this)" placeholder="开始时间"></td>'
								+'<td><input type="text" class="form-control input100 selcTime" name="endTime" value="16:00" onblur="validateTime(this.value,this)" placeholder="结束时间"></td>'
								+'<td><input type="text" class="form-control input100 " name="days" onblur="validateDays(this.value,this)" value="2" placeholder="连续天数"></td>'
								+'<td>'
									+'<span><a href="javascript:goUp(\'1\')" class="colorblue">上移</a></span>'
									+'<span><a href="javascript:goDown(\'1\')" class="colorblue">下移</a></span>'
									+'<input type="hidden" id="1_input" class="form-control input100" name="excOrder" value="1">'
								+'</td>'
								+'<td><i class="delete_icon" style="margin-left:5px;" onclick="removeItem(this,\'1\')"></i></td>'
							+'</tr>'
							+'<tr class="shift_tr" id="2_tr">'
								+'<td><input type="text" class="form-control input100" name="detailName" onblur="validateName(this.value,this)" value="早" placeholder="班次名称"></td>'
								+'<td><input type="text" class="form-control input100 selcTime" name="startTime" value="0:00" onblur="validateTime(this.value,this)" placeholder="开始时间"></td>'
								+'<td><input type="text" class="form-control input100 selcTime" name="endTime" value="8:00" onblur="validateTime(this.value,this)" placeholder="结束时间"></td>'
								+'<td><input type="text" class="form-control input100 " name="days" onblur="validateDays(this.value,this)" value="2" placeholder="连续天数"></td>'
								+'<td>'
									+'<span><a href="javascript:goUp(\'2\')" class="colorblue">上移</a></span>'
									+'<span><a href="javascript:goDown(\'2\')" class="colorblue">下移</a></span>'
									+'<input type="hidden" id="2_input" class="form-control input100" name="excOrder" value="2">'
								+'</td>'
								+'<td><i class="delete_icon" style="margin-left:5px;" onclick="removeItem(this,\'2\')"></i></td>'
							+'</tr>'
							+'<tr class="shift_tr" id="3_tr">'
								+'<td><input type="text" class="form-control input100" name="detailName" onblur="validateName(this.value,this)" value="晚" placeholder="班次名称"></td>'
								+'<td><input type="text" class="form-control input100 selcTime" name="startTime" value="16:00" onblur="validateTime(this.value,this)" placeholder="开始时间"></td>'
								+'<td><input type="text" class="form-control input100 selcTime" name="endTime" value="0:00" onblur="validateTime(this.value,this)" placeholder="结束时间"></td>'
								+'<td><input type="text" class="form-control input100 " name="days" onblur="validateDays(this.value,this)" value="2" placeholder="连续天数"></td>'
								+'<td>'
									+'<span><a href="javascript:goUp(\'3\')" class="colorblue">上移</a></span>'
									+'<span><a href="javascript:goDown(\'3\')" class="colorblue">下移</a></span>'
									+'<input type="hidden" id="3_input" class="form-control input100" name="excOrder" value="3">'
								+'</td>'
								+'<td><i class="delete_icon" style="margin-left:5px;" onclick="removeItem(this,\'3\')"></i></td>'
							+'</tr>'
							+'<tr class="shift_tr" id="4_tr">'
								+'<td>休<input type="hidden" name="detailName" value="休"></td>'
								+'<td><input type="hidden" name="startTime" value=" "></td>'
								+'<td><input type="hidden" name="endTime" value=" "></td>'
								+'<td><input type="text" class="form-control input100 " name="days" onblur="validateDays(this.value,this)" value="2" placeholder="连续天数"></td>'
								+'<td>'
									+'<span><a href="javascript:goUp(\'4\')" class="colorblue">上移</a></span>'
									+'<span><a href="javascript:goDown(\'4\')" class="colorblue">下移</a></span>'
									+'<input type="hidden" id="4_input" class="form-control input100" name="excOrder" value="4" placeholder="执行顺序">'
								+'</td>'
								+'<td></td>'
							+'</tr>';
				$("#myTbody").append(demo1);
			}
			
			//加载两班倒模板
			function getDemo2(){
					$("#myTbody").empty();
					var demo2='<tr class="shift_tr" id="1_tr">'
									+'<td><input type="text" class="form-control input100" name="detailName" onblur="validateName(this.value,this)" value="早" placeholder="班次名称"></td>'
									+'<td><input type="text" class="form-control input100 selcTime" name="startTime" value="08:00" onblur="validateTime(this.value,this)" placeholder="开始时间"></td>'
									+'<td><input type="text" class="form-control input100 selcTime" name="endTime" value="20:00" onblur="validateTime(this.value,this)" placeholder="结束时间"></td>'
									+'<td><input type="text" class="form-control input100 " name="days" onblur="validateDays(this.value,this)" value="2" placeholder="连续天数"></td>'
									+'<td>'
										+'<span><a href="javascript:goUp(\'1\')" class="colorblue">上移</a></span>'
										+'<span><a href="javascript:goDown(\'1\')" class="colorblue">下移</a></span>'
										+'<input type="hidden" id="1_input" class="form-control input100" name="excOrder" value="1">'
									+'</td>'
									+'<td><i class="delete_icon" style="margin-left:5px;" onclick="removeItem(this,\'1\')"></i></td>'
								+'</tr>'
							+'<tr class="shift_tr" id="2_tr">'
									+'<td><input type="text" class="form-control input100" name="detailName" onblur="validateName(this.value,this)" value="晚" placeholder="班次名称"></td>'
									+'<td><input type="text" class="form-control input100 selcTime" name="startTime" value="20:00" onblur="validateTime(this.value,this)" placeholder="开始时间"></td>'
									+'<td><input type="text" class="form-control input100 selcTime" name="endTime" value="08:00" onblur="validateTime(this.value,this)" placeholder="结束时间"></td>'
									+'<td><input type="text" class="form-control input100 " name="days" onblur="validateDays(this.value,this)" value="2" placeholder="连续天数"></td>'
									+'<td>'
										+'<span><a href="javascript:goUp(\'2\')" class="colorblue">上移</a></span>'
										+'<span><a href="javascript:goDown(\'2\')" class="colorblue">下移</a></span>'
										+'<input type="hidden" id="2_input" class="form-control input100" name="excOrder" value="2">'
									+'</td>'
									+'<td><i class="delete_icon" style="margin-left:5px;" onclick="removeItem(this,\'2\')"></i></td>'
							+'</tr>'
							+'<tr class="shift_tr" id="3_tr">'
									+'<td>休<input type="hidden" name="detailName" value="休"></td>'
									+'<td> <input type="hidden" name="startTime" value=" "></td>'
									+'<td> <input type="hidden" name="endTime" value=" "></td>'
									+'<td><input type="text" class="form-control input100 " name="days" onblur="validateDays(this.value,this)" value="2" placeholder="连续天数"></td>'
									+'<td>'
										+'<span><a href="javascript:goUp(\'3\')" class="colorblue">上移</a></span>'
										+'<span><a href="javascript:goDown(\'3\')" class="colorblue">下移</a></span>'
										+'<input type="hidden" id="3_input" class="form-control input100" name="excOrder" value="3" placeholder="执行顺序">'
									+'</td>'
									+'<td></td>'
							+'</tr>'
				$("#myTbody").append(demo2);
			}
	</script>
</html>