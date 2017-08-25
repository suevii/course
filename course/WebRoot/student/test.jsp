<%@ page language="java" import="java.util.*,model.vo.*,db.DB,java.sql.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<jsp:useBean id="DB" scope="page" class = "db.DB" />
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
		<link rel="stylesheet" href="/courese/layui/css/layui.css">
		<link rel="stylesheet" href="/course/css/index.css">
</head>
<body>
<form class="layui-form" action="teacherInfo.jsp" method="post">
	<input type="hidden" name="number" value="10000001">
	<input type="hidden" name="name" value="邹国兵">
	<button class="layui-btn layui-btn-primary layui-btn-small" lay-submit="" lay-filter="demo1">邹国兵</button>
</form>
<form class="layui-form" action="teacherInfo.jsp">
	<label class="layui-form-label">教师号</label>
	<input type="text" name="number" class="layui-input">

				<div class="layui-inline">
					<label class="layui-form-label">教师名</label>
			    <div class="layui-input-inline">
			    	<input type="text" name="name" class="layui-input">
			    </div>
			    <div class="layui-inline">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit="" lay-filter="demo1">查询</button>
						</div>
					</div>
				</div>
			</div>
		</form>
</body>
</html>