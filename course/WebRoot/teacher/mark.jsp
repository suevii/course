<%@ page language="java" import="java.util.*,db.DB,model.*,model.UserTable,java.sql.*,db.DB,model.vo.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getRequestURI();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<base href="<%=basePath%>">

<title>课程管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="/course/layui/css/layui.css">
<link rel="stylesheet" href="/course/css/index.css">
</head>
<style type="text/css">
.form {
	margin: 50px 50px -100px 50px;
}

.tablepos {
	overflow: auto;
}

.btn {
	margin: 10px 0px;
	text-align: right;
}

.lastth {
	min-width: 200px;
}

.layui-table th {
	min-width: 100px;
}
.layui-table tr td{
	max-width:50px;
}
</style>
<%
	String character = (String) session.getAttribute("character");
	String name = null;
	String id =null;
	Object user = session.getAttribute("user");
	if (character.equals("student")) {
		user = (Student) user;
		name = ((Student) user).getSname();
		id = ((Student) user).getSnum();
	} else if (character.equals("teacher")) {
		user = (Teacher) user;
		name = ((Teacher) user).getTname();
		id=((Teacher)user).getTnum();
	}
	String cnum = (String) session.getAttribute("coursenum");
	long openid = Long.parseLong((String) session.getAttribute("openid"));
	DB db = new DB();
	HashMap<String, NamedTime> time = db.getNamedRecord(id, openid);
	List<UserTable> studentList = db.getStudentList(openid);
	List<String> keyList = new ArrayList<String>();
	Iterator<String> it = time.keySet().iterator();
	while (it.hasNext()) {
		keyList.add(it.next());
	}
	Collections.reverse(keyList);
	Collections.sort(studentList);
	Iterator<String> it2 = keyList.iterator();
	
	Iterator<UserTable> sit = studentList.iterator();
	boolean[][] named = new boolean[studentList.size()][keyList.size()];
	for (int i = 0; i < named.length; i++) {
		for (int j = 0; j < named[0].length; j++) {
			named[i][j] = true;
		}
	}
	for (int i = 0; i < studentList.size(); i++) {
		for (int j = 0; j < keyList.size(); j++) {
			String record = studentList.get(i).getId();
			String dateKey = keyList.get(j);
			if (time.get(dateKey).getRecord().indexOf(record) != -1) {
				named[i][j] = false;
			}
		}
	}
%>
<body>
	<div class="layui-layout layui-layout-admin">
		<jsp:include page="guide.jsp" />
		<jsp:include page="left.jsp" />
		<div class="layui-body site-demo" style="margin-top: 30px;">
			<form method="post" action="named" class="layui-form form">
				<div class="tablepos">
					<table class="layui-table" lay-even lay-skin="nob">
						<tr>
						
							<%
								if (keyList.size() == 0 || studentList.size() == 0) {
									out.println("<th>无点名记录</th>");
								} else {
									out.println("<th>学号</th><th>姓名</th>");
								}
							%>
<th   class="lastth">点名</th>


							<%
								while (it2.hasNext()) {
							%>
							<th><%=it2.next()%></th>
							<%
								}
							%>
							
						</tr>
						<%
							int i = 0;
							while (sit.hasNext()) {
								UserTable temp = sit.next();
						%>
						<tr>
							<td><%=temp.getId()%></td>
							<td><%=temp.getUsername()%></td>
							<td><input name="named[<%=i%>]" type="radio" value="" checked title=" ">
							<i class='layui-icon' style='color: green;'>&#xe605</i>
								<input name="named[<%=i%>]" type="radio" value="<%=studentList.get(i).getId()%>" title=" ">
								<i class='layui-icon' style=' color: red;'>&#x1006</i>
							</td>
							<%
								for (int j = 0; j < named[0].length; j++) {
							%>
							<td class="layui-icon"><%=named[i][j] == true ? "&#xe605" : "&#x1006"%></td>
							<%
								}
							%>
							
						</tr>
						<%
							i++;
							}
						%>


					</table>
					<input type="hidden" name="openId" value="<%=openid%>"> <input
						type="hidden" name="tnum" value="<%=id%>">
					<%=studentList.size() == 0 ? "" : "<input type='submit' value='保存新增点名' class='layui-btn'>"%>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="/course/layui/layui.js"></script>
<script src="/course/layui/lay/dest/layui.all.js"></script>
</html>