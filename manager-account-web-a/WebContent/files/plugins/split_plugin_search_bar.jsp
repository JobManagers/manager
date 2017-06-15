<%@ page pageEncoding="UTF-8"%>
<%--
<jsp:include page="/pages/plugins/split_plugin_search_bar.jsp"/>
--%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String url = basePath + request.getAttribute("url"); // 提交路径
	String columnData = (String) request.getAttribute("columnData"); // 查询列
	String column = (String) request.getAttribute("column");
	String keyWord = (String) request.getAttribute("keyWord");
	long allRecorders = 0;
	if ("null".equals(column) || column == null || "".equals(column)) {
		column = "";
	}
	if ("null".equals(keyWord) || keyWord == null || "".equals(keyWord)) {
		keyWord = "";
	}
%>
<%
	try {
		allRecorders = (Long) request.getAttribute("allRecorders");
	} catch (Exception e) {
	}
%>
<div id="searchDiv">
	<form action="<%=url%>" method="post" class="form-group">
		<div class="form-group">
			<%
				if (!(columnData == null || "".equals(columnData))) {
			%>
			<div class="col-md-3">
				<select id="col" name="col" class="form-control">
					<%
						String result[] = columnData.split("\\|");
							for (int x = 0; x < result.length; x++) {
								String temp[] = result[x].split(":");
					%>
					<option value="<%=temp[1]%>"
						<%=temp[1].equals(column) ? "selected" : ""%>><%=temp[0]%></option>
					<%
						}
					%>
				</select>
			</div>
			<%
				}
			%>
			<form class="form-inline pl20" role="form">
				<div class="form-group">
					<div class="search fl">
						<input type="text" name="kw" id="kw" value="<%=keyWord%>"
							class="form-control input-sm" placeholder="请输入方案名称关键字">
							<input style="display:none;">
					</div>
				</div>
				<div class="form-group">
					<input type="hidden" name="${paramName}" id="${paramName}"
						value="${paramValue}"> <input type="submit" value="查询"
						class="btn btn_white20">
				</div>
			</form>
			<%-- <p>查询一共返回“<%=allRecorders%>”行记录。</p> --%>
		</div>
	</form>
</div>