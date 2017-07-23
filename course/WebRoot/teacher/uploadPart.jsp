<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext,model.*,java.sql.*" %>
<jsp:useBean id="MySQLDB" class="db.DB"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>上传文件</title>
    
    <link rel="stylesheet" type="text/css" href="/course/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/course/css/bootstrap-table.css">
  </head>
  
  <body>
		<div class="panel panel-default" style="margin:30px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2 class="panel-title">上传文件</h2>
				</div>
				<div class="panel-body">
					<s:form role="form" class="form-inline" action="upload" method="post" enctype="multipart/form-data">
						<div>
							<input class="form-control" type="file" name="upload">
							<button class="btn btn-success" type="submit">上传</button>
							<label>文件大小请小于50MB哦~</label>
						</div>
					</s:form>
				</div>
			</div>
			
			<div class="panel panel-default" style="margin-top:30px;">
				<div class="panel-heading">
					<h2 class="panel-title">课程文件</h2>
				</div>
				<!-- <div class="panel-body"></div> -->
				<table class="table table-striped table-bordered table-hover" style="text-align:center">
					<thead>
						<tr>
							<th style="text-align:center">文件名称</th>
	            <th style="text-align:center">上传时间</th>
	            <th style="text-align:center">操作</th>
		        </tr>
	        </thead>
	        <%
	        	UserTable user = (UserTable)session.getAttribute("user");
	        	String userId = user.getId();
	        	String openId = (String)session.getAttribute("openid");	//open_id
						int open_id = Integer.parseInt(openId);
						String sql = "select * "
											 + "from course_file cf, file f "
											 + "where cf.file_id = f.file_id and open_id = " + open_id;
	        	/* String sql = "select * from file where owner_num = " + user.getId() + "and open_id = "; */
	        	ResultSet rs = MySQLDB.executeQuery(sql); 
	        	while(rs.next()){
							String fileName = rs.getString("f.name");
							String date = rs.getString("f.file_date");
	        %>
		         	<form action="delete" method="post">
			  				<tr>
			  					<td><input type="hidden" name="file.name" value="<%= fileName %>"><%= fileName %></td>
			  					<td><input type="hidden" name="" value="<%= date %>"><%= date %></td>
			  					<td><button class="btn btn-danger" type="submit">删除</button> </td>
			  				</tr>
							</form>
					<%
						}
					%>
				</table>	
			</div>
			
		</div>
  </body>
</html>
