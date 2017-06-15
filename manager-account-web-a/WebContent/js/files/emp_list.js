$(function(){
	
	
}
function loadData() {	// 该函数名称一定要固定，不许修改
	// 如果要想进行分页的处理列表前首先查询出部门编号
	did = $("#did").val() ;	// 取得指定组件的value
	tid = $("#tid").val() ;
//	console.log("部门编号：" + did) ;
//	console.log("差旅编号：" + tid) ;
	$.post("pages/back/admin/travel/list_emp.action", {
		"did" : did,
		"cp" : jsCommonCp, 
		"ls" : jsCommonLs,
		"tid": tid
	}, function(data) {
//		console.log(data);
		$("#empTable tr:gt(0)").remove() ;
		for (var x = 0 ; x < data.allEmps.length ; x ++) {
			addTableRow(data.allEmps[x].eid,data.allEmps[x].photo,data.allEmps[x].ename,data.allEmps[x].sal,data.allEmps[x].lid) ;
		}
		createSplitBar(data.allRecorders) ;	// 创建分页控制项
	}, "json");
}