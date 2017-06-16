<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- <script type="text/javascript" src="js/plugins/split_page.js"></script> -->
<script type="text/javascript" src="js/files/emp_list.js"></script>
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
<%!
	public static final String EMP_ADDPRE_URL = "emp_addpre.action";
%>
<body>
	<body>

		<div class="main_content member_list">
			<div class="col-xs-12 col-sm-12 div_bordered">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="jkbg_title_boxa">
							<a class=" btn_blueg2 font14 pull-right" href="<%=EMP_ADDPRE_URL%>">+新增</a>
							<h4>员工管理</h4>
						</div>
					</div>
					<jsp:include page="/files/plugins/split_plugin_search_bar.jsp" />
					<table
						class="table table-bordered table_fixed table-multicols table-hover ">
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
									<td>${allTeams[emp.team_id]}</td>
									<td><span><a href="emp_informations.jsp"
											class="colorblue">详情</a></span> <span><a
											href="javascript:showPopC('zhy_popa_cancel');"
											class="colorred">删除</a></span></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<jsp:include page="/files/plugins/split_plugin_page_bar.jsp" />
				</div>

				<!--  <div class="row text-center">
				    <ul id="member_pagination" class="pagination "><div class="pagination"><span class="current prev">上一页</span><span class="current">1</span><a href="javascript:InitTable(1)">2</a><a class="next" href="javascript:InitTable(1)">下一页</a><span class="allentries">共17条记录</span></div></ul>
			    </div> -->
			</div>
		</div>

	</body>
	<script src="../js/jquery-1.8.3.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript" src="../js/common.js">
		
	</script>
	<script type="text/javascript" src="../js/jquery.pagination.js"></script>
</html>
