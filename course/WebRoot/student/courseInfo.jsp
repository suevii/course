<%@ page language="java" import="java.util.*,model.vo.*,db.DB,java.sql.*,dao.*,dao.impl.*" pageEncoding="UTF-8"%>
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
						<label class="layui-form-label">教师名</label>
				    <div class="layui-input-inline">
				    	<input type="text" name="tName" class="layui-input">
				    </div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">学分数</label>
				    <div class="layui-input-inline">
				    	<input type="text" name="credit" class="layui-input">
				    </div>
					</div>
					<div class="layui-inline">
			  		<label class="layui-form-label">选择学期</label>
				    <div class="layui-input-inline">
						  <select name="term" lay-search="">
						    <option value="%">全部学期</option>
								<%
									String sql1 = "select DISTINCT cTerm from `open`";
									Open oterm = new Open();
									ResultSet rs1 = DB.executeQuery(sql1);
									while (rs1.next()) {
										oterm.setCterm(rs1.getInt("cTerm"));
										String selection = oterm.getRealTerm();
										String value = oterm.getCterm().toString();
								%>
									<option value=<%=value %>><%=selection %></option>
								<%
									}
								%>
						  </select>
						</div>
					</div>
				</div>
				<div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
			      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			  </div>
		  </form>
 			<div class="panel panel-default" style="margin:30px;">
				<div class="panel-heading">
					<h2 class="panel-title">课程信息</h2>
				</div>
				<table border="1" class="layui-table" lay-skin="line" style="text-align:center">
	 			  <thead>
				  	<tr >
				    	<th style="text-align:center">课程号</th>
				    	<th style="text-align:center">课程名</th>
				    	<th style="text-align:center">学分</th>
				    	<th style="text-align:center">教师号</th>
				    	<th style="text-align:center">教师名</th>
				    	<th style="text-align:center">上课时间</th>
				    	<th style="text-align:center">学期</th>
				  	</tr> 
				  </thead>
				  <tbody>
				 	<%
				 		if(request.getParameter("cNum") != null || request.getParameter("cName") != null){
					 		String cNum = request.getParameter("cNum");
							String cName = new String(request.getParameter("cName").getBytes("iso8859-1"),"utf-8");
							String tNum = request.getParameter("tNum");
							String tName = new String(request.getParameter("tName").getBytes("iso8859-1"),"utf-8");
							String term = request.getParameter("term");
							int credit = 0;
							if(request.getParameter("credit") != null && request.getParameter("credit") != "");
								credit = Integer.parseInt(request.getParameter("credit"));
					 		String sql = "SELECT * "
													+ "FROM course c, open o, teacher T "
													+ "WHERE 1=1 AND T.tNum = O.tNum AND C.cNum = O.cNum ";
							if(request.getParameter("cNum") != null && request.getParameter("cNum") != "")
								sql += " AND c.cNum = '" + cNum + "'";
							if(request.getParameter("cName") != null && request.getParameter("cName") != "")
								sql += " AND c.cName = '" + cName + "'";
							if(request.getParameter("tNum") != null && request.getParameter("tNum") != "")
								sql += " AND T.tNum = '" + tNum + "'";
							if(request.getParameter("tName") != null && request.getParameter("tName") != "")
								sql += " AND t.tName = '" + tName + "'";
							if(request.getParameter("term") != null && request.getParameter("term") != "")
								sql += " AND o.cTerm LIKE '" + term + "'";
							if(request.getParameter("credit") != null && request.getParameter("credit") != "")
								sql += " AND C.credit = " + credit;
							ResultSet rs = DB.executeQuery(sql);
							Course c = new Course();
							Teacher t = new Teacher();
							Open o = new Open(); 
							if(!rs.next()){
						%>
								<tr style="text-align: center;">查不到(・ω・)凸</tr>
						<%
							}else{
								rs = DB.executeQuery(sql);
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
								<td>
									<form name="form1" class="layui-form" action="teacherInfo.jsp" method="post">
										<input type="hidden" name="name">
										<input type="hidden" name="number" value="<%=t.getTnum()%>">
										<button class="layui-btn layui-btn-primary" style="border:0" lay-submit="" lay-filter="demo1"><%= t.getTname() %></button>
									</form>
								</td>
								<td><%= o.getCtime() %></td>
								<td><%= o.getRealTerm() %></td>
							</tr>
						
			  		<%
								 }
							}
						}
					%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
		<script src="/course/layui/layui.js"></script>
		<script src="/course/layui/lay/dest/layui.all.js"></script>  
</body>
</html>