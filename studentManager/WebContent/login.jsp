<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<link rel="icon"  href="images/ecjtu_logo.ico" />
		<title>学生成绩管理系统登录</title>
		<link rel="stylesheet" type="text/css" href="login.css"/>
	</head>
	<body>
		<div class="main">
			<div class="left">
				<img src="images/school_logo.png">
				<p class="title">学生成绩管理系统</p>
			</div>
			<%
				request.setCharacterEncoding("utf-8");
				String value_username="";
				String temp;
				if((temp=request.getParameter("username"))!=null){
					value_username=temp;
				}
				String value_password="";
				if((temp=request.getParameter("password"))!=null){
					value_password=temp;
				}
				String errInfo="";
				if((temp=(String)request.getAttribute("errInfo"))!=null){
					errInfo=temp;
				}
			%>
			<div class="right">
				<form action="/studentManager/UserCheck" method="post" >
					用户名：<input type="text" name="username" placeholder="学号/教师职工编号" 
					value="<%=value_username %>"/><br />
					密　码：<input type="password" name="password" placeholder="请输入密码" 
					value="<%=value_password %>"/><br />
					<p class="err"><%=errInfo%></p>
					<input type="submit" value="登录" /><input type="reset" value="重置" />
				</form>
			</div>
		</div>
		<footer>
			<hr />
			<p class="copyright">本课设小组版权所有 Copyright©.All Rights Reserved</p>
		</footer>
	</body>
</html>