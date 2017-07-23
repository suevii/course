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
		<title>学生选课系统</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

</head>
<body>
<% 
	if(session.getAttribute("user") != null){
		UserTable user = (UserTable)session.getAttribute("user");
		if(user.getLevel() == 1)
			response.sendRedirect("/course/teacher/teacherMain.jsp");
		else
			response.sendRedirect("/course/student/studentMain.jsp");
	}
%>
<div style="margin-top:50px;">
	<div>
		<s:form action = "login" method = "post" style="width:400px">
			<div>
				<fieldset>
		  			<legend>用户登录</legend>
		  			<div>
						<div>
		    				<label>账号</label>
		    				<div>
		      					<input type="text" id="input-username" name="user.username" autocomplete="off" placeholder="学号或工号">
		   					 </div>
		  				</div>
		  				<div class="layui-form-item">
		    				<label class="layui-form-label">密码</label>
		    				<div class="layui-input-block">
		      					<input type="password" id="input-password" name="user.password" autocomplete="off" placeholder="请输入密码">
		   					 </div>
		  				</div>
		  				<div>
						    <label>身份选择</label>
						    <div>
						      <input type="radio" name="character" value="student" title="学生" checked="">
						      <input type="radio" name="character" value="teacher" title="教师">
						    </div>
						 </div>
						 <div style="margin-left:110px;">
			  				<button type="submit">登录</button>
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