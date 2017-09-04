<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" href="/course/layui/css/layui.css">
		<link rel="stylesheet" href="/course/css/index.css">
</head>
<body>

			<div class="layui-header header header-demo" style="height: 80px;">
				<div class="layui-main" style="text-align: right;">
					<div class="logo" style="text-align: center;">课程管理系统<p style="font-size: 12px;line-height: 12px;position: relative;top: -10px;">Course Management System</p></div>
					<ul class="layui-nav daohang" style="height: 80px;">					
						<li class="layui-nav-item " style="height:80px;line-height:80px;position: absolute;bottom: 0px;right: 15px;">
							<a href="/course/logout.jsp">注销</a>
						</li>
					</ul>
				</div>
			</div>

</body>
</html>