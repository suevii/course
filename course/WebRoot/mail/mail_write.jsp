 <%@ page language="java" import="java.util.*,model.*,db.*" pageEncoding="utf-8"%>
 <%@page import="model.vo.*"%>
<%
String path = request.getRequestURI();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>写邮件</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="/course/css/bootstrap.min.css">
	  <link rel="stylesheet" type="text/css" href="/course/css/bootstrap-theme.min.css">
	  <link rel="stylesheet" type="text/css" href="/course/css/normalize.css" />
	<link rel="stylesheet" href="/course/layui/css/layui.css">
	<link rel="stylesheet" href="/course/css/index.css">

  </head>
  
<body>
 <div class="layui-layout layui-layout-admin">
			<%  
				String character = (String)session.getAttribute("character");
				int level = -1;
				Object user = session.getAttribute("user");
				String name = null;
				if(character.equals("student")){
					user = (Student)user;
					level = 0;
				}else if(character.equals("teacher")){
					user = (Teacher)user;
					level = 1;
				}
				String h1= level==0?"/student/head.jsp":"/teacher/head.jsp";
				String h2= level==0?"/student/left.jsp":"/teacher/left.jsp";
				System.out.println(level);
				DB db=new DB();
				List<UserTable> list=db.getMailTo(); 
			%>
      <jsp:include page="<%=h1%>"/>
      <jsp:include page="<%=h2%>"/>
			<div class="layui-body site-demo" style="margin-top: 30px;">
	 <div class="container" >
	 <row class="col-md-10">

  	 <form class="layui-form" action="MailSend.action" method="post">
  	     <table class="layui-table recitable table table-bordered  textpos mailcontent">
  		 <caption>邮件信息</caption>
  		 <tr><td>收件人</td>
  		 <td><input id="input" type="text" name="num_to" list="students" onchange="find(this.value);"/></td></tr>

  		 <tr><td>邮件标题</td>
  		 <td><input type="text" name="title"/></td></tr>
  		 <tr><td>邮件内容</td>
  		<td><textarea name="content" rows="5" cols="35"></textarea></td></tr>
  	           </table>
  		<div class="pull-right">
                      <input class="layui-btn layui-btn-small" type="submit" value="发送"/>
  	           <input class="layui-btn layui-btn-danger layui-btn-small" type="reset" value="重置"/>
  	    </div>
  	    <datalist id="students">
  	    	<%Iterator<UserTable> it = list.iterator();
  	    	while(it.hasNext()){
  	    	UserTable table=it.next();
  	    	%>
  	    	<option value="<%=table.getId()%>"><%=table.getUsername()%>(<%=table.getId()%>)</option>
  	    	<%
  	    	
  	    	}%>
		</datalist>
  	</form>

	</row>
  	</div>
  	</div>
  	<script type="text/javascript" src="/course/jquery-1.7.2/jquery-3.2.0.min.js"></script>
	<script src="/course/layui/layui.js"></script>
	<script src="/course/layui/lay/dest/layui.all.js"></script>
  	 <script type="text/javascript">
	 function find(str){
	 	var father=document.getElementById("students");
	 	var array=father.childNodes;
	 	for(x in array){
	 		var pat="/^"+str+"$/";;
	 		if(pat.test(str)){
	 			x.css("display","none");
	 		}
	 		else{
	 			x.css("display","block");
	 		}
	 		
	 	}
	
	}
	</script>
  </div>
</body>
</html>
