<%@ page language="java" import="java.util.*,model.*" pageEncoding="UTF-8"%>
<%@page import="model.MailTable"%>
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
  <form>
      <table class="layui-table" lay-skin="line">
  		<%
  		    DB db=new DB();
  		    String s=request.getParameter("param");
  		    int a = Integer.parseInt(s);
  		    ArrayList al=db.findMailInfo3(a);  		    
  			System.out.println(al);
  			Iterator iter=al.iterator();
  			
  			while(iter.hasNext()){
  				MailTable mail=(MailTable)iter.next();
  				
  		%>
  				
  					<tr><td><textarea class="layui-textarea textarea"><%= mail.getContent() %></textarea><td></tr>

  				
  		<% 
  		         
  			}
  		 %>
  		</table>
      <div class="pull-right">
      <input type="button" class="layui-btn layui-btn-small" value="返回" onclick="window.location.href='/course/mail/mail_send.jsp';"/>
      </div>
    </form>
    </row>
    </div>
    </div>
  <script type="text/javascript" src="/course/jquery-1.7.2/jquery-3.2.0.min.js"></script>
  <script src="/course/layui/layui.js"></script>
  <script src="/course/layui/lay/dest/layui.all.js"></script>
</body>
</html>
  			  
				
