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
				<h4>小组增加</h4>
				<div class="divider"></div>
		  </div>
		    <div class="panel-body ">
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
							<td align="right" width="120">小组名称：</td>
							<td align="left" width="40%">
								<input type="text" class="form-control inline input150"  placeholder="请选择会员"/>
								<!-- <button type="button" class="btn btn_save2" onclick="showPopC('mem_choose')" style="width: auto;padding: 0px 5px;">选择</button> -->
							</td>
							<td align="right" width="160"></td>
							<td align="right" width="60%" ></td>
						</tr>
					</table>
				</div>
				<div class="form-group add_block ">
			   	  <div class="divider"></div>
			      <div class="col-sm-12 text-center">
			         <button type="button" class="btn btn_green" onclick="goHref()">增加</button>
			         <button type="button" class="btn btn_whites" >取消</button>
			      </div>
			    </div>
			</div>
		</div>
	</div>
	</body>
	<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
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
	var mydate=new Date();
	var picker = new Pikaday(
          {
            field:document.getElementById("rudate"),
            firstDay: 1,
            minDate: new Date('2016/01/01'),
            maxDate: new Date(),
            format: 'YYYY/MM/dd',
            defaultDate:mydate,
            yearRange: [1900,2330]
    });
    
    var picker_S = new Pikaday(
          {
            field:document.getElementById("startDate"),
            firstDay: 1,
            minDate: new Date('2016/01/01'),
            maxDate: new Date(),
            format: 'YYYY/MM/dd',
            defaultDate:mydate,
            yearRange: [1900,2330]
    });
    var picker_E = new Pikaday(
          {
            field:document.getElementById("endDate"),
            firstDay: 1,
            minDate: new Date('2016/01/01'),
            maxDate: new Date(),
            format: 'YYYY/MM/dd',
            defaultDate:mydate,
            yearRange: [1900,2330]
    });
	</script>
</html>