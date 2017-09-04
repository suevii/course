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

		<script src="/course/js/echarts.js"></script>
</head>
<style type="text/css">
	.quote{
		padding: 0 15px !important;
		background-color: #f0f2f5;
	}
	.flex-box-r{
		display: flex;
		flex-direction: row;
	}
	.flex-box-c{
		display: flex;
		flex-direction: column;
	}
	.flex-box-item{
		flex: 1;
		background-color: white;
	    padding: 20px;
	    margin: 20px;
	    border-radius: 20px;
	    box-shadow: 5px 5px 5px #888888;
	}
	.card{
		width: 50%;
		background-color: white;
	    padding: 20px;
	    margin: 20px;
	    border-radius: 20px;
	    box-shadow: 5px 5px 5px #888888;
	}
</style>
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
			<div class="layui-body site-demo" style="padding-top: 30px; background-color: #f0f2f5; bottom:0px;">
				<fieldset class="layui-elem-field layui-field-title">
		  			<legend><%=name %>，欢迎你登录课程项目管理系统！</legend>
				</fieldset>
				<blockquote class="layui-elem-quote quote">
					温馨提示：现在是2016-2017学年春季学期。
				</blockquote>
				
				<div class="panel panel-default flex-box-c" style="margin:30px;">
					<div class="flex-box-r">
						<div class="flex-box-item">
							<div id="popularCourse"  style="width: 420px;height:280px;"></div>
						</div>
						<div class="flex-box-item">
							<div id="highScore"  style="width: 420px;height:280px;"></div>
						</div>
					</div>
					<div class="flex-box-r">
						<div class="flex-box-item">
							<div id="goodTeachers"  style="width: 420px;height:280px;"></div>
						</div>
						<div class="flex-box-item">
							<div id="goodStudents"  style="width: 420px;height:280px;"></div>
						</div>
					</div>
					<!-- <div class="flex-box-r">
					    <div class="flex-box-item"> -->
					    	<!-- <h3>人气课程</h3> -->
					    	<!-- <table class="layui-table" lay-skin="line" style="text-align:center">
									<thead>
										<tr>
											<!-- <th style="text-align:center">开课号</th> -->
					            <!-- <th style="text-align:center">课程号</th>
					            <th style="text-align:center">课程名</th>
					            <th style="text-align:center">教师号</th>
					            <th style="text-align:center">教师名</th>
					            <th style="text-align:center">选课人数</th>
					        	</tr>
									</thead> -->
									<%
										String sql = "select O.open_id, C.cNum, cName, T.tNum, tName, count(DISTINCT S.sNum) as '选课人数' "
																	+ "from course C, `open` O, `select` S, teacher T "
																	+ "where O.open_id=S.open_id and C.cNum=O.cNum and T.tNum=O.tNum "
																	+ "GROUP BY C.cNum, cName, T.tNum "
																	+ "ORDER BY count(S.sNum) desc, cNum limit 5";
										ResultSet rs = MySQLDB.executeQuery(sql);
										List<String> cNamePopularList = new ArrayList<String>();
										List<String> tNamePopularList = new ArrayList<String>();
										List<String> countPopularList = new ArrayList<String>();
					        	while(rs.next()){
					        		String open_id = rs.getString(1);
					        		String cNum = rs.getString(2);
					        		String cName = rs.getString(3);
					        		cNamePopularList.add(rs.getString(3));
					        		String tNum = rs.getString(4);
					        		String tName = rs.getString(5);
					        		tNamePopularList.add(rs.getString(5));
					        		String count = rs.getString(6);
					        		countPopularList.add(rs.getString(6));
					        %>
					        		<!-- <tr>
						  					<%-- <td><input type="hidden" name="" value="<%= open_id %>"><%= open_id %></td> --%>
						  					<td><input type="hidden" name="" value="<%= cNum %>"><%= cNum %></td>
						  					<td><input type="hidden" name="" value="<%= cName %>"><%= cName %></td>
						  					<td><input type="hidden" name="" value="<%= tNum %>"><%= tNum %></td>
						  					<td><input type="hidden" name="" value="<%= tName %>"><%= tName %></td>
						  					<td><input type="hidden" name="" value="<%= count %>"><%= count %></td>
						  				</tr> -->
					 				<%
										}
										String[] cNamePopularArr = new String[cNamePopularList.size()];
										for(int i=0;i<cNamePopularList.size();i++){
											cNamePopularArr[i]=cNamePopularList.get(i);
										}
										String[] tNamePopularArr = new String[tNamePopularList.size()];
										for(int i=0;i<tNamePopularList.size();i++){
											tNamePopularArr[i]=tNamePopularList.get(i);
										}
										String[] countPopularArr = new String[countPopularList.size()];
										for(int i=0;i<countPopularList.size();i++){
											countPopularArr[i]=countPopularList.get(i);
										}
									%>
								<!-- </table> -->
					    <!-- </div> -->
					    

					    <!-- <div class="flex-box-item">
					    	<h3>高分课程</h3>
							<table class="layui-table" lay-skin="line" style="text-align:center">
								<thead>
									<tr>
										<!-- <th style="text-align:center">开课号</th> -->
				            <!-- <th style="text-align:center">课程号</th>
				            <th style="text-align:center">课程名</th>
				            <th style="text-align:center">教师号</th>
				            <th style="text-align:center">教师名</th>
				            <th style="text-align:center">平均成绩</th>
				        	</tr>
								</thead> -->
								<%
									sql = "select O.open_id, C.cNum, cName, T.tNum, tName, avg(grade) "
													+ "from course C, `open` O, `select` S, teacher T "
													+ "where O.open_id=S.open_id and C.cNum=O.cNum and T.tNum=O.tNum "
													+ "GROUP BY C.cNum, cName, T.tNum "
													+ "ORDER BY avg(grade) desc limit 5";
									rs = MySQLDB.executeQuery(sql);
									List<String> openIdList = new ArrayList<String>();
									List<String> cNumList = new ArrayList<String>();
									List<String> cNameList = new ArrayList<String>();
									List<String> tNameList = new ArrayList<String>();
									List<String> cAvgGradeList = new ArrayList<String>();
				        	while(rs.next()){
				        		String open_id = rs.getString(1);
				        		openIdList.add(rs.getString(1));
				        		String cNum = rs.getString(2);
				        		cNumList.add(rs.getString(2));
				        		String cName = rs.getString(3);
				        		cNameList.add(rs.getString(3));
				        		String tNum = rs.getString(4);
				        		String tName = rs.getString(5);
				        		tNameList.add(rs.getString(5));
				        		String avgGrade = rs.getString(6);
				        		cAvgGradeList.add(rs.getString(6));


			        	%>
			        		<!-- <tr>
					  			<%-- <td><input type="hidden" name="" value="<%= open_id %>"><%= open_id %></td> --%>
					  			<td><input type="hidden" name="" value="<%= cNum %>"><%= cNum %></td>
					  			<td><input type="hidden" name="" value="<%= cName %>"><%= cName %></td>
					  			<td><input type="hidden" name="" value="<%= tNum %>"><%= tNum %></td>
					  			<td><input type="hidden" name="" value="<%= tName %>"><%= tName %></td>
					  			<td><input type="hidden" name="" value="<%= avgGrade %>"><%= avgGrade %></td>
				  			</tr> -->
					 			<%
									}

									String[] openIdArr = new String[openIdList.size()];
									for(int i=0;i<openIdList.size();i++){
										openIdArr[i]=openIdList.get(i);
									}
									String[] cNumArr = new String[cNumList.size()];
									for(int i=0;i<cNumList.size();i++){
										cNumArr[i]=cNumList.get(i);
									}
									String[] cNameArr = new String[cNameList.size()];
									for(int i=0;i<cNameList.size();i++){
										cNameArr[i]=cNameList.get(i);
									}
									String[] tNameArr = new String[tNameList.size()];
									for(int i=0;i<tNameList.size();i++){
										tNameArr[i]=tNameList.get(i);
									}
									String[] cAvgGradeArr = new String[cAvgGradeList.size()];
									for(int i=0;i<cAvgGradeList.size();i++){
										cAvgGradeArr[i]=cAvgGradeList.get(i);
									}
								%>
								
							<!-- </table>


							
						</div>
						<div class="flex-box-item">
					    	<h3>高分课程2</h3>
							<table class="layui-table" lay-skin="line" style="text-align:center">
								<thead>
									<tr>
										<!<!-- <th style="text-align:center">开课号</th> -->
				            <!-- <th style="text-align:center">课程号</th>
				            <th style="text-align:center">课程名</th>
				            <th style="text-align:center">教师号</th>
				            <th style="text-align:center">教师名</th>
				            <th style="text-align:center">平均成绩</th>
				        	</tr>
								</thead> -->
								<%
									sql = "select O.open_id, C.cNum, cName, T.tNum, tName, avg(grade) "
													+ "from course C, `open` O, `select` S, teacher T "
													+ "where O.open_id=S.open_id and C.cNum=O.cNum and T.tNum=O.tNum "
													+ "GROUP BY C.cNum, cName "
													+ "ORDER BY avg(grade) desc limit 5";
									rs = MySQLDB.executeQuery(sql);
									List<String> tCNumList = new ArrayList<String>();
									List<String> tAvgGradeList = new ArrayList<String>();
				        	while(rs.next()){
				        		String open_id = rs.getString(1);
				        		String cNum = rs.getString(2);
				        		tCNumList.add(rs.getString(2));
				        		String cName = rs.getString(3);
				        		String tNum = rs.getString(4);
				        		String tName = rs.getString(5);
				        		String avgGrade = rs.getString(6);
				        		tAvgGradeList.add(rs.getString(6));

				        		
			        	%>
			        		<!-- <tr>
					  			<%-- <td><input type="hidden" name="" value="<%= open_id %>"><%= open_id %></td> --%>
					  			<td><input type="hidden" name="" value="<%= cNum %>"><%= cNum %></td>
					  			<td><input type="hidden" name="" value="<%= cName %>"><%= cName %></td>
					  			<td><input type="hidden" name="" value="<%= tNum %>"><%= tNum %></td>
					  			<td><input type="hidden" name="" value="<%= tName %>"><%= tName %></td>
					  			<td><input type="hidden" name="" value="<%= avgGrade %>"><%= avgGrade %></td>
				  			</tr> -->
					 			<%
									}
									String[] tCNumArr = new String[tCNumList.size()];
									for(int i=0;i<tCNumList.size();i++){
										tCNumArr[i]=tCNumList.get(i);
									}
									String[] tAvgGradeArr = new String[tAvgGradeList.size()];
									for(int i=0;i<tAvgGradeList.size();i++){
										tAvgGradeArr[i]=tAvgGradeList.get(i);
									}
									String[] aAvgGradeArr = new String[tAvgGradeList.size()];
									for(int i=0;i<cNumList.size();i++){
										for(int y=0;y<tCNumList.size();y++){
											if(cNumArr[i].equals(tCNumArr[y])){	
												aAvgGradeArr[i]=tAvgGradeArr[y];
											}
										}
									}
								%>
							<!-- </table>								
						</div>
					</div> -->
					<!-- <div class="flex-box-r">
					    <div class="flex-box-item">
					    	<h3>优秀教师</h3>
					    	<table class="layui-table" lay-skin="line" style="text-align:center">
								<thead>
									<tr>
				            <th style="text-align:center">教师号</th>
				            <th style="text-align:center">教师名</th>
				            <th style="text-align:center">开课数</th>
				        	</tr>
								</thead> -->
								<%
									sql = "SELECT o.tNum,t.tName, count(0) AS 'class' FROM `open` o,teacher t where t.tNum = o.tNum GROUP BY o.tNum HAVING count(o.tNum) > 0 ORDER BY count(o.tNum) DESC,tNum LIMIT 5";
									rs = MySQLDB.executeQuery(sql);
									List<String> tNameTeacherList = new ArrayList<String>();
									List<String> courseTeacherList = new ArrayList<String>();
				        	while(rs.next()){
				        		String tNum = rs.getString("tNum");
				        		String tName = rs.getString("tName");
				        		tNameTeacherList.add(rs.getString(2));
				        		String course = rs.getString("class");
				        		courseTeacherList.add(rs.getString("class"));
			        	%>
			        		<!-- <tr>
						  			<td><%= tNum %></td>
						  			<td><%= tName %></td>
						  			<td><%= course %></td>
					  			</tr> -->
					 			<%
									}
									String[] tNameTeacherArr = new String[tNameTeacherList.size()];
									for(int i=0;i<tNameTeacherList.size();i++){
										tNameTeacherArr[i]=tNameTeacherList.get(i);
									};
									String[] courseTeacherArr = new String[courseTeacherList.size()];
									for(int i=0;i<courseTeacherList.size();i++){
										courseTeacherArr[i]=courseTeacherList.get(i);
									}
								%>
							<!-- </table>
						</div>
					    <div class="flex-box-item">
					    	<h3>优秀学生</h3>
						    <table class="layui-table" lay-skin="line" style="text-align:center">
									<thead>
										<tr>
					            <th style="text-align:center">学号</th>
					            <th style="text-align:center">姓名</th>
					            <th style="text-align:center">平均成绩</th>
					        	</tr>
									</thead> -->
									<%
										sql = "SELECT S.sNum, sName, avg(grade) as avgGrade FROM `select` s, student st where st.sNum=s.sNum GROUP BY st.sNum ORDER BY avg(grade) DESC, sNum LIMIT 5";
										rs = MySQLDB.executeQuery(sql);
										List<String> sNameStudentList = new ArrayList<String>();
										List<String> avgGradeStudentList = new ArrayList<String>();
					        	while(rs.next()){
					        		String sNum = rs.getString("S.sNum");
					        		String sName = rs.getString("sName");
					        		sNameStudentList.add(rs.getString(2));
					        		String avgGrade = rs.getString("avgGrade");
					        		avgGradeStudentList.add(rs.getString(3));
				        	%>
				        		<!-- <tr>
							  			<td><%= sNum %></td>
							  			<td><%= sName %></td>
							  			<td><%= avgGrade %></td>
						  			</tr> -->
						 			<%
										}
										String[] sNameStudentArr = new String[sNameStudentList.size()];
										for(int i=0;i<sNameStudentList.size();i++){
											sNameStudentArr[i]=sNameStudentList.get(i);
										};
										String[] avgGradeStudentArr = new String[avgGradeStudentList.size()];
										for(int i=0;i<avgGradeStudentList.size();i++){
											avgGradeStudentArr[i]=avgGradeStudentList.get(i);
										}
									%>
								<!-- </table>
					    </div>
					</div> -->
				<!-- </div> -->
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
	<script>
			console.log("...");
		  	var openId = <%= openIdArr[0] %>;
		  	console.log(openId);
		  	var popularCourseChart = echarts.init(document.getElementById('popularCourse'));
		  	var spirit = 'image://data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHUAAACUCAYAAACtHGabAAAACXBIWXMAABcSAAAXEgFnn9JSAAAKTWlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVN3WJP3Fj7f92UPVkLY8LGXbIEAIiOsCMgQWaIQkgBhhBASQMWFiApWFBURnEhVxILVCkidiOKgKLhnQYqIWotVXDjuH9yntX167+3t+9f7vOec5/zOec8PgBESJpHmomoAOVKFPDrYH49PSMTJvYACFUjgBCAQ5svCZwXFAADwA3l4fnSwP/wBr28AAgBw1S4kEsfh/4O6UCZXACCRAOAiEucLAZBSAMguVMgUAMgYALBTs2QKAJQAAGx5fEIiAKoNAOz0ST4FANipk9wXANiiHKkIAI0BAJkoRyQCQLsAYFWBUiwCwMIAoKxAIi4EwK4BgFm2MkcCgL0FAHaOWJAPQGAAgJlCLMwAIDgCAEMeE80DIEwDoDDSv+CpX3CFuEgBAMDLlc2XS9IzFLiV0Bp38vDg4iHiwmyxQmEXKRBmCeQinJebIxNI5wNMzgwAABr50cH+OD+Q5+bk4eZm52zv9MWi/mvwbyI+IfHf/ryMAgQAEE7P79pf5eXWA3DHAbB1v2upWwDaVgBo3/ldM9sJoFoK0Hr5i3k4/EAenqFQyDwdHAoLC+0lYqG9MOOLPv8z4W/gi372/EAe/tt68ABxmkCZrcCjg/1xYW52rlKO58sEQjFu9+cj/seFf/2OKdHiNLFcLBWK8ViJuFAiTcd5uVKRRCHJleIS6X8y8R+W/QmTdw0ArIZPwE62B7XLbMB+7gECiw5Y0nYAQH7zLYwaC5EAEGc0Mnn3AACTv/mPQCsBAM2XpOMAALzoGFyolBdMxggAAESggSqwQQcMwRSswA6cwR28wBcCYQZEQAwkwDwQQgbkgBwKoRiWQRlUwDrYBLWwAxqgEZrhELTBMTgN5+ASXIHrcBcGYBiewhi8hgkEQcgIE2EhOogRYo7YIs4IF5mOBCJhSDSSgKQg6YgUUSLFyHKkAqlCapFdSCPyLXIUOY1cQPqQ28ggMor8irxHMZSBslED1AJ1QLmoHxqKxqBz0XQ0D12AlqJr0Rq0Hj2AtqKn0UvodXQAfYqOY4DRMQ5mjNlhXIyHRWCJWBomxxZj5Vg1Vo81Yx1YN3YVG8CeYe8IJAKLgBPsCF6EEMJsgpCQR1hMWEOoJewjtBK6CFcJg4Qxwicik6hPtCV6EvnEeGI6sZBYRqwm7iEeIZ4lXicOE1+TSCQOyZLkTgohJZAySQtJa0jbSC2kU6Q+0hBpnEwm65Btyd7kCLKArCCXkbeQD5BPkvvJw+S3FDrFiOJMCaIkUqSUEko1ZT/lBKWfMkKZoKpRzame1AiqiDqfWkltoHZQL1OHqRM0dZolzZsWQ8ukLaPV0JppZ2n3aC/pdLoJ3YMeRZfQl9Jr6Afp5+mD9HcMDYYNg8dIYigZaxl7GacYtxkvmUymBdOXmchUMNcyG5lnmA+Yb1VYKvYqfBWRyhKVOpVWlX6V56pUVXNVP9V5qgtUq1UPq15WfaZGVbNQ46kJ1Bar1akdVbupNq7OUndSj1DPUV+jvl/9gvpjDbKGhUaghkijVGO3xhmNIRbGMmXxWELWclYD6yxrmE1iW7L57Ex2Bfsbdi97TFNDc6pmrGaRZp3mcc0BDsax4PA52ZxKziHODc57LQMtPy2x1mqtZq1+rTfaetq+2mLtcu0W7eva73VwnUCdLJ31Om0693UJuja6UbqFutt1z+o+02PreekJ9cr1Dund0Uf1bfSj9Rfq79bv0R83MDQINpAZbDE4Y/DMkGPoa5hpuNHwhOGoEctoupHEaKPRSaMnuCbuh2fjNXgXPmasbxxirDTeZdxrPGFiaTLbpMSkxeS+Kc2Ua5pmutG003TMzMgs3KzYrMnsjjnVnGueYb7ZvNv8jYWlRZzFSos2i8eW2pZ8ywWWTZb3rJhWPlZ5VvVW16xJ1lzrLOtt1ldsUBtXmwybOpvLtqitm63Edptt3xTiFI8p0in1U27aMez87ArsmuwG7Tn2YfYl9m32zx3MHBId1jt0O3xydHXMdmxwvOuk4TTDqcSpw+lXZxtnoXOd8zUXpkuQyxKXdpcXU22niqdun3rLleUa7rrStdP1o5u7m9yt2W3U3cw9xX2r+00umxvJXcM970H08PdY4nHM452nm6fC85DnL152Xlle+70eT7OcJp7WMG3I28Rb4L3Le2A6Pj1l+s7pAz7GPgKfep+Hvqa+It89viN+1n6Zfgf8nvs7+sv9j/i/4XnyFvFOBWABwQHlAb2BGoGzA2sDHwSZBKUHNQWNBbsGLww+FUIMCQ1ZH3KTb8AX8hv5YzPcZyya0RXKCJ0VWhv6MMwmTB7WEY6GzwjfEH5vpvlM6cy2CIjgR2yIuB9pGZkX+X0UKSoyqi7qUbRTdHF09yzWrORZ+2e9jvGPqYy5O9tqtnJ2Z6xqbFJsY+ybuIC4qriBeIf4RfGXEnQTJAntieTE2MQ9ieNzAudsmjOc5JpUlnRjruXcorkX5unOy553PFk1WZB8OIWYEpeyP+WDIEJQLxhP5aduTR0T8oSbhU9FvqKNolGxt7hKPJLmnVaV9jjdO31D+miGT0Z1xjMJT1IreZEZkrkj801WRNberM/ZcdktOZSclJyjUg1plrQr1zC3KLdPZisrkw3keeZtyhuTh8r35CP5c/PbFWyFTNGjtFKuUA4WTC+oK3hbGFt4uEi9SFrUM99m/ur5IwuCFny9kLBQuLCz2Lh4WfHgIr9FuxYji1MXdy4xXVK6ZHhp8NJ9y2jLspb9UOJYUlXyannc8o5Sg9KlpUMrglc0lamUycturvRauWMVYZVkVe9ql9VbVn8qF5VfrHCsqK74sEa45uJXTl/VfPV5bdra3kq3yu3rSOuk626s91m/r0q9akHV0IbwDa0b8Y3lG19tSt50oXpq9Y7NtM3KzQM1YTXtW8y2rNvyoTaj9nqdf13LVv2tq7e+2Sba1r/dd3vzDoMdFTve75TsvLUreFdrvUV99W7S7oLdjxpiG7q/5n7duEd3T8Wej3ulewf2Re/ranRvbNyvv7+yCW1SNo0eSDpw5ZuAb9qb7Zp3tXBaKg7CQeXBJ9+mfHvjUOihzsPcw83fmX+39QjrSHkr0jq/dawto22gPaG97+iMo50dXh1Hvrf/fu8x42N1xzWPV56gnSg98fnkgpPjp2Snnp1OPz3Umdx590z8mWtdUV29Z0PPnj8XdO5Mt1/3yfPe549d8Lxw9CL3Ytslt0utPa49R35w/eFIr1tv62X3y+1XPK509E3rO9Hv03/6asDVc9f41y5dn3m978bsG7duJt0cuCW69fh29u0XdwruTNxdeo94r/y+2v3qB/oP6n+0/rFlwG3g+GDAYM/DWQ/vDgmHnv6U/9OH4dJHzEfVI0YjjY+dHx8bDRq98mTOk+GnsqcTz8p+Vv9563Or59/94vtLz1j82PAL+YvPv655qfNy76uprzrHI8cfvM55PfGm/K3O233vuO+638e9H5ko/ED+UPPR+mPHp9BP9z7nfP78L/eE8/sl0p8zAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAABvgSURBVHja7J17dBPXnce/dzR6WH7IwTbYxPgBBJsAtgwJXcchCM5ZEtJwcHqaRxs4hXQh+4dT3O1hd9ukJ05LT/dsT4lTyO7JSbfrQHabbdqNE/qgTjcR5KTOsxjCK4QGGwgy2ARJtoSec/ePGUkzo9HLGj2MdTk62PLM6KffZ76/+7u/e2eGUEoxHduota0BQA+ATgAm0Z9GAPQD6K22HBnGDGxkOkIdtbb1AHgqwWYOAN3VliN9Baj5D7QPwDdS2GXrTAM7raCOWts6Abw6hV3bqi1HhmYKVGaa2dub5f0KUDOsUguA+inuvlpIrApQ86xZ0tzfXIB647UC1Hxr77m0zSi0Gwcq2bvO/K5b25nmYQrZbx4BLQfQf8Ch16d5KGsBav60fgD1JzwsBl3aqR7jxWrLEXsBan6otAfA6tDv37eVTOUwDvA14kKfmgdALZDVd094WHR/XpoqUMtMK+znZZlQ6EeHIZ19Cbd7yrx49uYJlGni2j4CoHMmlQdDjc3jftQU648HnXrc7tJhfZkX95T6sLQogFptEBf9Gpg03BulDP3vmTg7k7dKJXvXdQN4Zqr7064BUhin5tl4NB2gAI4WSg/5lyilGzLtBaR5BFUYvrQWkNwgUIWw+1QBx42lVLUyVXMBaR5AVTnsmoSixYxuOR3SkL3rGsDPnphUPKwDgJl2DQwXlJq7sGtS+ZgmAEMzWbE5UyrZu64TU1sZmEp7DUD3TFNtTqAKtd0hTH0hWartEIBe2jXQX4Ca2eQoF0OYESHk993I6s06VCE5OpcH3/2QALifdg3YC1DTg9qH1C6byEZ7UYDbX4CaOlALgLfy2B83RHjONlQrRMtT8rxN2+Qqa1CngUrjqbdXUK+9AHX6qlSpOQS4vfkONytQs1RoKMAVWrbKhL030IjBJIyxh4WlNzNPqdO4L02lz91CuwasM0mpPbixWz2At8jedb1C+fPGVuoMUGleqjbTSu3GzGoh1fbckErNoxpvLosXnbnIkDOp1B7M7LYagFVYVDf9lZroWpgZ1hwALLRrYGi6K7WzAFQyrs2qYjMFtbvAMndgVYcqGF5YaZ9DsExBpVkH25fpIkUmoHYW2MVtreCvv50eUIXZmEKClMRwJ5MFCrWVuqXAK+n2VKYWnKs2ThX6iWsFVim1EfCXiNjzVamWAqOUWz0yUHlTE2ohQZpa26H2MKcANT9ab95BFTr8QtabXjasWvel1n2U8rY/vcPviXrvOKuDk+Tdzd561PKjKtkv2btuCDksDS4J+NDh82Ae58fSgA9L/T6YKJdwPwdhcFyrwwWGxQWNFu/oDPiz1pBLsGvUWDWRNtRcDGXKKIf1Xjfu9bpwh8+TFMBU2js6A/6gK8bv9UZc1GT1pnCHaNeAJR+gdiJLa3of8kziXq8L673urHn5OKvDy4ZSvFxUkq2Q3Zbu3KsaVpozrcqdLjs+HRvBHudYVoECwNKAD7smr+Kj8Qv4mXMMtcFApj+yOx+UakUGLqcooxweczux3e1QPbym2142lOBfi2/KVGh2AGhIp8qUl0p9yDOJj8YvYKfrWt4BBYCHPZN464vPsdNlz8ThTemO+Zk0Vdqg5vi0NhjAq3Yb9jjHcFPJrLweWJooh52ua/jo6gXFYVOaLXdQ1VTpQ8LZ3+HzgKmsg/HBXWAbl+cEGNEZk952XjCA/ms2tVW7MZ2J9LyA+sPJq9jjHIOJcjzQjd8D0RnBNqzICVRty93QNt2ZfAXnlnbsdF3Dq3YbytTrLjqnJdQyyuFVuw2PuZ28MSKgAKBtXgWmoi7rULmrIzCs3Z40WMZUDcPa7ejwedB/zYYlAZ8aZlhyBbU8HaD912zo8HkUgYZa0drtWYdKhWFTsmC5qyPQNt0JbfMqLA341AKbM6ir0wG6VPjiTGmlItAQbMOabVmFGrx0OvxzMmDDJ8GabWAbV8AkfL80wdYLiWhOhjRpASV6I4rWd8dNTrTNq1Lq49RuicBy4+dF224DU1mnFlhzVqFOdapo18TVMFAA0HdsSqrfTKWPEzd9xyNgSiunoNZTUZ8fK2JQn1uSORet3Q6iN8JEOexxjqWTPJnzXqk7XXY87JmMZI2NK1ICZVi7Hbrb7k8tk21aBeMDu1JOuKhCOVLbvComWLFamYq6sJ1LAz7scY5NG6gpJUl3+D3Y6YpM5jCllTCsTb2v1N9+PwxrtiU1liQ6I4iefxU/uCulEygogpQMWOpzSX7XtdwNzdzFAID1Xje2Cxl+NhLRdKAmfRaVCWFIGhY3pTTIlzvWuPF7CdXHVNZFKV3f8UhyH+Jzx/18OVilk8CwdhuInv+OuyavTqV/XZ1tqCmE3WuYJ5rdYBtXpF0tYirrUPzgrrjhWFMZfedZXcvdKLpnR8ITKjg+kvDEEoNVCtdMaSV0LXdH8onJqxn1s8c22OCxDXZnHGptMBAuLoSy3aTVkmQ4Ln5gFzRzFR6EHAMc27iCV3qcBIpOjCcVMUJguavKJ4HutvvDn9Ph8+AhUU6RZELakATMco9tsAf8PZQ7Mw51z8RYlFKmko0mUq1x4/dQdM8OybHZm5vj7xMngeKSgCoGS+PM8+o7NoV//kdXyotEGhIA3QL+Au+nIEyuZBRqaO2QWKVaUThSu7GNK1C8aTcMa7aBKa0EKa2Kr4IECVQqYHVxvhfbuDycNM0LBlJWawyYZo9tcAjAf0I6UzbECHG4IRNOfsztUC05SjWRKt60O+mIECuBohNjKZ1QibqJNNQqD7W9AI5AebGfnRHkfc5jG+zz2AbL1XJsGeUkY1KmtDKnVaFETSmBijWsmUrTzG2WqPWeKSzL8dgGLUK/uSPOZnZGiMcAf7fsYaHDTbs9fF0aYjIZdtUM3+IEiqq8Hkocor/mmZiKOt9C4odJDDGGmvZh0RsmAE95bIPDHttgZ1pQRUYTvRHa5lVxyjc0uVcWmjiBCme0KtnHNi4PnzDrve6kyodfq2tdCMCaQJ3iNhwrUaoH8KrHNtg/lf62NhiQ1Hd1LXdH96VTgZUlwERvRPEDPwTbsFx1+3S3fyVSZfMlXgazud7cixQWyhtq2sNQYz1MdiOAIY9tsFtJ5rEO3CFbs8M2rUoeSrJnfyYAy46pbVqlun1s4/JwlanDfz2hSWtmzy9O4RscEg9p7HE2NAF4xmMbtMoSqZj7LA14Jf0UU1Kh7ACJg8C/QKSv0PuUIuZy1nThxto/A/YRnTGcKXf4Ulyw5k+45nhIDHUoyTpkUn2tOPRqF92p8B1DX1JwDCFRvop+EZCwE2M4cCpgFfbJtH2hhGlpglpwnTGiIc4xCf9nF1OCOpykC0xCX9sb70Ke8BKVkkpJjZcKZzwJOYp/N2ECcnH4HM6cOImLI+dkDlRwXjzFJFCn3L6r42M4c/Ikzpw4kWSiRJOyj8yaF55siFfkry/moVK3B953joAxlST6VlYgcinjUIrn9w6PbdBCQJwUtEw+Po0akIdCD4QzPhTOFJVChHjG/7/v+efx3tuH+V8BLGy+FX//D99GkbGEdx4VHUM4UUjouOETJ4E6Fez79b59ePOPB4VjAbX19eh+4kkUGYsl9sVJt+Lap120Ct7x/4q7WL3VVA34A/C+fxxEy0JTHbeYcjQ0kmGmCBUAWldW1Oriht7mOyNhLORgpUSDRl403H9R/O5/f4P33z4s2ebsqZP43a9/E1E4RP1csgqN+l1q39EPP8BbBw8KQPi3L46M4PnduyX2UZHd0REgvn2hCBavX603lMHzzhCocxKauppE36wvPCwT0mB7nAyY76M/iY7Qt5RUxLyYk6moAzNrnuAwRH9RsUMER1BKQUTArQcPil0Sbm/98aDUeaGwJwebCHIYqNS+N0WfC1F3evb0KXw+MqwcejkqBZzAPqa0MuF88K1Xg6DOSYDVQDu/NhHUfglUcTyO1YK2cQQujEqlWl6tUA/TCsOBO6UOi1ImD5FSitA/yXuUwuN2S2CK85IzJ09KwdEkwEb9rGzfX0+dCn8uodLPd0+6wvZF+kzhG4Rs5xS6FwX7FIdMotY+zodmdsE8QBv3YqxD4iJS0lDZBbXwHzmN4Ghk5qLFFB0SiKEEoOBX1xNEweS/sAARsuFCjDEgUVBrRWVVRPhKjosXdpWAiuybVVkZ+7MV7KRi+wWaoTAdz754CwU6CJ8kkSJ9MiqVlHYZUSWiH/xldMpQqysBVgPfX06Bc/B13buqootNTJGJDy1lldEOE37mVSlyBCcKX1zk99p5dSBU6lQCYFZFJWZVVkSGHnLHxVOoJB9Ttu+W5sVRnxl61dbVSmwM2yyyhYTUm8A+prQSmjkLFP19JykHWA10K5clo1KrIlR5XI5qWhaamiogEIT3nSNhsC0mWQjW6qFdskaWPEQcRiD6khwncgbHv0Sd7fqNnYrh96uPPCJ0UxFVSBQR+iQFwDSk0jj23dv5FRQZjfzniU6qezZ2oqjIKMvsOGmfynGioVFi+yZMcxTdfS9TBe2yW5IZxkRNwDCxMihFrk0NAKsBAkH4jpwG/IEotb49PgJ2/u2SpEjssPCXk4csmUrBUSw1t+GbXY+HFVs7rw5/17UDy9qWR1QBCknAFY0XSbxhSxz7ZlVW4Fv/9F20mJeDEOCmigrc//DXsX7DRol9NKxWMWBIVZvAvmMKM0FlhMVtFgvYedWJgD4rVymfB8hCkzCb3hovCw4ImTApK8EbC4rw4Pu/kmxz/f6nopMisULlMOVhWR4lCRG6IiJKSUlkoK/wXsSNVCxIHipo3tj3pTf/HccclyXH3DSvFS+s/EoioCMAzMLIJa5SgQR339I2NYCp4FdPUOck1l2KHjwfHh9OyWGhzBFcrCREllQhOqGiMlUGvNdx6aP38PEv9+PM738Lj8PO93VEGnZzZV/oHTlQANiceKWlA0CnElBFqIaa9r5QtT9W069cBlLGx3pudBxfNt4s+fsx+6jEb8oDc1FJjxP3q5AmIUKfxf9J7jhxZKXhvizg9eLjl/fjszffgOPiCK6cPIpzb74R3ZfmyL6wn5yjivVepQRUBtRiqGmPWTCKNZ/aHfc80bIwdJjDYNd7SqX1KsdotOfCYV7mMPngnRMlSxwn6ns5IMpxkCpMaJ+9OQDXlSuRAEkpNHqDtNacQ/vCEe3KsNL8aaKpNXM8oDGhCjs9nRDs6hVgmxpwn0ypB2yno8Zt8moLhWxaCzG2lTiPd5xoAIgoOpRi7MSxyN8IMHtJKxatv08x9ObCvtBnHB6PfsDW5oY2xbougK2GmnaLbKVKSkqFoaa9J1HpMNTHzlm3ChtqImtsHX4vjjlGlepy0jM4/L/SeE+kEHHBIJRBywsBMWLq3LbbeaAgSZQOs2efw+/BAdsn0gSp3oz6IlMoxB4ShNVmqGk3C91iUi3Rul9LMmCVwsb+80dFJ7i0EEBlWWV00UBh1QCBgnIgmjER9fllkWWwprr6eAhzYh8AvC4DCgAvf3Zk+bs3dzCGmvZyQZU9iUJtylCF7MoC4MVEhfENNc2SSd19F4YUx4lSb5LoaTgiSmaIOIGR9ns0TtVo8f1fham2HrNvbUHFLU0KfiXRb2XRPv6kj2J1aKj7T1OZLUtZqTDUtNsNNe1bAKxJlBWL1er0e7H/wtHEsyREoXQnfkNxvlWxuhuOksVV1Vj28CYsuve+WGkuSLKrIjJg34jbjrdlF2BpOPo0VGpJX3ZhqGm3GmraLQDaADwrDH4l7fGFfyP5fdfpQ6lZk51VoLFcnjX75H5hKPad3fEna9ahijNjQ017t6GmvcFwcwdDg9xa6g+sRSCwtozRPdpoLB8IbXv+uiNKrRK/kOhxY7jiQoTKT2jyOlyJoYgU36L3JUnSoTEYZdq+8247XpL6xFHsU0+lQJp35rYCuLVulVUHQFOzklwqcxxyPnrzYRg1Z0Pb/OiTw9hc2yI4iIqKdwQAF3EEhXR1BES/y5alhH0tfp+QlIQZVUTMkn07jw/IVfrs6Z+eGPapCDXtq97GwK8VnQC/Iv/Pz50dZij2idX6ozNvi6REQMU10JAHCJE6SfIzJNtQSWGepBYyFQBE3susfYfHR3BgVJL1joy+MPo0bKLhhgq3SlfvUkabHRzDgGVZLL3s+Y54bvZHZw7j2MRlSYgMF7mVQljoxYgcxjDSArncqZAVzaO4UkWpUrl0M2Sfw+/B9iOvS4deAfroBMPgKiZgBLAkH5RqoZRWATACuIoJ6HU6GAjBb188Z2c5+gPxttuGDsjCFeE/nQjOYBgF1YW2Y8JnPREvHIISWJEEhTtpE8iGjlKZRqs4A/btOnMY5687xGH3B5f+bcQ6cQkoxSTG8in8zhZCcCkmKTfKIMiylDIMPfnj4z8jwOHQdh87L2PnyQGJFIjccQT82c8wojM/ohCeEZEpR2pPwOuRqZEK6pGGzqufnoHHYVdMctS2b/+Fo3jus/cjVTiKE5d2f/qDMYZB1fUr4dPNmi9QxYYYXaOgDAMty4LVaDDLFXiUAQlf/vbcuQ+w//NjUY4jjEhZktXwDAjDKM9JylfPg8B58Tw+fGFvBKy8jk546B+/vB+nXnsFH/38OXidjlAPKJsPVce+YxNXsPNEJDkyBYGjQxptRdvC8lk6HeyTE+H76lhUevBe2lAlIXjShoBXB71GQzUaDR3sPTWiC3Bbxds/dvS3OPzFeVnnxSuJMLwSiPACA1ACXmWEifRhiPRp4nVExbPn8NNu//MSAj7+eh7CMJK+9bP/ewOOC+fDww4eKv85kv5SBftGPA7c/ed9cPoj1xb1n9Zg8XVmUdCo2++4wsKISfq5iv2paolSJASDGq5cwSTLQsuyKNJoMPwvp19jOfxQvP2DH74iJE7ihIN3DBHFNAICogQztE84xPIZK2swYPaSVriuXMGHz+/B5RNHw6r1OOw43f9rXDkurcTpTSYhNBPh0CIlpmGfI+jFgx+8AocI6C/OMrA4eLv1FOvnr55jLleIeGmXVtRQvJUQcqvw82WAFM9vRbnGDb/fTxxeL/EHdKT1+4v+I0iwObRPGavHwB2b0VI6R1oojzXQlGWg4SW0gopCkvU4HRh68ecIeL3Kox0aqfrOXX475q/9W8miMMk6KkC2fjc5+0auO/DQB6/gmDOyqmGHjUHvOUZSIemuDz637cd/fHwJf3yaV1CFBIScAFAMQIcSol3WCKfbTbR+P1i/n7hICVn8zw1SsFo9fnLrOmye1yJxdswCghgsEA6LkRjMK8g1NoqPf7kPAZ8vZk13/tp1mLtipaQgL1nxCIU1u0nYd8x5GetkIfcbVwj6zmokQCmlWLA8iAs6bu2nO/5kbchHqGK1ugFyzbgQhnotdD4f0fl84AIBMhkgpPX7SyRgAeCJRXfhiaa7FGczpFUZEUwIC76IfDs+iw34vLj04Xu4fPxYuN/Ul5lQsbAJc1eshMFULi3QC+uNSHj6TSnTim/fgcufYNuR1xMCBaU4WgK0LQsABA7KPxh3OP+UCmCYEOICcDOACYCML2yDQeuBzucjQb8fPr+fGDkOi55o+YUc7KqKevxq5QMwaQ3RU1uyX4hcsTKgiFVCjLdKH9Ehl1KqXJZSsG/n8QHJsCUeUArgm7dw6KvkQknaUdo1YM5LqOIwzIMtIeNzboFhFg+2JBjEpN9PuGAQi7+79FtBhvxUvKtJq8cLbRtxX3WTAlOiXMtVWg4aryacLNio/lSZ6THHKLYdeV3SfwLAM+cYdNuYKKAA4GAJGtv8sLNC1s23Z2nXQHdeQu0jhGwBcEKsWONC1M4uwjWtB2wwSAKBAILBILntO82r3VrmN5A922ZDdRN+suxu1Ism3RUrRpLqeRJABfWRGImTTKZxa8gOvwe7Th/C3s/ek7xvCgK95xhsuaKRzRxQoTxM8GIVh60LgmKgoZYfT2WMFYYbRGDtALwoIZ6qBdBV+qAJBMAGg6SY49Cxtb6cM+r+cM6A2+XH6VrwJTzZvJoPyUrAaGQijcgBxpu1iXnpPlGuKYq2d/g92PPX97D3r+9KhisA0Oriw63ZJS1bUiq1b35bAOcMin5X5cHzGYEqD8VVfPKECYDoUANP1WzMrebwhc+HRW3zzYSQN60matqyMIgRvdQek1aPDTXNeHKxBfXGmyTdpiLMREDjwI2omEBeNHb4Pdhz9l1FmKEhS89FDcoDsWECwGuzOHQ2BeNZ9RrtGujMX6iCao1CcSIEFwBxowZN9y8r1xjYv4BE7uLVMy+I3hoODk30sTbUNGPD3CZsqjMrw0wFaALVhoLyAdsneP3SabwUvaYIAFDv5dVpcZKoMKvU1iwJwFqW0OdpheGMQ1WCCyEsl3/93rcopatlM5ywa4HemthwTVoD7qpswIa5zbirqoHvewlJz8BQEuP34PDYMF63ncaBS6fhiPEcN1MQ6L7EoOcCI02e4thxqIzCsiSpR3WmFYazBlXe3+Jr93aDYHfCxKuKQ99sDofinN11xnK0llejxVSNu6oaASDRpQsA+MtD7H4PDo+dw4jbjmP20RjrlWUwbQy6bdJQq3ieyFKwJFUaak/TroGeaQEVAPDIlxvA3zwk6Sc6Dusp+mdR9FVxOFqcms11xnLUF5fD4fMkhBar1XsJum0MtowxcWHGqjuloFJxa5xKUYJFbtoWOdAEN69Bg5eg28Y7dlhPYS2jsJr4/+XJlbydd9tx3p16JGt1EXReI+j8gkGri8S0lSD2yEucK0yh9Qi+yn+lPv7kPd++bZLsNruJxFlTbXYWGDJSDBVT2FmKISNgZynsGiRU9WohwSkPEJjdwv8uEkl8VGhJZLyqqjXrUIUb/YdDb3kAMLsJLA4GFifvUFMQN1RrXB7AsH7Kfn6Rdg1syXeoViR43orZRQTQ/P9qqDlX7elabqqhN1zvQIrPKM8qVLJ3XTeAZ6ayr8U5/dQ8oqcwtwRgTz9z2Uq7BvryLlESHsfcM9X9rWUU1rKgopotToJ6b/6pubuBUwMowF+kln9Qwd9LQrWH0g8V84lRn/CUkvIAYHHySrY4cx+yX5vFoX+Wao+ybkhJQNkIv0JydC6bTpUnYKud2YOsYtiNDKO6Bki+KbUn20qxs9EhW9wvZxJyZ1NQVaBQuMIwp1CFvvQb+dDHZQPy1oVBDBWrHv2s+VZR2oI8bbEgm92AxcGknGFvXRhEXxWntpmOVCPdjIYaH3IwnGGbXfwrlpodGqC7MWNALXlVUcpFgpTpZnYRlAd5JQPAsIGi/yZO7T4U4G+gsoV2DQylumOmlWrBDdZC/aU4bGdAnb1TnXbLBtQGFFpKMAWg9nQOlGmo5gKrpIYrvQD60oWZLai9Qgg2FdhFqbJfUOWQ2gfPeEVJGKd2Cy/TDFdkP4B+Ndb25hSqDHAngNDLNAPUaBVAWtW8ViavoMoAW4TQbEGC+dVp0o6Cn/y3Zhti3kCNA9ksZM2teQzwEPjn4w0BGMp0OJ22UOOALhdAm0U/m7IEDoLy7ALA4Vwq8IaAmkQCFhoylacxfAoBAwB7JrLRbLf/HwBxI17fueoAtgAAAABJRU5ErkJggg==';

			var labelSetting = {
			    normal: {
			        show: true,
			        position: 'right',
			        offset: [10, 0],
			        textStyle: {
			            fontSize: 16
			        }
			    }
			};


		
		  	var option = {
			    title: {
			        text: '热门课程'
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            type: 'shadow'
			        }
			    },
			    grid: {
			        containLabel: true,
			        left: 20
			    },
			    yAxis: {
			        data: ['<%=cNamePopularArr[0] %>'+'('+'<%=tNamePopularArr[0] %>'+')', 
			        '<%=cNamePopularArr[1] %>'+'('+'<%=tNamePopularArr[1] %>'+')',
			        '<%=cNamePopularArr[2] %>'+'('+'<%=tNamePopularArr[2] %>'+')',
			        '<%=cNamePopularArr[3] %>'+'('+'<%=tNamePopularArr[3] %>'+')',
			        '<%=cNamePopularArr[4] %>'+'('+'<%=tNamePopularArr[4] %>'+')',],
			        inverse: true,
			        axisLine: {show: false},
			        axisTick: {show: false},
			        axisLabel: {
			            margin: 30,
			            textStyle: {
			                fontSize: 14
			            }
			        },
			        axisPointer: {
			            label: {
			                show: true,
			                margin: 30
			            }
			        }
			    },
			    xAxis: {
			        splitLine: {show: false},
			        axisLabel: {show: false},
			        axisTick: {show: false},
			        axisLine: {show: false}
			    },
			    series: [{
			        name: '选课人数',
			        type: 'pictorialBar',
			        label: labelSetting,
			        symbolRepeat: true,
			        symbolSize: 30,
			        barCategoryGap: '40%',
			        data: [{
			            value: <%=countPopularArr[0] %>,
			            symbol: spirit
			        }, {
			            value: <%=countPopularArr[1] %>,
			            symbol: spirit
			        }, {
			            value: <%=countPopularArr[2] %>,
			            symbol: spirit
			        }, {
			            value: <%=countPopularArr[3] %>,
			            symbol: spirit
			        }, {
			            value: <%=countPopularArr[4] %>,
			            symbol: spirit
			        }]
			    }]
			};
		  	popularCourseChart.setOption(option);
			//highScore
			console.log(<%=cNumArr[0] %>);
			console.log(<%=cNumArr[1] %>);
			console.log(<%=cNumArr[2] %>);
			console.log(<%=cNumArr[3] %>);
			console.log(<%=cNumArr[4] %>);

			console.log(<%=tCNumArr[0] %>);
			console.log(<%=tCNumArr[1] %>);
			console.log(<%=tCNumArr[2] %>);
			console.log(<%=tCNumArr[3] %>);
			console.log(<%=tCNumArr[4] %>);
			console.log(<%=aAvgGradeArr[0] %>);
			console.log(<%=aAvgGradeArr[1] %>);
			console.log(<%=aAvgGradeArr[2] %>);
			console.log(<%=aAvgGradeArr[3] %>);
			console.log(<%=aAvgGradeArr[4] %>);

		  	var highScoreChart = echarts.init(document.getElementById('highScore'));
		  	var option = {
			    title : {
			        text: '高分课程',
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['该课程平均成绩','同类课程平均成绩']
			    },			    
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            'axisLabel':{'interval':0},
			            data : ['<%= cNameArr[0] %>'+'('+'<%=tNameArr[0] %>'+')',
			            '\n'+'<%= cNameArr[1] %>'+'('+'<%= tNameArr[1] %>'+')',
			            '<%= cNameArr[2] %>'+'('+'<%= tNameArr[2] %>'+')',
			            '\n'+'<%= cNameArr[3] %>'+'('+'<%= tNameArr[3] %>'+')',
			            '<%= cNameArr[4] %>'+'('+'<%= tNameArr[4] %>'+')']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'该课程平均成绩',
			            type:'bar',
			            data:[<%=cAvgGradeArr[0] %>, <%=cAvgGradeArr[1] %>, <%=cAvgGradeArr[2] %>, <%=cAvgGradeArr[3] %>, <%=cAvgGradeArr[4] %>],
			        },
			        {
			            name:'同类课程平均成绩',
			            type:'bar',
			            data:[<%=aAvgGradeArr[0] %>, <%=aAvgGradeArr[1] %>, <%=aAvgGradeArr[2] %>, <%=aAvgGradeArr[3] %>, <%=aAvgGradeArr[4] %>,],
			        }
			    ]
			};
			highScoreChart.setOption(option);
			//优秀教师
			
			var goodTeachersChart = echarts.init(document.getElementById('goodTeachers'));
			var option = {
				title : {
			        text: '优秀教师',
			    },
			    tooltip: {},
			    series : [
			        {
			            name: '开课数',
			            type: 'pie',
			            radius: '66%',
			            data:[
			                {value:<%=courseTeacherArr[0] %>, name:'<%=tNameTeacherArr[0] %>'},
			                {value:<%=courseTeacherArr[1] %>, name:'<%=tNameTeacherArr[1] %>'},
			                {value:<%=courseTeacherArr[2] %>, name:'<%=tNameTeacherArr[2] %>'},
			                {value:<%=courseTeacherArr[3] %>, name:'<%=tNameTeacherArr[3] %>'},
			                {value:<%=courseTeacherArr[4] %>, name:'<%=tNameTeacherArr[4] %>'}
			            ],
			            roseType: 'angle',
			            itemStyle: {
			                normal: {
			                    shadowBlur: 200,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
			};
		  	goodTeachersChart.setOption(option);
		  	//优秀学生
			var goodStudentsChart = echarts.init(document.getElementById('goodStudents'));
			var option = {
				title : {
			        text: '优秀学生',
			    },
			    tooltip: {},
			    angleAxis: {
			        type: 'category',
			        data: ['<%=sNameStudentArr[0] %>', '<%=sNameStudentArr[1] %>', '<%=sNameStudentArr[2] %>', '<%=sNameStudentArr[3] %>', '<%=sNameStudentArr[4] %>'],
			        z: 10
			    },
			    radiusAxis: {
			    },
			    polar: {
			    },
			    series: [{
			        type: 'bar',
			        data: [<%=avgGradeStudentArr[0] %>, <%=avgGradeStudentArr[1] %>, <%=avgGradeStudentArr[2] %>, <%=avgGradeStudentArr[3] %>, <%=avgGradeStudentArr[4] %>],
			        coordinateSystem: 'polar',
			        stack: 'a'
			    }],
			    legend: {
			        show: true,
			        data: ['A']
			    }
			};
		  	goodStudentsChart.setOption(option);
	</script>
</body>
		
		<script src="/course/layui/layui.js"></script>
		<script src="/course/layui/lay/dest/layui.all.js"></script>
		

</html>