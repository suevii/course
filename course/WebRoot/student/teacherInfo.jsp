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
  			<legend>教师查询</legend>
		</fieldset>  
		
	 	<form class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">教师号</label>
			    <div class="layui-input-inline">
			    	<input type="text" name="number" class="layui-input">
			    </div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">教师名</label>
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
				String tnum = request.getParameter("number");
				String tname = new String(request.getParameter("name").getBytes("iso8859-1"),"utf-8");
		 		String sql = "SELECT * FROM teacher WHERE tNum LIKE '"+ tnum + "' OR tName LIKE '" + tname +"'";
				ResultSet rs = DB.executeQuery(sql);
				Teacher tinfo = new Teacher();
				while (rs.next()) {
					tinfo.setTname(rs.getString("tName"));
					tinfo.setTnum(rs.getString("tNum"));
					tinfo.setTsex(rs.getString("tSex"));
					tinfo.setTdegree(rs.getString("tDegree"));
					tinfo.setTdept(rs.getString("tDept"));
					tinfo.setTtitle(rs.getString("tTitle"));
					tinfo.setTinfo(rs.getString("tInfo"));
	 	%>
 		
		<table border="1" class="layui-table" lay-even lay-skin="line">
		  <thead>
		  	<tr>
		    	<th colspan="4"><%=tinfo.getTname()%>教师信息</th>
		  	</tr> 
		  </thead>
  		<tbody>
			<tr>
				<td>姓名</td><td><%=tinfo.getTname()%></td>
				<td>性别</td><td><%=tinfo.getTsex()%></td>
			</tr>
			<tr>
				<td>工号</td><td><%=tinfo.getTnum()%></td>
				<td>学院</td><td><%=tinfo.getTdept()%></td>
			</tr>
			<tr>
				<td>学位</td><td><%=tinfo.getTdegree()%></td>
				<td>职称</td><td><%=tinfo.getTtitle()%></td>
			</tr>
			<tr>
				<td colspan="4">个人简介</td>
			</tr>
			<tr>
				<td colspan="4"><%=tinfo.getTinfo()%></td>
			</tr>
  		</tbody>
		</table>

		<table border="1" class="layui-table" lay-even lay-skin="line">
 			  <thead>
			  	<tr>
			    	<th colspan="5">开设课程</th>
			  	</tr> 
			  	
			  </thead>
  		<tbody>
  			<tr>
				<th>课程号</th>
				<th>课程名</th>
			    <th>学分</th>
			    <th>学期</th>
			    <th>上课时间</th>
			</tr> 
 	<%
		String csql = "SELECT * FROM `open` o, course c WHERE o.cNum = c.cNum AND o.tNum = '" + tinfo.getTnum() +"'";
		ResultSet crs = DB.executeQuery(csql);
		while(crs.next()){
			Open open = new Open();
			open.setCterm(crs.getInt("cTerm"));
			
	%>
			<tr>
				<td><%=crs.getString("cNum") %></td>

				<td><%=crs.getString("cName") %></td>

				<td><%=crs.getInt("credit") %></td>

				<td><%=open.getRealTerm() %></td>
				<td><%=crs.getString("cTime") %></td>
			</tr>		
	<%
		}
	%>
  		</tbody>
  		</table>
		<%
		}
	}%>
		
		
		</div>

		</div>
		<script src="/school/layui/layui.js"></script>
		<script src="/school/layui/lay/dest/layui.all.js"></script>  
	</div>

</body>
</html>