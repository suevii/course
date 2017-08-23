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
			<!--<link rel="stylesheet" type="text/css" href="styles.css">-->
			<link rel="stylesheet" href="/course/layui/css/layui.css">
			<link rel="stylesheet" href="/course/css/index.css">
	</head>
	<body>
			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<ul class="layui-nav layui-nav-tree site-demo-nav">
						<li class="layui-nav-item layui-nav-itemed">
							<a class="javascript:;" href="/course/student/studentMain.jsp">首页</a>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a class="javascript:;" href="javascript:;">课程管理</a>
							<dl class="layui-nav-child">
								<dd><a href="/course/student/course.jsp">我的课程</a></dd>
							</dl>
							<dl class="layui-nav-child">
								<dd><a href="/course/student/teacherInfo.jsp">教师查询</a></dd>
							</dl>
							<dl class="layui-nav-child">
								<dd><a href="/course/student/courseInfo.jsp">课程查询</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a class="javascript:;" href="/course/student/homeworkCenter.jsp">任务中心</a>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a class="javascript:;" href="javascript:;">邮件</a>
							<dl class="layui-nav-child">
								<dd><a href="/course/mail/mail_receive.jsp">收件箱</a></dd>
								<dd><a href="/course/mail/mail_send.jsp">发件箱</a></dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
	</body>
</html>