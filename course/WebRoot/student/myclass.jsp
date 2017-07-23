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
		<title>课程管理系统</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="/course/layui/css/layui.css">
		<link rel="stylesheet" href="/course/css/index.css">
</head>
<body>
	<div class="layui-layout layui-layout-admin">
			<jsp:include page="guide.jsp"/>
			<jsp:include page="left.jsp"/>
		<div class="layui-body site-demo" style="margin-top: 30px;">
			<fieldset class="layui-elem-field layui-field-title">
	  			<legend>首页</legend>
			</fieldset>
			<%UserTable user = (UserTable)session.getAttribute("user");
			String id = user.getId(); 
			String cnum = (String)session.getAttribute("coursenum");
			String open_id=(String)session.getAttribute("openid");%>
			这里是首页。
			<br>
			学号：<%=id %><br>
			课程号：<%=cnum %><br>
			开课号：<%=open_id %><br>
			<blockquote class="layui-elem-quote">温馨提示：现在是2016-2017学年春季学期。</blockquote>
		</div>
		<script src="/course/layui/layui.js"></script>
		<script src="/course/layui/lay/dest/layui.all.js"></script>  
	</div>
</body>
</html>