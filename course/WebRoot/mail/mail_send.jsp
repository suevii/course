<%@ page language="java" import="java.util.*,model.*" pageEncoding="UTF-8"%>
<%@page import="model.MailTable"%>
<%@page import="model.UserTable"%>
<%@page import="model.vo.*"%>
<%@page import="db.DB"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发件箱</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="/course/css/bootstrap.min.css">
	  <link rel="stylesheet" type="text/css" href="/course/css/bootstrap-theme.min.css">
	  <link rel="stylesheet" type="text/css" href="/course/css/normalize.css" />
	<link rel="stylesheet" href="/course/layui/css/layui.css">
	<link rel="stylesheet" href="/course/css/index.css">

  </head>
  
 <body>
  <div class="layui-layout layui-layout-admin">
			<%  
				String character = (String)session.getAttribute("character");
				int level = -1;
				Object user = session.getAttribute("user");
				String name = null;
				if(character.equals("student")){
					user = (Student)user;
					level = 0;
				}else if(character.equals("teacher")){
					user = (Teacher)user;
					level = 1;
				}
				String h1= level==0?"/student/head.jsp":"/teacher/head.jsp";
				String h2= level==0?"/student/left.jsp":"/teacher/left.jsp";
				System.out.println(level); 
			%>
      <jsp:include page="<%=h1%>"/>
      <jsp:include page="<%=h2%>"/>
			<div class="layui-body site-demo" style="margin-top: 30px;">
	 <div class="container" >
	 <row class="col-md-10">
	<form action="/course/mail/mail_write.jsp" method="post">
  		<table class="layui-table recitable table table-bordered  textpos" lay-even lay-skin="row">
  			<caption>所有邮件</caption>
  			<colgroup >
			    <col width="100">
			    <col>
			  </colgroup>
  			<tr><th>序号</th><th>发送人</th>
				<th>收件人</th>
				<th>标题</th><th>邮件内容</th>
				<th>时间</th>
				<th> </th>
				</tr>
  		<%
  		    DB db=new DB();
  		    
  		    ArrayList al = db.findMailInfo1(user); 		   		    
  			System.out.println(al);
  			Iterator iter=al.iterator();
  			int index=0;
  			while(iter.hasNext()){
  				MailTable mail=(MailTable)iter.next();
  				index++;
  		%>
  				<tr><td><%= index %></td>
  					<td><%= mail.getNum_from() %></td>
  					<td><%= mail.getNum_to() %></td>
  			
  					<td><%= mail.getTitle() %></td>
  					<td align="center"><input type="button" class="layui-btn layui-btn-small" value="内容" onclick="window.location.href='/course/mail/mail_content.jsp?param=<%= mail.getMail_Id() %>';"/></td>
  					
  					<td><%= mail.getTime() %></td>
  					<td><input type="button" class="layui-btn layui-btn-danger layui-btn-small" value="删除" onclick="window.location.href='/course/mail/mail_delete.jsp?param=<%= mail.getMail_Id() %>';"/></td>
  					</tr>
  		<% 
  		         
  			}
  		 %>
  		</table>
  		<input type="submit" class="layui-btn layui-btn-small layui-btn-normal" value="写邮件"/>
  		
  	</form>
  	</row>
  	</div>
  	</div>
  <script type="text/javascript" src="/course/jquery-1.7.2/jquery-3.2.0.min.js"></script>
	<script src="/course/layui/layui.js"></script>
	<script src="/course/layui/lay/dest/layui.all.js"></script>
	</div>
</body>
</html>
