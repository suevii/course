<%@ page language="java" import="java.util.*,model.UserTable" pageEncoding="UTF-8"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>学生选课系统</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" href="css/index.css">
</head>
<body>
	<div class="layui-layout layui-layout-admin">
			<jsp:include page="head.jsp"/>
			<jsp:include page="left.jsp"/>
		<div class="layui-body site-demo">
			<ul class="layui-nav">
				  <li class="layui-nav-item"><a href="">最新活动</a></li>
				  <li class="layui-nav-item layui-this">
				    <a href="javascript:;">产品</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">选项1</a></dd>
				      <dd><a href="">选项2</a></dd>
				      <dd><a href="">选项3</a></dd>
				    </dl>
				  </li>
				  <li class="layui-nav-item"><a href="">大数据</a></li>
				  <li class="layui-nav-item">
				    <a href="javascript:;">解决方案</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">移动模块</a></dd>
				      <dd><a href="">后台模版</a></dd>
				      <dd class="layui-this"><a href="">选中项</a></dd>
				      <dd><a href="">电商平台</a></dd>
				    </dl>
				  </li>
				  <li class="layui-nav-item"><a href="">社区</a></li>
				</ul>
		
			<blockquote class="layui-elem-quote">温馨提示：现在是2016-2017学年秋季学期。<br>您的身份是：教师。</blockquote>
		</div>
		<script src="layui/layui.js"></script>
		<script src="layui/lay/dest/layui.all.js"></script>  
	</div>
</body>
</html>