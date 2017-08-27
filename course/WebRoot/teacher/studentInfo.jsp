<%@ page language="java" import="java.util.*,model.vo.*,db.DB,java.sql.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<jsp:useBean id="DB" scope="page" class = "db.DB" />
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
		<link rel="stylesheet" href="/courese/layui/css/layui.css">
		<link rel="stylesheet" href="/course/css/index.css">
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<jsp:include page="head.jsp"/>
		<jsp:include page="left.jsp"/>
		<div class="layui-body site-demo">
 		<div class="layui-form">
 		
 		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  			<legend>学生查询</legend>
		</fieldset>  
		<div class="panel panel-default" style="margin:30px;">
	 	<form class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">学生学号</label>
			    <div class="layui-input-inline">
			    	<input type="text" name="number" class="layui-input">
			    </div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">学生姓名</label>
			    <div class="layui-input-inline">
			    	<input type="text" name="name" class="layui-input">
			    </div>
			    <div class="layui-inline">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit="" lay-filter="demo1">查询</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	 	<%
		 	if(request.getParameter("number") != null || request.getParameter("name") != null){
				String snum = request.getParameter("number");
				String sname = new String(request.getParameter("name").getBytes("iso8859-1"),"utf-8");
		 		String sql = "SELECT * FROM student WHERE sNum LIKE '"+ snum + "' OR sName LIKE '" + sname +"'";
				ResultSet rs = DB.executeQuery(sql);
				Student sinfo = new Student();
				while (rs.next()) {
					sinfo.setSname(rs.getString("sName"));
					sinfo.setSnum(rs.getString("sNum"));
					sinfo.setSsex(rs.getString("sSex"));
					sinfo.setSbirthplace(rs.getString("sBirthplace"));
					sinfo.setSdept(rs.getString("sDept"));
					sinfo.setPwd(rs.getString("pwd"));
					sinfo.setSphone(rs.getString("sPhone"));
					sinfo.setGpa(rs.getDouble("gpa"));
	 	%>
 		
		<table border="1" class="layui-table" lay-even lay-skin="line">
		  <thead>
		  	<tr>
		    	<th colspan="4"><%=sinfo.getSname()%>学生信息</th>
		  	</tr> 
		  </thead>
  		<tbody>
			<tr>
				<td>姓名</td><td><%=sinfo.getSname()%></td>
				<td>性别</td><td><%=sinfo.getSsex()%></td>
			</tr>
			<tr>
				<td>学号</td><td><%=sinfo.getSnum()%></td>
				<td>学院</td><td><%=sinfo.getSdept()%></td>
			</tr>
			<tr>
				<td>籍贯</td><td><%=sinfo.getSbirthplace()%></td>
				<td>手机号</td><td><%=sinfo.getSphone()%></td>
			</tr>
			<tr>
				<td>GPA</td><td><%=sinfo.getGpa()%></td>
			</tr>
  		</tbody>
		</table>

		
		<%
		}
	}%>
		</div>
		
		</div>

		</div>
		<script src="/course/layui/layui.js"></script>
		<script src="/course/layui/lay/dest/layui.all.js"></script>  
	</div>

</body>
</html>