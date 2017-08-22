<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@page import="db.DB"%>
<%-- <%@page import="model.InfoTable" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>课程管理系统</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="/courese/layui/css/layui.css">
		<link rel="stylesheet" href="/course/css/index.css">
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<jsp:include page="head.jsp"/>
		<jsp:include page="left.jsp"/>
		<div class="layui-body site-demo">
 		<div class="layui-form">
 		
 		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  			<legend>教师查询</legend>
		</fieldset>  
		
 	<form class="layui-form" action="">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">教师号</label>
			    <div class="layui-input-inline">
			    	<input type="text" name="tnum" class="layui-input">
			    </div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">教师名</label>
			    <div class="layui-input-inline">
			    	<input type="text" name="tname" class="layui-input">
			    </div>
			    <div class="layui-inline">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">查询</button>
					</div>
				</div>
			</div>
			
		</div>
		
	</form>
 		
 		
		<table border="1" class="layui-table" lay-even lay-skin="line">
			<colgroup>
    			<col width="80">
    			<col>
    			<col width="80">
    			<col>
 			 </colgroup>
 			  <thead>
			  	<tr>
			    	<th colspan="4">宋安平教师信息</th>
			  	</tr> 
			  </thead>
  		<tbody>
			<tr>
				<td>姓名</td><td>宋安平</td>
				<td>性别</td><td>男</td>
			</tr>
			<tr>
				<td>工号</td><td>10000002</td>
				<td>学院</td><td>计算机工程与技术学院</td>
			</tr>
			<tr>
				<td>学位</td><td>博士</td>
				<td>职称</td><td>副教授</td>
			</tr>
			<tr>
				<td colspan="4">个人简介</td>
			</tr>
			<tr>
				<td colspan="4">这里是一些个人简介。</td>
			</tr>
  		</tbody>
		</table>
		
		
		
		</div>

		</div>
		<script src="/school/layui/layui.js"></script>
		<script src="/school/layui/lay/dest/layui.all.js"></script>  
	</div>

</body>
</html>