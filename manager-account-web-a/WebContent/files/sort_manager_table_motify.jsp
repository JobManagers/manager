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
<link rel="stylesheet" type="text/css" href="../css/jk_zy_baogao.css" />
<link rel="stylesheet" href="../css/jquery.ptTimeSelect.css" />
<!-- 日历样式 -->
</head>
<body>
	
				<div class="form-group add_block ">
			   	  <div class="divider"></div>
			      <div class="col-sm-12 text-center">
			         <button type="button" class="btn btn_green" onclick="goHref()">导出excel</button>
			      </div>
			    </div>
	<table border="1" align="center" class="table table-bordered table_fixed table-multicols table-hover ">
		<tr>
			<th></th>
			<th>1</th>
			<th>2</th>
			<th>3</th>
			<th>4</th>
			<th>5</th>
			<th>6</th>
			<th>7</th>
			<th>8</th>
			<th>9</th>
			<th>10</th>
			<th>11</th>
			<th>12</th>
			<th>13</th>
			<th>14</th>
			<th>15</th>
			<th>16</th>
			<th>17</th>
			<th>18</th>
			<th>19</th>
			<th>20</th>
			<th>21</th>
			<th>22</th>
			<th>23</th>
			<th>24</th>
			<th>25</th>
			<th>26</th>
			<th>27</th>
			<th>28</th>
			<th>29</th>
			<th>30</th>
			<th>31</th>
			<th rowspan="2">当前天数</th>
		</tr>

		<tr>
			<th>组名</th>
			<th>日</th>
			<th>一</th>
			<th>二</th>
			<th>三</th>
			<th>四</th>
			<th>五</th>
			<th>六</th>
			<th>日</th>
			<th>一</th>
			<th>二</th>
			<th>三</th>
			<th>四</th>
			<th>五</th>
			<th>六</th>
			<th>日</th>
			<th>一</th>
			<th>二</th>
			<th>三</th>
			<th>四</th>
			<th>五</th>
			<th>六</th>
			<th>日</th>
			<th>一</th>
			<th>二</th>
			<th>三</th>
			<th>四</th>
			<th>五</th>
			<th>六</th>
			<th>日</th>
			<th>一</th>
			<th>二</th>
		</tr>
		<tr>
			<th>A组</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th style="padding: 0">
				<select style="width:36px" >
					<option>早</option>
					<option>中</option>
					<option>晚</option>
				</select>
			</th>
			<th>16</th>
		</tr>
	</table>
</body>
</html>