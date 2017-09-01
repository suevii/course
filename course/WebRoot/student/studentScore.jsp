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
  <link rel="stylesheet" href="/courese/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="/course/css/index.css">
</head>
<body>
  <div class="layui-layout layui-layout-admin">
    <jsp:include page="head.jsp"/>
	<jsp:include page="left.jsp"/>
    <div class="layui-body site-demo">

 		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  		  <legend>成绩查询</legend>
		</fieldset>
		<form class="layui-form" action="">
		   <div class="layui-form-item">
			  <label class="layui-form-label">选择学期</label>
				<div class="layui-input-inline">
				  <select name="term" lay-search="">
				    <option value="%">全部学期</option>
				<%
				    Student user = (Student)session.getAttribute("user");
					String id = user.getSnum();
					String sql = "SELECT DISTINCT o.cTerm from `select` s, `open` o "
						+"WHERE o.open_id = s.open_id AND s.sNum = '"+id+"' ";
					Open oterm = new Open();
					ResultSet rs = DB.executeQuery(sql);
					while (rs.next()) {
						oterm.setCterm(rs.getInt("cTerm"));
						String selection = oterm.getRealTerm();
						String value = oterm.getCterm().toString();
				%>
					<option value=<%=value %>><%=selection %></option>
				<%
					}
				%>
				  </select>
				</div>
			  <div class="layui-inline">
				<div class="layui-input-block">
				  <button class="layui-btn" lay-submit="" lay-filter="demo1">查询</button>
				</div>
			  </div>
		    </div> 
		  </form>
	
		<div class="panel panel-default" style="margin:30px;">
	 	<%
		 	if(request.getParameter("term") != null){
				String term = request.getParameter("term");
				String sql1 = "SELECT s1.sNum, s1.sName, s1.gpa,o.cTerm from `select` s2, `open` o, student s1 "
						+"WHERE o.open_id = s2.open_id AND s1.sNum = s2.sNum "
						+"AND s1.sNum = '"+id+"' AND o.cTerm LIKE '"+term+"' GROUP BY o.cTerm DESC";
				rs = DB.executeQuery(sql1);
				Select s = new Select();
				Student st = new Student();
				Open o = new Open();
				Course c = new Course();
				while (rs.next()) {
					st.setSnum(rs.getString("sNum"));
					st.setSname(rs.getString("sName"));
					o.setCterm(rs.getInt("cTerm"));
					st.setGpa(rs.getDouble("gpa"));
	 	%>
	 	<table border="1" class="layui-table" lay-skin="line" >
		  <thead>
		  	<tr>
		  		<th colspan="5" style="text-align:center"><%=o.getRealTerm() %></th>
		  	</tr>
		  </thead>
  		<tbody>
  			<tr>
		  		<td>学生学号</td>
		  		<td><%= st.getSnum() %></td>
		  		<td>学生姓名</td>
		  		<td><%= st.getSname() %></td>
		  		<td>平均成绩：<%=st.getGpa() %></td>
		  	</tr>
			<tr>
				<td>课程号</td>
				<td>课程名</td>
				<td>学分</td>
				<td>成绩</td>
			</tr>
			<%
			String sql2 = "SELECT c.cNum, c.cName, s.grade,c.credit,o.cTerm from `select` s, `open` o, course c "
						+" WHERE o.open_id = s.open_id  AND c.cNum = o.cNum "
	 				+"AND s.sNum = '"+id+"'AND o.cTerm LIKE '"+o.getCterm()+"' ORDER BY  c.cNum";
			ResultSet rs2 = DB.executeQuery(sql2);
			while(rs2.next()){
				c.setCnum(rs2.getString("cNum"));
				c.setCname(rs2.getString("cName"));
				c.setCredit(rs2.getInt("credit")); 
				s.setGrade(rs2.getInt("grade"));
			%>
			
			<tr>
				<td><%= c.getCnum() %></td>
				<td>
					<form name="form1" class="layui-form" action="studentInfo.jsp" method="post">
						<input type="hidden" name="name">
						<input type="hidden" name="number" value="<%=st.getSnum()%>">
						<button class="layui-btn layui-btn-primary" style="border:0" lay-submit="" lay-filter="demo1"><%= c.getCname() %></button>
					</form>
				</td>
				
				<td><%= c.getCredit() %></td>
				<td><%= s.getGrade() %></td>
			</tr>
			<%} %>
			
		<%} %>
  		</tbody>
		</table>

	<%
	}%>
		</div>
		
		</div>

		<script src="/course/layui/layui.js"></script>
		<script src="/course/layui/lay/dest/layui.all.js"></script>  
	</div>

</body>
</html>
