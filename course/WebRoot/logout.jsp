<%@ page language="java" pageEncoding="gb2312"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ÕýÔÚ×¢Ïú</title>
</head>
<body>
	<% 
  		session.invalidate();
  		response.sendRedirect("login.jsp");
  	%>
</body>
</html>