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
	 		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
	  			<legend>课程查询</legend>
			</fieldset>  
			<form class="layui-form" action="">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">课程号</label>
				    <div class="layui-input-inline">
				    	<input type="text" name="cNum" class="layui-input">
				    </div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">课程名</label>
				    <div class="layui-input-inline">
				    	<input type="text" name="cName" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-inline">
						<label class="layui-form-label">教师号</label>
				    <div class="layui-input-inline">
				    	<input type="text" name="tNum" class="layui-input">
				    </div>
				  </div>
			    <div class="layui-inline">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit="" lay-filter="demo1">查询</button>
						</div>
					</div>
				</div>
			</form>
			<div class="panel panel-default" style="margin:30px;">
				<div class="panel-heading">
					<h2 class="panel-title">课程信息</h2>
				</div>
				<table border="1" class="layui-table" lay-even lay-skin="line">
	 			  <thead>
				  	<tr>
				    	<th>课程号</th>
				    	<th>课程名</th>
				    	<th>学分</th>
				    	<th>教师号</th>
				    	<th>教师名</th>
				    	<th>上课时间</th>
				    	<th>学期</th>
				  	</tr> 
				  </thead>
				  <tbody>
				 	<%
					 	if(request.getParameter("cNum") != null || request.getParameter("cName") != null){
							String cNum = request.getParameter("cNum");
							String cName = new String(request.getParameter("cName").getBytes("iso8859-1"),"utf-8");
							String tNum = request.getParameter("tNum");
					 		String sql = "select * from course C, open O, teacher T "
					 								+	"where (O.cNum like '" + cNum 
					 								+ "' or C.cName like '" + cName 
					 								+ "' or O.tNum like '" + tNum + "')"
					 								+ " and T.tNum=O.tNum and C.cNum=O.cNum";
							ResultSet rs = DB.executeQuery(sql);
							Course c = new Course();
							Teacher t = new Teacher();
							Open o = new Open();
							while (rs.next()) {
								c.setCnum(rs.getString("C.cNum"));
								c.setCname(rs.getString("C.cName"));
								c.setCredit(rs.getInt("credit"));
								t.setTnum(rs.getString("T.tNum"));
								t.setTname(rs.getString("T.tName"));
								o.setCtime(rs.getString("O.cTime"));
								o.setCterm(rs.getInt("O.cTerm"));
				 	%>
						<tr>
							<td><%= c.getCnum() %></td>
							<td><%= c.getCname() %></td>
							<td><%= c.getCredit() %></td>
							<td><%= t.getTnum() %></td>
							<td><%= t.getTname() %></td>
							<td><%= o.getCtime() %></td>
							<td><%= o.getRealTerm() %></td>
						</tr>
		  		<%
							}
						}
					%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
		<script src="/school/layui/layui.js"></script>
		<script src="/school/layui/lay/dest/layui.all.js"></script>  
</body>
</html>