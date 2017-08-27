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
  		  <legend>教学情况</legend>
		</fieldset>
		<form class="layui-form" action="">
		   <div class="layui-form-item">
			  <label class="layui-form-label">选择学期</label>
				<div class="layui-input-inline">
				  <select name="term" lay-search="">
				    <option value="%">全部学期</option>
				<%
				    Teacher user = (Teacher)session.getAttribute("user");
					String id = user.getTnum();
					String sql = "select DISTINCT cTerm from `open` WHERE tNum = '"+id+"'";
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
				String sql1 = "SELECT c.cNum, c.cName, avg(s.grade) as avg,o.cTerm from `select` s, `open` o, course c "
						+"WHERE o.open_id = s.open_id AND c.cNum = o.cNum "
						+"AND o.tNum = '"+id+"' AND o.cTerm LIKE '"+term+"' GROUP BY o.cTerm DESC, c.cNum";
				rs = DB.executeQuery(sql1);
				Select s = new Select();
				Student st = new Student();
				Open o = new Open();
				Course c = new Course();
				while (rs.next()) {
					c.setCnum(rs.getString("cNum"));
					c.setCname(rs.getString("cName"));
					o.setCterm(rs.getInt("cTerm"));
					double avg = rs.getDouble("avg");
	 	%>
	 	<table border="1" class="layui-table" lay-skin="line" >
		  <thead>
		  	<tr>
		  		<th colspan="5" style="text-align:center"><%=o.getRealTerm() %></th>
		  	</tr>
		  </thead>
  		<tbody>
  			<tr>
		  		<td>课程号</td>
		  		<td><%= c.getCnum() %></td>
		  		<td>课程名</td>
		  		<td><%= c.getCname() %></td>
		  		<td>平均成绩：<%=avg %></td>
		  	</tr>
			<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>学院</td>
				<td>均绩</td>
				<td>成绩</td>
			</tr>
			<%
			String sql2 = "SELECT st.sNum, st.sName, s.grade,st.sDept,st.gpa from `select` s, `open` o, student st, course c"
	 				+" WHERE o.open_id = s.open_id AND s.sNum = st.sNum AND c.cNum = o.cNum "
	 				+"AND o.tNum = '"+id+"'AND o.cTerm LIKE '"+o.getCterm()+"' ORDER BY  s.sNum, c.cNum";
			ResultSet rs2 = DB.executeQuery(sql2);
			while(rs2.next()){
				st.setSnum(rs2.getString("sNum"));
				st.setSname(rs2.getString("sName"));
				s.setGrade(rs2.getInt("grade")); 
				String dept = rs2.getString("sDept");
				double gpa = rs2.getDouble("gpa");
			%>
			
			<tr>
				<td><%= st.getSnum() %></td>
				<td>
					<form name="form1" class="layui-form" action="studentInfo.jsp" method="post">
						<input type="hidden" name="name">
						<input type="hidden" name="number" value="<%=st.getSnum()%>">
						<button class="layui-btn layui-btn-primary" style="border:0" lay-submit="" lay-filter="demo1"><%= st.getSname() %></button>
					</form>
				</td>
				<td><%= dept %></td>
				<td><%= gpa %></td>
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