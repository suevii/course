<%@ page language="java" import="java.util.*,model.UserTable,java.sql.*,db.DB,model.vo.*" pageEncoding="UTF-8"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<jsp:useBean id="MySQLDB" class="db.DB"></jsp:useBean>
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
			<jsp:include page="/student/head.jsp"/>
			<jsp:include page="/student/left.jsp"/>
			<%
				String character = (String)session.getAttribute("character");
				String name = null;
				Object user = session.getAttribute("user");
				if(character.equals("student")){
					user = (Student)user;
					name = ((Student)user).getSname();
				}else if(character.equals("teacher")){
					user = (Teacher)user;
					name = ((Teacher)user).getTname();
				}
			%>
			<div class="layui-body site-demo" style="margin-top: 30px;">
				<fieldset class="layui-elem-field layui-field-title">
		  			<legend><%=name %>，欢迎你登录课程项目管理系统！</legend>
				</fieldset>
				
				<div class="panel panel-default" style="margin:30px;">
					<!-- <div class="panel-heading">
						<h2 class="panel-title">热门课程Top 5</h2>
					</div> -->
					<div class="layui-tab">
					  <ul class="layui-tab-title">
					    <li class="layui-this">人气课程</li>
					    <li>高分课程</li>
					    <li>优秀教师</li>
					    <li>优秀学生</li>
					  </ul>
					  <div class="layui-tab-content">
					    <div class="layui-tab-item layui-show">
					    	<table class="layui-table" lay-skin="line" style="text-align:center">
									<thead>
										<tr>
											<!-- <th style="text-align:center">开课号</th> -->
					            <th style="text-align:center">课程号</th>
					            <th style="text-align:center">课程名</th>
					            <th style="text-align:center">教师号</th>
					            <th style="text-align:center">教师名</th>
					            <th style="text-align:center">选课人数</th>
					        	</tr>
									</thead>
									<%
										String sql = "select O.open_id, C.cNum, cName, T.tNum, tName, count(DISTINCT S.sNum) as '选课人数' "
																	+ "from course C, `open` O, `select` S, teacher T "
																	+ "where O.open_id=S.open_id and C.cNum=O.cNum and T.tNum=O.tNum "
																	+ "GROUP BY C.cNum, cName, T.tNum "
																	+ "ORDER BY count(S.sNum) desc, cNum limit 5";
										ResultSet rs = MySQLDB.executeQuery(sql);
					        	while(rs.next()){
					        		String open_id = rs.getString(1);
					        		String cNum = rs.getString(2);
					        		String cName = rs.getString(3);
					        		String tNum = rs.getString(4);
					        		String tName = rs.getString(5);
					        		String count = rs.getString(6);
					        %>
					        		<tr>
						  					<%-- <td><input type="hidden" name="" value="<%= open_id %>"><%= open_id %></td> --%>
						  					<td><input type="hidden" name="" value="<%= cNum %>"><%= cNum %></td>
						  					<td><input type="hidden" name="" value="<%= cName %>"><%= cName %></td>
						  					<td><input type="hidden" name="" value="<%= tNum %>"><%= tNum %></td>
						  					<td><input type="hidden" name="" value="<%= tName %>"><%= tName %></td>
						  					<td><input type="hidden" name="" value="<%= count %>"><%= count %></td>
						  				</tr>
					 				<%
										}
									%>
								</table>
					    </div>
					    <div class="layui-tab-item">
							<table class="layui-table" lay-skin="line" style="text-align:center">
								<thead>
									<tr>
										<th style="text-align:center">开课号</th>
				            <th style="text-align:center">课程号</th>
				            <th style="text-align:center">课程名</th>
				            <th style="text-align:center">教师号</th>
				            <th style="text-align:center">教师名</th>
				            <th style="text-align:center">平均绩点</th>
				        	</tr>
								</thead>
								<%
									sql = "select O.open_id, C.cNum, cName, T.tNum, tName, avg(grade) "
													+ "from course C, `open` O, `select` S, teacher T "
													+ "where O.open_id=S.open_id and C.cNum=O.cNum and T.tNum=O.tNum "
													+ "GROUP BY C.cNum, cName, T.tNum "
													+ "ORDER BY avg(grade) desc limit 5";
									rs = MySQLDB.executeQuery(sql);
				        	while(rs.next()){
				        		String open_id = rs.getString(1);
				        		String cNum = rs.getString(2);
				        		String cName = rs.getString(3);
				        		String tNum = rs.getString(4);
				        		String tName = rs.getString(5);
				        		String avgGrade = rs.getString(6);
			        	%>
			        		<tr>
					  			<%-- <td><input type="hidden" name="" value="<%= open_id %>"><%= open_id %></td> --%>
					  			<td><input type="hidden" name="" value="<%= cNum %>"><%= cNum %></td>
					  			<td><input type="hidden" name="" value="<%= cName %>"><%= cName %></td>
					  			<td><input type="hidden" name="" value="<%= tNum %>"><%= tNum %></td>
					  			<td><input type="hidden" name="" value="<%= tName %>"><%= tName %></td>
					  			<td><input type="hidden" name="" value="<%= avgGrade %>"><%= avgGrade %></td>
				  			</tr>
					 			<%
									}
								%>
							</table>								
						</div>
					    <div class="layui-tab-item">
					    	<table class="layui-table" lay-skin="line" style="text-align:center">
								<thead>
									<tr>
				            <th style="text-align:center">教师号</th>
				            <th style="text-align:center">教师名</th>
				            <th style="text-align:center">开课数</th>
				        	</tr>
								</thead>
								<%
									sql = "SELECT o.tNum,t.tName, count(0) AS 'class' FROM `open` o,teacher t where t.tNum = o.tNum GROUP BY o.tNum HAVING count(o.tNum) > 0 ORDER BY count(o.tNum) DESC,tNum LIMIT 5";
									rs = MySQLDB.executeQuery(sql);
				        	while(rs.next()){
				        		String tNum = rs.getString("tNum");
				        		String tName = rs.getString("tName");
				        		String course = rs.getString("class");
			        	%>
			        		<tr>
						  			<td><%= tNum %></td>
						  			<td><%= tName %></td>
						  			<td><%= course %></td>
					  			</tr>
					 			<%
									}
								%>
							</table>
						</div>
					    <div class="layui-tab-item">
						    <table class="layui-table" lay-skin="line" style="text-align:center">
									<thead>
										<tr>
					            <th style="text-align:center">学号</th>
					            <th style="text-align:center">姓名</th>
					            <th style="text-align:center">平均成绩</th>
					        	</tr>
									</thead>
									<%
										sql = "SELECT S.sNum, sName, avg(grade) as avgGrade FROM `select` s, student st where st.sNum=s.sNum GROUP BY st.sNum ORDER BY avg(grade) DESC, sNum LIMIT 5";
										rs = MySQLDB.executeQuery(sql);
					        	while(rs.next()){
					        		String sNum = rs.getString("S.sNum");
					        		String sName = rs.getString("sName");
					        		String avgGrade = rs.getString("avgGrade");
				        	%>
				        		<tr>
							  			<td><%= sNum %></td>
							  			<td><%= sName %></td>
							  			<td><%= avgGrade %></td>
						  			</tr>
						 			<%
										}
									%>
								</table>
					    </div>
					  </div>
					</div>
				</div>
				<blockquote class="layui-elem-quote">
					温馨提示：现在是2016-2017学年春季学期。<br>
					您的身份是：学生。
				</blockquote>
			</div>
			
	</div>
	<script>
		layui.use('element', function(){
		  var $ = layui.jquery,
		  		element = layui.element(); 
			var active = {
			  tabChange: function(){
			    element.tabChange('demo', '22');
			  }
			};
			$('.site-demo-active').on('click', function(){
			  var othis = $(this), type = othis.data('type');
			  active[type] ? active[type].call(this, othis) : '';
			});
  	});
	</script>
</body>
		
		<script src="/course/layui/layui.js"></script>
		<script src="/course/layui/lay/dest/layui.all.js"></script>  
</html>