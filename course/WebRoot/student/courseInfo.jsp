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
	<link rel="stylesheet" href="/coures/layui/css/layui.css">
	<link rel="stylesheet" href="/course/css/index.css">
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<jsp:include page="head.jsp"/>
		<jsp:include page="left.jsp"/>
 		<div class="layui-body site-demo">
	 		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
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
									<option value=<%= value %>><%= selection %></option>
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
 				<hr class="layui-bg-green">
				<table border="1" class="layui-table layui-anim layui-anim-upbit" lay-skin="line" style="text-align:center">
	 			  <thead>
				  	<tr>
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
				 		String cNum = request.getParameter("cNum");
				 		String cName = request.getParameter("cName");
				 		if(request.getParameter("cName") != null && request.getParameter("cName") != ""){
							cName = new String(request.getParameter("cName").getBytes("iso8859-1"),"utf-8");
						}
						String cCredit = request.getParameter("credit");
						String tNum = request.getParameter("tNum");
						String tName = request.getParameter("tName");
						if(request.getParameter("tName") != null && request.getParameter("tName") != ""){
							tName = new String(request.getParameter("tName").getBytes("iso8859-1"),"utf-8");
						}
						String term = request.getParameter("term");
						
				 		ISearchCourseDAO searchCourseDAO = new SearchCourseDAO();
				 		ArrayList al = searchCourseDAO.searchCourse(cNum, cName, cCredit, tNum, tName, term);
						Iterator iter = al.iterator();
						while(iter.hasNext()){
							HashMap<String, Object> map = (HashMap)iter.next();
		  				String cnum = (String)map.get("cNum");
		  				String cname = (String)map.get("cName");
		  				int credit = Integer.parseInt(String.valueOf(map.get("credit")));
		  				String tnum = (String)map.get("tNum");
		  				String tname = (String)map.get("tName");
		  				String ctime = (String)map.get("cTime");
		  				String cterm = (String)map.get("cTerm");
				 	%>
				 			<tr>
								<td><%= cnum %></td>
								<td><%= cname %></td>
								<td><%= credit %></td>
								<td><%= tnum %></td>
								<td>
									<form class="layui-form" action="teacherInfo.jsp" method="post">
										<input type="hidden" name="name">
										<input type="hidden" name="number" value="<%= tnum %>">
										<button class="layui-btn layui-btn-primary" style="background-color: transparent;border:0;color:#000;" lay-submit="" lay-filter="demo1"><%= tname %></button>
									</form>
								</td>
								<td><%= ctime %></td>
								<td><%= cterm %></td>
							</tr>
		  		<%
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