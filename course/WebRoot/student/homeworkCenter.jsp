<%@ page language="java" import="java.util.*,model.*,java.text.SimpleDateFormat,db.DB, model.vo.*" pageEncoding="UTF-8"%>
<jsp:useBean id="DB" scope="page" class = "db.DB" />
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>课程管理系统</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<div class="layui-layout layui-layout-admin">
			<jsp:include page="guide.jsp"/>
			<jsp:include page="left.jsp"/>
		<div class="layui-body site-demo" style="margin-top: 30px;">
			<%
				DB db=new DB();
			%>
			<fieldset class="layui-elem-field layui-field-title">
	  			<legend>任务中心</legend>
			</fieldset>
			
			<%
			String id = null;
			Object user = session.getAttribute("user");
			user = (Student)user;
			id = ((Student)user).getSnum();
			Calendar calendar = Calendar.getInstance();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateNow = dateFormat.format(calendar.getTime());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			ArrayList al = db.getAllHomework(id,dateNow);
			if(al!=null){
			Iterator iter=al.iterator();
	  		while(iter.hasNext()){
	  			Homework task = (Homework)iter.next();
	  			String courseName=db.getCourseNameByOpen(task.getOpen_id());
	  			String title = task.getTitle();
	  			String content = task.getContent();
	  			Date out_time = task.getOut_time();
	  			Date deadline = task.getDeadline();
	  			String outtime = df.format(out_time);
	  			String dead = df.format(deadline);
			%>
			<div class="layui-form">
		  		<table class="layui-table" lay-skin="line">
		  			<thead>
		      		<tr>
		      			<th>标题</th>
		        		<th><%=title %></th>
		      		</tr> 
		      		</thead>
		      		 <colgroup>
					    <col width="150">
					    <col>
					  </colgroup>
					  <tr>
		        		<td>课程</td>
		        		<td><%=courseName %></td>		        		
		      		</tr>
		      		<tr>
		        		<td>任务详情</td>
		        		<td><%=content %></td>		        		
		      		</tr>
		      		<tr>
		      			<td>开始时间</td>
		      			<td><%=outtime %></td>
		      		</tr>
		      		<tr>
		      			<td>结束时间</td>
		      			<td><%=dead %></td>
		      		</tr>
		  		</table>
			</div>
			<br>
			<%
			}
			}
			%>
			</div>
		</div>
		<script src="/course/layui/layui.js"></script>
		<script src="/course/layui/lay/dest/layui.all.js"></script>  
	
  </body>
</html>
