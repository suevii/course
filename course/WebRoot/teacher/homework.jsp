<%@ page language="java" import="java.util.*,model.*,java.text.SimpleDateFormat,db.DB" pageEncoding="UTF-8"%>
<jsp:useBean id="DB" scope="page" class = "db.DB" />
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>课程管理系统</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="/course/layui/css/layui.css">
		<link rel="stylesheet" href="/course/css/index.css">
</head>
<body>
	<div class="layui-layout layui-layout-admin">
			<jsp:include page="guide.jsp"/>
			<jsp:include page="left.jsp"/>
		<div class="layui-body site-demo" style="margin-top: 30px;">
			<%
			DB db=new DB();
				String cnum = (String)session.getAttribute("coursenum");
				String cname = db.getCourseName(cnum);
			%>
			<div class="layui-tab">
			  <ul class="layui-tab-title">
			    <li class="layui-this">任务中心</li>
			    <li>发布任务</li>
			    <li>删除任务</li>
			  </ul>
			  <div class="layui-tab-content">
			 	<div class="layui-tab-item layui-show">
					
					<fieldset class="layui-elem-field layui-field-title">
			  			<legend><%=cname %></legend>
					</fieldset>
					
					<%
					String open_id = (String)session.getAttribute("openid");
					long openid = Long.parseLong(open_id);
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					ArrayList al = db.getStudentHomework(openid);
					Iterator iter=al.iterator();
			  		while(iter.hasNext()){
			  			Homework task = (Homework)iter.next();
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
					%>
			    </div>
			    <div class="layui-tab-item">
					<fieldset class="layui-elem-field layui-field-title">
			  			<legend><%=cname %></legend>
					</fieldset>
					<s:form class="layui-form" action="addTask" >
						<div class="layui-form-item">
		    				<label class="layui-form-label">标题</label>
		    				<div class="layui-input-block">
		      					<input type="text" name="task.title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
		    				</div>
		  				</div>
						<div class="layui-form-item layui-form-text">
			    			<label class="layui-form-label">任务详情</label>
			    			<div class="layui-input-block">
			      				<textarea name="task.content" placeholder="请输入内容" class="layui-textarea"></textarea>
			    			</div>
			  			</div>
			  			 <div class="layui-form-item">
			  			 	<label class="layui-form-label">截止日期</label>
		      				<div class="layui-input-inline">
		        				<input type="text" name="deadline" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
		      				</div>
		      				<div class="layui-form-mid layui-word-aux">截止时间默认为所选当天的00:00</div>
			  			 </div>
			  			 <div class="layui-form-item">
		    			 	<div class="layui-input-block">
						    	<button class="layui-btn" lay-submit="" lay-filter="demo1">发布</button>
						        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    				</div>
		  				 </div>
		  			</s:form>
				
				
				</div>
			    <div class="layui-tab-item">
					<fieldset class="layui-elem-field layui-field-title">
			  			<legend><%=cname %></legend>
					</fieldset>
					<s:form class="layui-form" action="deleteTask">
					<div class="layui-form-item">
					<table class="layui-table" lay-skin="line">
				  			<thead>
				      		<tr>
				      			<th></th>
				      			<th>标题</th>
				        		<th>发布时间</th>
				        		<th>截止时间</th>
				      		</tr> 
				      		</thead>
				      		 <colgroup>
							    <col width="50">
							    <col>
							    <col>
							    <col>
							  </colgroup>
					<%
					iter=al.iterator();
					while(iter.hasNext()){
			  			Homework task = (Homework)iter.next();
			  			String title = task.getTitle();
			  			Date out_time = task.getOut_time();
			  			Date deadline = task.getDeadline();
			  			String outtime = df.format(out_time);
			  			String dead = df.format(deadline);
					%>
						<tr>
				        	<td><input type="checkbox" name="title" value="<%=title %>" lay-skin="primary"/></td>
				        	<td><%=title %></td>
				        	<td><%=outtime %></td>
				        	<td><%=dead %></td>
				      	</tr>
					<%
					}
					%>
					</table>
					<button class="layui-btn" lay-submit="" lay-filter="demo1">删除</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>   		
					</div>

						
					</s:form>
				</div>
			  </div>
			</div>
			
			
  			
		</div>
		<script src="/course/layui/layui.js"></script>
		<script src="/course/layui/lay/dest/layui.all.js"></script>  
	
	</div>

	
</body>
</html>