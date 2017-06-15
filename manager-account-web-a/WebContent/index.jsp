<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit"> 
	<title>排班管理系统</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" /> 
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/welcome.css" />
    <script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
	<script>
		function goWhere(){
	       var w_h = parseInt($("body").height());
	       var t_h= parseInt($(".site_choose").height());
			top= parseInt(w_h-t_h);
			$(".zhy_zhezhao_pop").show();
		    $(".site_choose").css("top", top).show();
		}
    	function hideWhere(){
    		$(".zhy_popa").hide();
            $(".zhy_zhezhao_pop").hide();
            
    	}
	</script>
<%!
	public static final String EMP_LIST_USR = "files/emp_list.action";
%>	
	</head>
	<body class="wid_1130" style="background: #edf0f2 url(img/left_bg.jpg) repeat-y 0px 0px;overflow: hidden;" >
		<!--<a href="javascript:void(0);" class="zhy_cloud_tip_a"><i class="icon_plus"></i>新增应用</a>
		<a href="javascript:void(0);" class="zhy_cloud_tip_a"><i class="icon_plus"></i><span>更多模块</span><span>请先进行实名认证</span></a>-->
		
		<div class="header">
			<div class="logo fl">
				<a href="#">
					<div class="pull-left callstatus ">
						<p class="font20">排班管理系统</p>
					</div>
				</a>
			</div>
			<div class="fr">
				<div class="login_box  pull-right btn-group">
					<p class="dropdown-toggle">
						<span>
							<i class="icon_level h_vip"></i>个人中心
						</span>
						<i class="arrow_down"></i>
					</p>
					<ul class="dropdown-menu-header" >
				      <li><a href="javascript:CreateDiv('person','files/detail_person.jsp','会员信息')">个人信息</a></li>
		
				      <li><a href="#">安全退出</a></li>
				    </ul>
				</div>
				<div class="mes pull-right"><a href="#"></a></div>
				<!-- <div class="mes advice pull-right"><a href="#">帮助与反馈</a>帮助与反馈</div> -->
				
				
			</div>
			
		</div>
		<div id="mainFrame" style="" >
			<div class="left_menu fl"  >
					<div class="left_dotted"></div>
					<ul class="first_left">
						<li class="on">
						   <span><i class="icon_arrow_left"></i> 员工管理</span>
						   <ul class="second_left" style="display:block">
						      	<li class="health_report"><a href="<%=EMP_LIST_USR %>" target="mainf"><i class="icon_account"></i><span>员工列表</span></a></li>			
								
						   </ul>
						</li>
						
						
						<li class="on">
						   <span><i class="icon_arrow_left"></i> 小组管理</span> 
						   <ul class="second_left" style="display:block">
						      	<li class="health_report"><a href="files/team_list.jsp" target="mainf"><i class="icon_account"></i><span>小组列表</span></a></li>			
								
						   </ul>
						</li>
						<li class="on">
						   <span><i class="icon_arrow_left"></i> 排班方案管理</span>
						   <ul class="second_left" style="display:block">
						      	<li class="health_report"><a href="files/sort_plan_list.jsp" target="mainf"><i class="icon_account"></i><span>排班方案管理</span></a></li>
								<li class="health_report"><a href="files/sort_manager_table_list.jsp" target="mainf"><i class="icon_account"></i><span>排班表管理</span></a></li>
																
						   </ul>
						</li>
					</ul>
					
					</ul>
			</div>
			<div class="right_main fl" >
	
	            <div id="div_pannel">
	            	<iframe src="files/emp_list.jsp" frameborder="0" width="100%" height="100%" name="mainf" id="mainf" border="0"></iframe>
	            </div>
			</div>
        </div>
       <div class="zhy_zhezhao_pop " style="height: 800px; display: none;"></div>
	
		
		
		
	</body>
	
	<script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
    	
    <!-- tabs生成和拖动 需引用js s-->
    <script type="text/javascript" src="js/tabs.js" ></script>
    <!--<script src="js/ui/jquery.ui.core.min.js"></script>-->
	<!--<script src="js/ui/jquery.ui.widget.min.js"></script>-->
	<!--<script src="js/ui/jquery.ui.mouse.min.js"></script>-->
	<!--<script src="js/ui/jquery.ui.sortable.min.js"></script>-->
    <!-- tab生成和拖动 需引用js e -->
	<script type="text/javascript" src="js/common.js" ></script>


    
</html>

