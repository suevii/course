<%@ page language="java" import="java.util.*,model.*" pageEncoding="UTF-8"%>
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
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
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
				UserTable user = (UserTable)session.getAttribute("user");
  				String id = user.getId();
  				Semester sem = new Semester();
  				int nterm = sem.getTerm();
  				ArrayList al = DB.getStudentCourse(id);
  				Iterator iter=al.iterator();
  	  			while(iter.hasNext()){
  	  				StudentCourse course = (StudentCourse)iter.next();
  	  				String cname = course.getCname();
  	  				String cnum = course.getCnum();
  	  				String tnum = course.getTnum();
  	  				String tname = course.getTname();
  	  				String term = course.getRealTerm();
  	  				int cterm = course.getTerm();
  	  				Long open_id = course.getOpen_id();
  			%>
  					<div style="width:250px;margin-left: 50px;float:left;text-align: center;">
  						<fieldset class="layui-elem-field">
							<div class="layui-field-box">
								<div style="font-size: 20px;font-weight:bold;"><%=cname%></div>
								<div style="font-size: 15px;color:#A0A0A0">
  									<br><%=tname %><br>
  									<%=cnum %><br>
  									<%=term.substring(0,4)+term.substring(5,6) %>
  									
  								</div>
  								<br>
  								<form action="course" method="post">
  									<input type="hidden" name = "openid" value="<%=open_id %>">
  									<input type="hidden" name = "coursenum" value="<%=cnum %>">
  									<%
  									if(cterm < nterm){
  								%>
  									<button class="layui-btn layui-btn-big">回顾课程</button>
  								<%
  									}else{
  								%>
  									<button class="layui-btn layui-btn-big layui-btn-normal" type = "submit">进入课程</button>
  								<%  }%>
  								</form>
  							</div>
  						</fieldset>
  					</div>
  							
  			<%
  				}
			%>
			
		</div>
		<script src="/course/layui/layui.js"></script>
		<script src="/course/layui/lay/dest/layui.all.js"></script>  
	</div>
</body>
</html>