<%@ page language="java" import="java.util.*,com.tjp.teacher.element.*" pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>老师导航</title>
		<link rel="stylesheet" href="teacher.css" type="text/css" />
	</head>
	<body>
		<header>
			<div class="left">
				<img src="images/biglogo.png" />
				<h5>学生成绩管理系统</h5>
			</div>
			<%
				String teacherName=(String)session.getAttribute("teacherName");
			%>
			<div class="right">
				<a class="quit" href="/studentManager/login.jsp">退出登录</a>
				
				<a class="teacherInfo" href="/studentManager/TeacherInfo">个人信息</a>
			</div>
		</header>
		<article>
			<nav class="nav">
				<a href="/studentManager/Teaching">授课信息</a>
				<a href="/studentManager/UpdateGrade">成绩评定</a>
				<a href="/studentManager/UpdatePassword">修改密码</a>
			</nav>
			<section class="display">
				<p class="welcome">欢迎您，<%=teacherName %>老师!</p>
				<%
					int i;
					int from=(int)session.getAttribute("from");
					if(from==0){
				%>
				<div class='teacherInfo'>
				<% 
						Teacher teacher=(Teacher)request.getAttribute("teacher");
						int Tno=teacher.getTno();
						String Tname=teacher.getTname();
						String Tsex=teacher.getTsex();
						int Tage=teacher.getTage();
						String Ttitle=teacher.getTtitle();
						String Temail=teacher.getTemail();
						String Tphone=teacher.getTphone();
						if(Tphone==null||Tphone.equals("")){
							Tphone="暂无";
						}
				%>
					<ul>
						<li>教工号 : <%=Tno %></li>
						<li>姓　名 : <%=Tname %></li>
						<li>性　别 : <%=Tsex %></li>
						<li>年　龄 : <%=Tage %></li>
						<li>职　称 : <%=Ttitle %></li>
						<li>邮　箱 : <%=Temail %></li>
						<li>电　话 : <%=Tphone %></li>
					</ul>
				</div>
				<% 
					}
				%>
				<% 
					if(from==1){
						ArrayList<TeachingCourse> teachingcourses=(ArrayList<TeachingCourse>)session.getAttribute("teachingcourses");
				%>
				<p class="teachCount">老师您好，您一共教<%=teachingcourses.size() %>门课程</p>
				<table class='teaching' >
					<tr>
						<th>序号</th>
						<th>课程号</th>
						<th>课程名</th>
						<th>学分</th>
						<th>学时</th>
						<th>授课地点</th>
					</tr>
				<% 
						for(i=0;i<teachingcourses.size();i++){
							int Cno=teachingcourses.get(i).getCno();
							String Cname=teachingcourses.get(i).getCname();
							int Ccredit=teachingcourses.get(i).getCcredit();
							int Ccredit_hours=teachingcourses.get(i).getCcredit_hours();
							String T_address=teachingcourses.get(i).getT_address();
				%>
					<tr>
						<td><%=i+1 %>
						<td><%=Cno %></td>
						<td><%=Cname %></td>
						<td><%=Ccredit %></td>
						<td><%=Ccredit_hours %></td>
						<td><%=T_address %></td>
					</tr>
				<%
						}
				%>
				</table>
				<% 
					}
					if(from==2){
						ArrayList<TeachingGrade> teachinggrades=(ArrayList<TeachingGrade>)session.getAttribute("teachinggrades");
				%>
				<a class="upload" href="/studentManager/uploadGrade.jsp" >上传成绩</a>
				<table class='teachinggrade' >
					<tr>
						<th>序号</th>
						<th>课程号</th>
						<th>课程名</th>
						<th>学号</th>
						<th>姓名</th>
						<th>成绩</th>
						<th>修改 / 删除</th>
					</tr>
				<% 
						for(i=0;i<teachinggrades.size();i++){
							int Cno=teachinggrades.get(i).getCno();
							String Cname=teachinggrades.get(i).getCname();
							int Sno=teachinggrades.get(i).getSno();
							String Sname=teachinggrades.get(i).getSname();
							int Grade=teachinggrades.get(i).getGrade();
				%>
					<tr>
						<td><%=i+1 %>
						<td><%=Cno %></td>
						<td><%=Cname %></td>
						<td><%=Sno %></td>
						<td><%=Sname %></td>
						<td><%=Grade %></td>
						<td class="update"><a href="/studentManager/correctGrade.jsp?Cno=<%=Cno %>&Cname=<%=Cname %>&Sno=<%=Sno %>&Sname=<%=Sname %>&Grade=<%=Grade %>">修改</a>
						/ <a href="/studentManager/DeleteGrade?Sno=<%=Sno %>&Cno=<%=Cno %>">删除</a></td>
					</tr>
				<%
						}
				%>
				</table>
				<%
					}
					if(from==4) {
				%>	
				<div class="updatepassword">
					<form action="/studentManager/UpdatePassword" method="post">
						<table>
							<tr>
								<td>旧密码 : </td>
								<td><input type="password" name="oldpwd" required /></td>
							</tr>
							<tr>
								<td>新密码 : </td>
								<td><input type="password" name="newpwd1" required /></td>
							</tr>
							<tr>
								<td>确认新密码 : </td>
								<td><input type="password" name="newpwd2" required /></td>
							</tr>
						</table>
						<%
							String errorInfo=(String)request.getAttribute("errorInfo");
							if(errorInfo==null){
								errorInfo="";
							}
						%>
						<p class="err"><%=errorInfo %><p>
						<input type="submit" value="确认修改"/>
					</form>
				</div>
				<%
					}
				%>	
			</section>
		</article>
	</body>
</html>