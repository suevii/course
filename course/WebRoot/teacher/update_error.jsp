<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>

<title>出错信息</title>
</head>
<body>
更新失败！单击<a href="/course/teacher/homework.jsp">这里</a>返回
</body>
</html>