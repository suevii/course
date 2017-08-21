<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="model.MailTable"%>
<%@page import="model.UserTable"%>
<%@page import="db.DB"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
 <body bgcolor="#E3E3E3">
 
	<form action="/course/mail/mail_write.jsp" method="post">
  		<table border="1">

  		<%
  		    DB db=new DB();
  		    MailTable mail=new MailTable();
  		    String s=request.getParameter("param");
  		    int a = Integer.parseInt(s);
  		    db.deleteMailInfo(a); 	
  		    response.setHeader("Refresh","0;URL=/course/mail/mail_receive.jsp");  		
  		%>
			
  		</table>
  		 删除成功
  	</form>
</body>
</html>
