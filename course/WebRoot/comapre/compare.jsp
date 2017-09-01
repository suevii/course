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
    <jsp:include page="../student/head.jsp"/>
		<jsp:include page="../student/left.jsp"/>
    <div class="layui-body site-demo">

 		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  		  <legend>课程比较</legend>
		</fieldset>
		<form class="layui-form" action="">
		   <div class="layui-form-item">
		     <div class="layui-inline">
			   <label class="layui-form-label">课程号</label>
				<div class="layui-input-inline">
				  <input type="text" name="cnum" class="layui-input">
				</div>
			 </div>
		     <div class="layui-inline">
			  <label class="layui-form-label">选择学期</label>
				<div class="layui-input-inline">
				  <select name="term" lay-search="">
				    <option value="%">全部学期</option>
				<%
					String sql = "select DISTINCT cTerm from `open`";
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
		 	if(request.getParameter("cnum") != null){
		 		String cnum = request.getParameter("cnum");
		 		String term = request.getParameter("term");
		 		sql = "select O.open_id, C.cNum, cName, T.tNum, tName, avg(grade) as 'avg', "
		 				+ "count(DISTINCT S.sNum) as people,o.cTerm from course C, `open` O, `select` S, teacher T "
		 				+ "where O.open_id=S.open_id and C.cNum=O.cNum and T.tNum=O.tNum "
		 				+"and c.cNum = '"+cnum+"' and o.cTerm like '"+term+"'"
		 				+"GROUP BY o.cTerm, t.tNum ORDER BY o.cTerm DESC";
				rs = DB.executeQuery(sql);
				Select s = new Select();
				Teacher t = new Teacher();
				Open o = new Open();
				Course c = new Course();
				
		%>
		<table border="1" class="layui-table" lay-even lay-skin="line">
		  <thead>
		  	<tr>
		  		<th>课程号</th>
		  		<th>课程名</th>
		  		<th>教师号</th>
		  		<th>教师名</th>
		  		<th>平均成绩</th>
		  		<th>选课人数</th>
		  		<th>学期</th>
		  	</tr>
		  </thead>
  		<tbody>
		<%if(!rs.next()){%>
		  <tr style="text-align: center;">查不到(・ω・)凸</tr>
		<%
			}else{
				rs = DB.executeQuery(sql);
			while (rs.next()) {
				c.setCnum(rs.getString("cNum"));
				c.setCname(rs.getString("cName"));
				t.setTnum(rs.getString("tNum"));
				t.setTname(rs.getString("tName"));
				o.setCterm(rs.getInt("cTerm")); 
				int avg = rs.getInt("avg");
				int people = rs.getInt("people");
	 	%>
			<tr>
			  <td><%=c.getCnum() %></td>
			  <td><%=c.getCname() %></td>
			  <td><%=t.getTnum() %></td>
			  <td><%=t.getTname() %></td>
			  <td><%=avg %></td>
			  <td><%=people %></td>
			  <td><%=o.getRealTerm() %></td>
			</tr>
			
			<%} 
		}%>
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