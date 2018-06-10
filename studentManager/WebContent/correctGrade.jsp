<%@ page language="java" import="java.util.*,com.tjp.teacher.element.*" pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>成绩修改</title>
		<style type="text/css" >
			* {
				margin: 0;
				padding: 0;
			}
			ul {
				list-style: none;
			}
			li {
				width: 200px;
				
				margin-top: 10px;
			}
			input[type=text] {
				width: 100px;
				display: inline-block;
				margin-top: 10px;
			}
			div {
				width: 300px;
				height: 400px;
				margin: 100px auto;
				font-size: 19px;
				line-height: 19px;
			}
			input[type=submit] {
				display: block;
				font-size: 19px;
				margin-top: 30px;
				margin-left: 69px;
			}
		</style>
	</head>
	<body>
		<%
			int Sno=Integer.parseInt(request.getParameter("Sno"));
			String Sname=request.getParameter("Sname");
			int Cno=Integer.parseInt(request.getParameter("Cno"));
			String Cname=request.getParameter("Cname");
			int Grade=Integer.parseInt(request.getParameter("Grade"));
			session.setAttribute("Sno", Sno);
			session.setAttribute("Cno", Cno);
		%>
		<div>
			<ul>
				<li>学　号 : <%=Sno %></li>
				<li>姓　名 : <%=Sname %></li>
				<li>课程号 : <%=Cno %></li>
				<li>课程名 : <%=Cname %></li>
				<li>原成绩 : <%=Grade %></li>
			</ul>
				<form method="get" action="/studentManager/CorrectGrade">
					修改成绩 : <input type="text" name="grade" /><br />
					<input type="submit" value="提交"/>
				</form>
		</div>
	</body>
</html>