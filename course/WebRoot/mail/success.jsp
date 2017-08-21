<%@ page language="java" import="java.util.*,model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发送成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="/course/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/course/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="/course/css/normalize.css" />
  <link rel="stylesheet" href="/course/layui/css/layui.css">
  <link rel="stylesheet" href="/course/css/index.css">
  </head>
  
<body class="mailcontent">
   <div class="layui-layout layui-layout-admin">
      <%  UserTable user = (UserTable)session.getAttribute("user");
			int level = user.getLevel(); 
			String h1= level==0?"/student/head.jsp":"/teacher/head.jsp";
			String h2= level==0?"/student/left.jsp":"/teacher/left.jsp";
			System.out.println(level); %>
      <jsp:include page="<%=h1%>"/>
      <jsp:include page="<%=h2%>"/>
      <div class="layui-body site-demo" style="margin-top: 30px;">
   <div class="container" >
   <row class="col-md-10">
	邮件发送成功，单击<a href="/course/mail/mail_send.jsp">这里</a>返回。
	</row>
    </div>
    </div>
  <script type="text/javascript" src="/course/jquery-1.7.2/jquery-3.2.0.min.js"></script>
  <script src="/course/layui/layui.js"></script>
  <script src="/course/layui/lay/dest/layui.all.js"></script>
</div>
</body>
</html>
