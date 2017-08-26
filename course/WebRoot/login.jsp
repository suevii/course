<%@ page language="java" import="java.util.*,model.UserTable"
	pageEncoding="UTF-8"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head lang="en">
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>课程管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- 	<link rel="stylesheet" type="text/css" href="jquery-1.7.2/jquery-3.2.0.min.js"> -->
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="skins/minimal/blue.css">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />

<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />

<!--[if IE]>
		<script src="js/html5.js"></script>
	<![endif]-->

</head>
<% 
	if (session.getAttribute("user") != null) {
		if(session.getAttribute("character").equals("student"))
			response.sendRedirect("/course/student/studentMain.jsp");
		else
			response.sendRedirect("/course/teacher/teacherMain.jsp");
	}
%>
<body>
	<div class="container demo-2">
		<div class="content">
			<div class="row">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="signpos">
						<div class="col-sm-offset-3 col-md-offset-3 col-sm-6 col-md-6">
							<s:form role="form" class="form-horizontal" action="login" method="post">
								<div class="signcontent">
									<h3>用户登录</h3>
									<div class="content">
										<div class="form-group">
											<div>
												<i class="fa fa-user fa-lg"></i> 
												<input class="form-control required" type="text"
															id="input-username" name="user.username" autocomplete="off"
													 		placeholder="学号或工号">
											</div>
										</div>
										<div class="form-group">
											<div>
												<i class="fa fa-lock fa-lg"></i> 
												<input class="form-control required" type="password"
															id="input-password" name="user.password" autocomplete="off"
															placeholder="请输入密码">
											</div>
										</div>
										<div class="form-group">
											<script type="text/javascript">
												//错误提示信息
												var msg = "" + '${request.tipMessage}';
												if (msg != "") {
													document.write(msg);
												}
											</script>
											</br>
											<div>
												<div class="iradio checked">
													<input type="radio" name="character" value="student" title="学生" checked>
													<label>学生</label>
												</div>
												<div class="iradio">
													<input type="radio" name="character" value="teacher" title="教师">
													<label>教师</label>
												</div>
											</div>
										</div>
										<div class="form-group">
											<button class="btn btn-block btn-success pull-right" type="submit">登录</button>
											<button class="btn btn-block btn-info pull-left" type="reset">重置</button>
										</div>
									</div>
								</div>
							</s:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="jquery-1.7.2/jquery-3.2.0.min.js"></script>
	<script type="text/javascript" src="js/icheck.min.js"></script>
	<script src="js/rAF.js"></script>
	<script src="js/demo-2.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_minimal',
				radioClass : 'iradio_minimal',
				radioClass : 'iradio_minimal-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>
