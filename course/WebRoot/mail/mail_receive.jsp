<%@ page language="java" import="java.util.*,model.*" pageEncoding="UTF-8"%>
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
    
    <title>收件箱</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/course/css/bootstrap.min.css">
	  <link rel="stylesheet" type="text/css" href="/course/css/bootstrap-theme.min.css">
	  <link rel="stylesheet" type="text/css" href="/course/css/normalize.css" />
	<link rel="stylesheet" href="/course/layui/css/layui.css">
	<link rel="stylesheet" href="/course/css/index.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
 <body>

 <div class="layui-layout layui-layout-admin">
			<%UserTable user = (UserTable)session.getAttribute("user");
			int level = user.getLevel(); 
			String cha1= level==0?"/student/head.jsp":"/teacher/head.jsp";
			String cha2= level==0?"/student/left.jsp":"/teacher/left.jsp";
			System.out.println(level);%>
      <jsp:include page="<%=cha1%>"/>
      <jsp:include page="<%=cha2%>"/>
			<div class="layui-body site-demo" style="margin-top: 30px;">
	 <div class="container" >
	 <row class="col-md-10">

	<form>
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
  		   
  		    ArrayList al=db.findMailInfo2(user); 		   		    
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
  					<td align="center">
  					<input type="button" class="layui-btn layui-btn-small" value="内容" onclick="window.location.href='/course/mail/mail_content1.jsp?param=<%= mail.getMail_Id() %>';"/>
  					</td>
  					<td><%= mail.getTime() %></td>
  					<td>
  					<input type="button" class="layui-btn layui-btn-danger layui-btn-small" value="删除" onclick="window.location.href='/course/mail/mail_delete1.jsp?param=<%= mail.getMail_Id() %>';"/>
  					</td>
  					</tr>
  		<% 
  			}
  		 %>
  		</table>
  		
  	</form>
  	</row>
  	</div>
  	</div>
 </div>
 <script type="text/javascript" src="/course/jquery-1.7.2/jquery-3.2.0.min.js"></script>
	<script src="/course/layui/layui.js"></script>
	<script src="/course/layui/lay/dest/layui.all.js"></script>
</body>
</html>
