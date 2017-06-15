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
<link rel="stylesheet" type="text/css" href="../css/jk_zy_baogao.css" />
<style type="text/css">
td span {
	white-space: nowrap;
}
</style>
</head>
<body>
	<body>
		
		<div class="main_content member_list">
			<div class="col-xs-12 col-sm-12 div_bordered">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="jkbg_title_boxa">
							<a class=" btn_blueg2 font14 pull-right" href="sort_plan_add.jsp">+新增</a>
							<h4>排班方案管理</h4>
						</div>
						<form class="form-inline pl20" role="form">

						</form>
					</div>
					<jsp:include page="/files/front/split_plugin_search_bar.jsp"/>
					<table
						class="table table-bordered table_fixed table-multicols table-hover ">
						<thead>

							<tr>
								<th width="8%" class="border_right">排班方案名称</th>
								<th width="16%" class="border_right">描述</th>
								<th width="11%" class="border_right">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${allShiftPlanBases}" var="shiftPlanBase">
								<tr>
									<td>${shiftPlanBase.plan_name}</td>
									<td>${shiftPlanBase.plan_description}</td>
									<td><span><a href="sort_plan_information.jsp"
											class="colorblue">详情</a></span> <span><a
											href="javascript:showPopC('zhy_popa_cancel');"
											class="colorred">删除</a></span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<jsp:include page="/files/front/split_plugin_page_bar.jsp"/>
				</div>
				
			</div>
		</div>

	</body>
	<script src="../js/jquery-1.8.3.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript" src="../js/common.js">
		
	</script>
	<script type="text/javascript" src="../js/jquery.pagination.js"></script>
</html>
