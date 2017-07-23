<%@ page language="java" import="java.util.*,model.UserTable" pageEncoding="UTF-8"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
		<script src="script/jquery-1.10.2.js" type="text/javascript"></script>
</head>
<body style="background-image: url(pic/face.jpg)">
<div  class="layui-layout layui-layout-admin" style="margin-top:50px;color:#ffffff">
	<div class="layui-main">
		<s:form  class="layui-form" action = "login" method = "post" style="width:400px">
	
			<div class="layui-form-item">
				<fieldset class="layui-elem-field">
		  			<legend>用户登录</legend>
		  			<div class="layui-field-box">
						<div class="layui-form-item">
		    				<label class="layui-form-label">账号</label>
		    				<div class="layui-input-block">
		      					<input type="text" id="input-username" name="user.username" lay-verify="title" autocomplete="off" placeholder="学号或工号" class="layui-input">
		   					 </div>
		  				</div>
		  				<div class="layui-form-item">
		    				<label class="layui-form-label">密码</label>
		    				<div class="layui-input-block">
		      					<input type="password" id="input-password" name="user.password" lay-verify="title" autocomplete="off" placeholder="请输入密码" class="layui-input">
		   					 </div>
		  				</div>
		  				<div class="layui-form-item">
						    <label class="layui-form-label">身份选择</label>
						    <div class="layui-input-block">
						      <input type="radio" name="character" value="student" title="学生" checked="">
						      <input type="radio" name="character" value="teacher" title="教师">
						    </div>
						 </div>
						 <div class="layui-form-item" style="margin-left:110px;">
			  				<button class="layui-btn" lay-submit="" lay-filter="demo1">登录</button>
			    			<button type="reset" class="layui-btn layui-btn-primary">重置</button>   
		    			</div>			
		  			</div>
				</fieldset>
			</div>
		</s:form>
	</div>
	
	<script src="/course/layui/layui.js"></script>
	<script src="/course/layui/lay/dest/layui.all.js"></script>  
</div>

</body>
</html>