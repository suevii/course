<%@ page language="java" import="java.util.*,model.UserTable,java.sql.*,db.DB" pageEncoding="UTF-8"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<jsp:useBean id="MySQLDB" class="db.DB"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>课程管理系统</title>
		<link rel="stylesheet" href="/course/layui/css/layui.css">
		<link rel="stylesheet" href="/course/css/index.css">
</head>
<body>
	<div class="layui-layout layui-layout-admin">
			<jsp:include page="/student/head.jsp"/>
			<jsp:include page="/student/left.jsp"/>
			<%
				UserTable user = (UserTable)session.getAttribute("user");
				String name = user.getUsername(); 
			%>
			<div class="layui-body site-demo" style="margin-top: 30px;">
				<fieldset class="layui-elem-field layui-field-title">
		  			<legend><%=name %>，欢迎你登录课程项目管理系统！</legend>
				</fieldset>
				<blockquote class="layui-elem-quote">
					温馨提示：现在是2016-2017学年秋季学期。<br>
					您的身份是：学生。
				</blockquote>
				热门课程展示(按选课人数排序)
				<br>
				<table class="layui-table" lay-skin="line" style="text-align:center">
					<thead>
						<tr>
							<th style="text-align:center">开课号</th>
	            <th style="text-align:center">课程号</th>
	            <th style="text-align:center">课程名</th>
	            <th style="text-align:center">教师号</th>
	            <th style="text-align:center">教师名</th>
	            <th style="text-align:center">选课人数</th>
	        	</tr>
					</thead>
					<%
						String sql = "select O.open_id, C.cNum, cName, T.tNum, tName, count(DISTINCT S.sNum) as '选课人数' "
													+ "from course C, `open` O, `select` S, teacher T "
													+ "where O.open_id=S.open_id and C.cNum=O.cNum and T.tNum=O.tNum "
													+ "GROUP BY C.cNum, cName, T.tNum "
													+ "ORDER BY count(S.sNum) desc ";
						ResultSet rs = MySQLDB.executeQuery(sql);
	        	while(rs.next()){
	        		String open_id = rs.getString(1);
	        		String cNum = rs.getString(2);
	        		String cName = rs.getString(3);
	        		String tNum = rs.getString(4);
	        		String tName = rs.getString(5);
	        		String count = rs.getString(6);
	        %>
	        		<tr>
			  					<td><input type="hidden" name="file.name" value="<%= open_id %>"><%= open_id %></td>
			  					<td><input type="hidden" name="" value="<%= cNum %>"><%= cNum %></td>
			  					<td><input type="hidden" name="" value="<%= cName %>"><%= cName %></td>
			  					<td><input type="hidden" name="" value="<%= tNum %>"><%= tNum %></td>
			  					<td><input type="hidden" name="" value="<%= tName %>"><%= tName %></td>
			  					<td><input type="hidden" name="" value="<%= count %>"><%= count %></td>
		  				</tr>
	 				<%
						}
					%>
				</table>
				
				热门课程展示(按平均绩点排序)
				<br>
				<table class="layui-table" lay-skin="line" style="text-align:center">
					<thead>
						<tr>
							<th style="text-align:center">开课号</th>
	            <th style="text-align:center">课程号</th>
	            <th style="text-align:center">课程名</th>
	            <th style="text-align:center">教师号</th>
	            <th style="text-align:center">教师名</th>
	            <th style="text-align:center">平均绩点</th>
	        	</tr>
					</thead>
					<%
						sql = "select O.open_id, C.cNum, cName, T.tNum, tName, avg(grade) "
									+ "from course C, `open` O, `select` S, teacher T "
									+ "where O.open_id=S.open_id and C.cNum=O.cNum and T.tNum=O.tNum "
									+ "GROUP BY C.cNum, cName, T.tNum "
									+ "ORDER BY avg(grade) desc ";
						rs = MySQLDB.executeQuery(sql);
	        	while(rs.next()){
	        		String open_id = rs.getString(1);
	        		String cNum = rs.getString(2);
	        		String cName = rs.getString(3);
	        		String tNum = rs.getString(4);
	        		String tName = rs.getString(5);
	        		String avgGrade = rs.getString(6);
	        %>
	        		<tr>
			  					<td><input type="hidden" name="file.name" value="<%= open_id %>"><%= open_id %></td>
			  					<td><input type="hidden" name="" value="<%= cNum %>"><%= cNum %></td>
			  					<td><input type="hidden" name="" value="<%= cName %>"><%= cName %></td>
			  					<td><input type="hidden" name="" value="<%= tNum %>"><%= tNum %></td>
			  					<td><input type="hidden" name="" value="<%= tName %>"><%= tName %></td>
			  					<td><input type="hidden" name="" value="<%= avgGrade %>"><%= avgGrade %></td>
		  				</tr>
	 				<%
						}
					%>
				</table>
			</div>
	</div>
</body>
		<script src="/course/layui/layui.js"></script>
		<script src="/course/layui/lay/dest/layui.all.js"></script>  
</html>