<%@ page language="java" import="java.util.*,model.*,model.vo.*,dao.*" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="/course/layui/css/layui.css">
		<link rel="stylesheet" href="/course/css/index.css">
</head>
<body>
	<div class="layui-layout layui-layout-admin">
			<jsp:include page="head.jsp"/>
			<jsp:include page="left.jsp"/>
			<div class="layui-body site-demo" style="margin-top: 30px;">
			<fieldset class="layui-elem-field layui-field-title">
	  			<legend>我的课程</legend>
			</fieldset>
			
			<%
				if(session.getAttribute("coursenum") != null)	
					session.removeAttribute("coursenum");
				String id = null;
				Object user = session.getAttribute("user");
				user = (Student)user;
				id = ((Student)user).getSnum();
 				Semester sem = new Semester();
 				int nterm = sem.getTerm();
 				
 				IStudentCourseDAO studentCourseDAO = new StudentCourseDAO();
 				ArrayList al = studentCourseDAO.getStudentCourse(id);
 				Iterator iter = al.iterator();
  			while(iter.hasNext()){
  				HashMap<String, Object> map = (HashMap)iter.next();
  				Long open_id = Long.valueOf(String.valueOf(map.get("open_id")));
  				String cnum = (String)map.get("cNum");
  				String cname = (String)map.get("cName");
  				String tnum = (String)map.get("tNum");
  				String tname = (String)map.get("tName");
  				int cterm = Integer.parseInt(String.valueOf(map.get("cTerm")));
 			%>
  					<div style="width:250px;margin-left: 50px;float:left;text-align: center;">
  						<fieldset class="layui-elem-field">
							<div class="layui-field-box">
								<div style="font-size: 20px;font-weight:bold;"><%=cname%></div>
								<div style="font-size: 15px;color:#A0A0A0">
  									<br>
  									<%= tname %><br>
  									<%= cnum %><br>
  									<%-- <%= realTerm.substring(0,4) + realTerm.substring(5,6) %> --%>
  									<%= cterm %>
 								</div>
  								<br>
  								<form action="course" method="post">
  									<input type="hidden" name = "openid" value="<%= open_id %>"> 
  									<input type="hidden" name = "coursenum" value="<%= cnum %>">
	  								<%
	  									if(cterm < nterm){
	  								%>
	  										<button class="layui-btn layui-btn-big">回顾课程</button>
	  								<%
	  									}else{
	  								%>
	  										<button class="layui-btn layui-btn-big layui-btn-normal" type = "submit">进入课程</button>
	  								<%  
	  									}
	  								%>
  								</form>
  							</div>
  						</fieldset>
  					</div>
  			<%
  				}
				%>
			
		</div>
	</div>
	<script src="/course/layui/layui.js"></script>
	<script src="/course/layui/lay/dest/layui.all.js"></script>  
</body>
</html>