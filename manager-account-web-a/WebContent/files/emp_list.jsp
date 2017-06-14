<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Demo</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../css/common.css" />
		<link rel="stylesheet" href="../css/welcome.css" />
		<link rel="stylesheet" type="text/css" href="../css/jk_zy_baogao.css"/>
		<style type="text/css">
			td span{white-space: nowrap;}
		</style>
	</head>
	<body>
		<body>
		<!--遮罩层-->
		<div class="zhy_zhezhao_pop " style="height: 800px; display: none;"></div>
		<!--遮罩层 end-->
		<div class="zhy_popa zhy_popa_cancel " style="width: 450px;margin-left: -225px;display: none;">
			<p class="color66">提示<span class="pull-right close_icon" onclick="hidePopC()"></span></p>
		  	<div class="pop_content">
			    <p>确定要删除会员【张三】的数据吗?</p>
			  	<div class="operate_btn pull-right"> 
			  	    <button type="button" class="btn cancle_yes">确定</button>
			        <button type="button" class="btn cancle_btn" onclick="hidePopC()">取消</button>
			  	</div>
		  	</div>
		</div>
		<div class="main_content member_list">
			<div class="col-xs-12 col-sm-12 div_bordered"> 
		  		<div class="panel panel-default">
			   		<div class="panel-heading">
			   			<div class="jkbg_title_boxa">
			   				<a class=" btn_blueg2 font14 pull-right" href="emp_add.jsp">+新增</a>
							<h4>员工管理</h4>
						</div>
				    	<form class="form-inline pl20" role="form">
							<div class="form-group">小组筛选：
								<div class="btn-group inline ">
								   <button type="button" class="btn btn-default dropdown-text" value="0"  style="width: 106px;">全部</button>
								   <button type="button" class="btn btn-default dropdown-toggle">
									  <span class="caret"></span>
									  <span class="sr-only">切换下拉菜单</span>
								   </button>
								   <ul class="dropdown-menu" >
									  <li><a value="-1" href="javascript:void(0);">全部</a></li>
									  <li><a value="1" href="javascript:void(0);">A组</a></li>
									  <li><a value="2" href="javascript:void(0);">B组</a></li>
								   </ul>
								</div>
							</div>
							
						    <div class="form-group">
						   	   <div class="search fl">
								<input placeholder="请输入姓名/身份证号/手机号码" id="keyWord" type="text">
								<input style="display:none;">
							   </div>
						    </div>
							<div class="form-group">
								<button type="button" class="btn btn_white20" id="member_search">搜索</button>
							</div>
						
						</form>
		      		</div>
					<table class="table table-bordered table_fixed table-multicols table-hover "> 
						<thead> 
						  <tr> 
							<th width="8%" class="border_right">姓名</th> 					
							<th width="16%" class="border_right">身份证号</th>
							<th width="11%" class="border_right">手机号码</th>
							<th width="12%" class="border_right">小组</th>
							<th width="12%">操作</th> 
						   </tr> 
						</thead> 
						<tbody>
                           
                        <c:forEach items="${allEmployees}" var="emp">
                           <tr> 
							<td>${emp.name}</td> 
							<td>${emp.id_card}</td> 
							<td>${emp.phone}</td>
							<td>${emp.team_id} </td> 
							<td>
								<span><a href="emp_informations.jsp" class="colorblue">详情</a></span>
			
								<span><a href="javascript:showPopC('zhy_popa_cancel');" class="colorred">删除</a></span>
							</td>
						  </tr>
						</c:forEach>
						 
	                    </tbody> 
					</table> 
	        	</div>
		        <div class="row text-center">
				    <ul id="member_pagination" class="pagination "><div class="pagination"><span class="current prev">上一页</span><span class="current">1</span><a href="javascript:InitTable(1)">2</a><a class="next" href="javascript:InitTable(1)">下一页</a><span class="allentries">共17条记录</span></div></ul>
			    </div>
	   		</div>
	  	</div>  

</body>
<script src="../js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../js/common.js"> </script>
<script type="text/javascript" src="../js/jquery.pagination.js"></script>
</html>
