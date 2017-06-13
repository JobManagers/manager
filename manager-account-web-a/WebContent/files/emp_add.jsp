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
</head>
<body>
  
	<div class="main_content create_site" >
		<div class="col-xs-12 col-sm-12 div_bordered ">
		   <div class="jkbg_title_boxa" style="border: 0px">
		   	    <a href="javascript:history.go(-1);" class="btn_blue pull-right mr15" >&lt;&lt;返回</a>
				<h4>增加</h4>
				<div class="divider"></div>
		  </div>
		    <div class="panel-body ">
				<div class="well_head mt0">
					<div class="line"></div>
					<span class="pull-left" href="javascript:void(0);"><b class="color66">员工增加</b></span>
				</div>
				<div class="panel-body">
					<table class="zhy_book_table" >
					<!-- -------------此处不用,只是好看--------------------------------------------- -->
							<tr>
								<!-- <td align="right" width="120">员工头像：</td>
									<td align="left" width="40%" height="40%">
										<img src="../img/v_2.jpg"  />
									</td>
								</td> -->
								<div class="form-group" id="">
								
								<div class="col-md-5" hidden="hidden">
									<!-- 定义表单输入组件 -->
									<input type="file" id="" name="pic" class="form-control"
										placeholder="请选择雇员照片"> 
										<img src="../img/v_2.jpg"  />
								</div>
								<!-- 定义表单错误提示显示元素 -->
								<div class="col-md-4" id=""></div>
							</div>
							<!-- ---------------------------------------------------------- -->
							</tr> 
						<tr>
							<td align="right" width="120">员工姓名：</td>
							<td align="left" width="40%">
								<input type="text" class="form-control inline input150"  placeholder="请选择员工姓名"/>
								<!-- <button type="button" class="btn btn_save2" onclick="showPopC('mem_choose')" style="width: auto;padding: 0px 5px;">选择</button> -->
							</td>
							<td align="right" width="160"></td>
							<td align="right" width="60%" ></td>
						</tr>
						<tr>
						    <td align="right" >性别：</td>
							<td align="left">
									<label  class="label_radio r_on"><input type="radio" name="sex" checked="checked" onclick="setupLabel()"/>男</label>&nbsp;&nbsp;&nbsp;&nbsp;
									<label  class="label_radio"><input type="radio" name="sex" onclick="setupLabel()"/>女</label>
							</td>
							
							
						</tr>
						
						<!-----------------------------------  -->
						<tr>
							<td align="right">照片：</td>
							<td align="left">
							<div class="form-group" id="picDiv">
								
								<div class="col-md-5">
									<!-- 定义表单输入组件 -->
									<input type="file" id="pic" name="pic" class="form-control"
										placeholder="请选择雇员照片">
								</div>
								<!-- 定义表单错误提示显示元素 -->
								<div class="col-md-4" id="picMsg"></div>
							</div>
							</td> 
						</tr>
						<!-- ------------------------------------------ -->
						<tr>
							<!-- 
							<td align="right">紧急联系人：</td>
							<td align="left">
								<input type="text" class="form-control inline input150" placeholder="请输入紧急联系人" value="李彤"/>
							</td> -->
							<td align="right">身份证号：</td>
							<td align="left">
								<input type="text" class="form-control inline input200"  placeholder="请输入身份证号"/>
							</td>
						</tr>
						<tr>
							<td align="right">手机号：</td>
							<td align="left">
								<input type="text" class="form-control inline input150" placeholder="请输入手机号" />
							</td>
						</tr>
						<tr>
							<td align="right" width="120">email：</td>
							<td align="left" width="40%">
								<input type="text" class="form-control inline input150"  placeholder="请输入邮箱"/>
								<!-- <button type="button" class="btn btn_save2" onclick="showPopC('mem_choose')" style="width: auto;padding: 0px 5px;">选择</button> -->
							</td>
							<td align="right" width="160"></td>
							<td align="right" width="60%" ></td>
						</tr>
						<tr>
							<td align="right">出生日期：</td>
							<td align="left">
								<!-- <input type="text" class="form-control inline input150" placeholder="出生日期" /> -->
								<div class="inline relative mr0">
									<input type="text" class="form-control" style="width: 125px;"
										id="sTime" name="sTime" readonly="readonly" placeholder="开始日期">
									<span class="date_icon" style="left: 94px;"><i></i></span>
								</div>
							</td> 
						</tr>
						<tr>
							<td align="right">入职日期：</td>
							 <td align="left">
								<!-- <input type="text" class="form-control inline input150" placeholder="入职日期" /> -->
								
								<div class="inline relative mr0">
									<input type="text" class="form-control mr0" id="eTime"
										name="eTime" style="width: 125px;" readonly="readonly" placeholder="结束日期"/>
									<span class="date_icon" style="left: 94px;"><i></i></span>
								</div>
							</td> 
							
						
						</tr>
						
						<!-- ---------------------------------- -->
						
						<!--  -->
						<tr>
							<td align="right">文化程度：</td>
							<td align="left">
								<div class="btn-group inline ">
								   <button type="button" class="btn btn-default dropdown-text" value="0"  style="width: 106px;">请选择</button>
								   <button type="button" class="btn btn-default dropdown-toggle">
									  <span class="caret"></span>
									 <!--  <span class="sr-only">切换下拉菜单</span> -->
								   </button>
								   <ul class="dropdown-menu" >
									<!--   <li><a value="-1" href="javascript:void(0);">请选择</a></li> -->
									  <li><a value="1" href="javascript:void(0);">大学</a></li>
									  <li><a value="2" href="javascript:void(0);">研究生</a></li>
								   </ul>
							</div>
							</td>
						</tr>
						
						
						<tr>
							<td align="right">选择小组：</td>
							<td align="left">
								<div class="btn-group inline ">
								   <button type="button" class="btn btn-default dropdown-text" value="0"  style="width: 106px;">请选择</button>
								   <button type="button" class="btn btn-default dropdown-toggle">
									  <span class="caret"></span>
									 <!--  <span class="sr-only">切换下拉菜单</span> -->
								   </button>
								   <ul class="dropdown-menu" >
									  <!-- <li><a value="-1" href="javascript:void(0);">请选择</a></li> -->
									  <li><a value="1" href="javascript:void(0);">A组</a></li>
									  <li><a value="2" href="javascript:void(0);">B组</a></li>
								   </ul>
							</div>
							</td>
						</tr> 
						
						
						<tr>
						    <td align="right" >设为组长：</td>
							<td align="left">
									<label  class="label_radio r_on"><input type="radio" name="sex" checked="checked" onclick="setupLabel()"/>否</label>&nbsp;&nbsp;&nbsp;&nbsp;
									<label  class="label_radio"><input type="radio" name="sex" onclick="setupLabel()"/>是</label>
							</td>
								
							
						</tr>
						
						
						<tr>
						<!-- 	<td align="right">居住地址：</td>
							<td align="left" colspan="3">
								<div id="jsAddress_0"  class="selectbox_l">
									<input type="hidden" class="province" value=""/>
									<input type="hidden" class="city" value="110100"/>
									<input type="hidden" class="area" value="110108"/>
									<div name="province" type="selectbox"  class="btn-group inline "></div>
									<div name="city" type="selectbox"  class="btn-group inline"></div>
									<div name="area" type="selectbox"  class="btn-group inline"></div>
								</div>
								<div class=" inline">
									<input type="text" class="form-control input300" id="" placeholder="详细地址">
								</div>
							</td> -->
						</tr>
					</table>
				</div>
				
				
				<div class="form-group add_block ">
			   	  <div class="divider"></div>
			      <div class="col-sm-12 text-center">
			         <button type="button" class="btn btn_green" onclick="goHref()">保存</button>
			         <button type="button" class="btn btn_whites" >取消</button>
			      </div>
			    </div>
			</div>
		</div>
	</div>
	</body>
	 <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../js/common.js" ></script>
	<script type="text/javascript" src="../js/jquery.ptTimeSelect.js" ></script>
	<script src="../js/jquery.ganged.select.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/pro.js"></script> 
	<script type="text/javascript"> 
			
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
			
		</script>
</html>