<%@ page language="java" import="java.util.*,model.*,java.sql.*,db.DB" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" %>
<jsp:useBean id="MySQLDB" class="db.DB"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>文件下载</title> 
		<link rel="stylesheet" type="text/css" href="/course/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/course/css/bootstrap-table.css">
  </head>
  
  <body>

   	<div class="panel panel-default" style="margin:30px;">
			<div class="panel-heading">
				<h2 class="panel-title">文件下载</h2>
			</div>
			<div class="layui-form">
				<table class="layui-table" lay-skin="line" style="text-align:center">
					<thead>
						<tr>
							<th style="text-align:center">文件名称</th>
	            <th style="text-align:center">上传时间</th>
	            <th style="text-align:center">操作</th>
	        	</tr>
					</thead>
	        <%
	        	UserTable user = (UserTable)session.getAttribute("user");	//student
	        	String userId = user.getId();
	        	String strOpen_id = (String)session.getAttribute("openid");	//open_id
						int open_id = Integer.parseInt(strOpen_id);
						String sql = "select * "
											 + "from course_file cf, file f "
											 + "where cf.file_id = f.file_id and open_id = " + open_id;
	       		/* Connection ct = null;
	       		PreparedStatement pstmt;
						Statement stmt = null; 
						String sql = "select * from course_file C, file F where open_id = ? and C.file_id = F.file_id;";
						
						//select * from course_file C, 学生和选课关联
						pstmt = ct.prepareStatement(sql);
						pstmt.setInt(1, open_id);
						ResultSet rs = pstmt.executeQuery(); */
	        	ResultSet rs = MySQLDB.executeQuery(sql);
	        	while(rs.next()){
	        		String file_id = rs.getString("file_id");
	        		String fileName = rs.getString("name");
	        		String date = rs.getString("file_date");
	        %>
		         	<form action="download" method="post">
		  				<tr>
		  					<td><input type="hidden" name="file.name" value="<%= fileName %>"><%= fileName %></td>
		  					<td><input type="hidden" name="" value="<%= date %>"><%= date %></td>
		  					<td>
		  						<a class="layui-btn layui-btn-mini layui-btn-normal" type="submit" href="download?file_id=<%= file_id %>&fileName=<%= fileName %>">下载</a>
								</td>
		  				</tr>
							</form>
					<%
							}
					%>
				</table>	
				<div class="panel-footer"><%= Quote.randomQuote() %></div>
			</div>
		</div>
  </body>
</html>
