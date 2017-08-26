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
				    <option value="">直接选择或搜索选择</option>
				    <option value="20171">2017年春季学期</option>
				    <option value="20164">2016年冬季学期</option>
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
				//String term = "20164";
				Teacher user = (Teacher)session.getAttribute("user");
				String id = user.getTnum();
				//String id = "10000001";
		 		String sql = "SELECT s.sNum, st.sName, s.grade,c.cNum, c.cName from `select` s, `open` o, student st, course c"
		 				+" WHERE o.open_id = s.open_id AND s.sNum = st.sNum AND c.cNum = o.cNum "
		 				+"AND o.tNum = '"+id+"'AND o.cTerm = '"+term+"' ORDER BY  s.sNum, c.cNum";
				ResultSet rs = DB.executeQuery(sql);
				Select s = new Select();
				Student st = new Student();
				Open o = new Open();
				Course c = new Course();
				o.setCterm(Integer.parseInt(term));
		%>
		<div class="panel-heading">
			<h2 class="panel-title"><%= o.getRealTerm() %></h2>
		</div>
		<table border="1" class="layui-table" lay-even lay-skin="line">
		  <thead>
		  	<tr>
		  		<th>学号</th>
		  		<th>姓名</th>
		  		<th>课程号</th>
		  		<th>课程名</th>
		  		<th>成绩</th>
		  	</tr>
		  </thead>
  		<tbody>
		<%
				while (rs.next()) {
					st.setSnum(rs.getString("sNum"));
					st.setSname(rs.getString("sName"));
					s.setGrade(rs.getInt("grade"));
					c.setCnum(rs.getString("cNum"));
					c.setCname(rs.getString("cName"));
	 	%>
			<tr>
				<td><%= st.getSnum() %></td>
				<td><%= st.getSname() %></td>
				<td><%= c.getCnum() %></td>
				<td><%= c.getCname() %></td>
				<td><%= s.getGrade() %></td>
			</tr>
			
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