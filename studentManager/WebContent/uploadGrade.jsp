<%@ page language="java" import="java.util.*,com.tjp.teacher.element.*" pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>成绩上传</title>
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
				position: relative;
				width: 300px;
				height: 400px;
				margin: 100px auto;
				font-size: 19px;
				line-height: 19px;
			}
			input[type=submit] {
				display: block;
				font-size: 19px;
				margin-top: 40px;
				margin-left: 69px;
			}
			.errInfo {
				position: absolute;
				font-size: 19px;
				top: 125px;
				left: 45px;
				color: red;
			}
		</style>
	</head>
	<body>
		<%
			String errInfo=(String)request.getAttribute("errInfo");
			if(errInfo==null){
				errInfo="";
			}
		%>
		<div>
				<form method="get" action="/studentManager/UploadGrade">
					<ul>
						<li>学　号 : <input type="text" name="Sno" required/></li>
						<li>课程号 : <input type="text" name="Cno" required/></li>
						<li>成　绩 : <input type="text" name="Grade" required/></li>
					</ul>
					<input type="submit" value="提交"/>
				</form>
				<p class="errInfo"><%=errInfo %></p>
		</div>
	</body>
</html>