<%@ page language="java" import="java.util.*,com.tjp.student.element.*" pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>学生导航</title>
		<link rel="stylesheet" href="student.css" type="text/css" />
	</head>
	<body>
		<header>
			<div class="left">
				<img src="images/biglogo.png" />
				<h5>学生成绩管理系统</h5>
			</div>
			<%
				String studentName=(String)session.getAttribute("studentName");
			%>
			<div class="right">
				<a class="quit" href="/studentManager/login.jsp">退出登录</a>
				<a href="/studentManager/StudentInfo">个人信息</a>
			</div>
		</header>
		<article>
			<nav class="nav">
				<a href="/studentManager/StudentGrade">我的成绩</a>
				<a href="/studentManager/StudentSelect">选课信息</a>
				<a href="/studentManager/StudentComment">评教详情</a>
				<a href="/studentManager/StudentUpdate">修改密码</a>
			</nav>
			<section class="display">
				<p class="welcome"><span>欢迎你，<%=studentName %>同学!</span></p>
				<%
					int i;
					int from=(int)session.getAttribute("from");
				%>
				<% 
					if(from==0){
				%>
				<div class='studentInfo'>
				<% 
						Student student=(Student)session.getAttribute("student");
						int Sno=student.getSno();
						String Sname=student.getSname();
						String Ssex=student.getSsex();
						int Sage=student.getSage();
						String Sdept=student.getSdept();
						String Semail=student.getSemail();
						if(Semail==null){
							Semail="暂无";
						}
						String Sphone=student.getSphone();
						if(Sphone==null){
							Sphone="暂无";
						}
				%>
					<ul>
						<li>学号 : <%=Sno %></li>
						<li>姓名 : <%=Sname %></li>
						<li>性别 : <%=Ssex %></li>
						<li>年龄 : <%=Sage %></li>
						<li>专业 : <%=Sdept %></li>
						<li>邮箱 : <%=Semail %></li>
						<li>电话 : <%=Sphone %></li>
					</ul>
				<% 
					}
				%>
				</div>
				<% 
					if(from==1){
				%>
				<table class='studentgrade' >
					<tr>
						<th>序号</th>
						<th>课程号</th>
						<th>课程名</th>
						<th>课程要求</th>
						<th>学分</th>
						<th>成绩</th>
					</tr>
				<% 
						ArrayList<Student_Grade> sg=(ArrayList<Student_Grade>)session.getAttribute("student_grade");
						for(i=0;i<sg.size();i++){
							int Cno=sg.get(i).getCno();
							String Cname=sg.get(i).getCname();
							String Crequirement=sg.get(i).getCrequirement();
							int Ccredit=sg.get(i).getCcredit();
							int Grade=sg.get(i).getGrade();
							/* if(sg.get(i).getGrade()==0){
								String Grade="暂无";
							}else {
								int Grade=sg.get(i).getGrade();
							} */
				%>
					<tr>
						<td><%=i+1 %>
						<td><%=Cno %></td>
						<td><%=Cname %></td>
						<td><%=Crequirement %></td>
						<td><%=Ccredit %></td>
						<td><%=Grade %></td>
					</tr>
				<%
						}
				%>
				</table>
				<% 
					}
					if(from==2){
				%>
				<table class='studentselect' >
					<tr>
						<th>序号</th>
						<th>课程号</th>
						<th>课程名</th>
						<th>课程学分</th>
						<th>学时</th>
						<th>课程要求</th>
					</tr>
				<%
						ArrayList<Course> courses=(ArrayList<Course>)session.getAttribute("course");
						for(i=0;i<courses.size();i++){
							int Cno=courses.get(i).getCno();
							String Cname=courses.get(i).getCname();
							int Ccredit=courses.get(i).getCcredit();
							int Ccredit_hours=courses.get(i).getCcredit_hours();
							String Crequirement=courses.get(i).getCrequirement();
				%>
					<tr>
						<td><%=i+1 %></td>
						<td><%=Cno %></td>
						<td><%=Cname %></td>
						<td><%=Ccredit %></td>
						<td><%=Ccredit_hours %></td>
						<td><%=Crequirement %></td>
					</tr>
				<%
						}
				%>
				</table>
				<%
					}
					if(from==3){
				%>
				<table class='studentcomment' >
					<tr>
						<th>序号</th>
						<th>教工号</th>
						<th>课程号</th>
						<th>课程评分</th>
					</tr>
					<%
							ArrayList<Teaching_eva> teaching_evas=(ArrayList<Teaching_eva>)session.getAttribute("teaching_eva");
							for(i=0;i<teaching_evas.size();i++){
								int Cno=teaching_evas.get(i).getCno();
								int Tno=teaching_evas.get(i).getTno();
								int E_grade=teaching_evas.get(i).getE_grade();
					%>
					<tr>
						<td><%=i+1 %></td>
						<td><%=Cno %></td>
						<td><%=Tno %></td>
						<td><%=E_grade %></td>
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
						<table class="updatepassword">
							<tr>
								<td>旧密码 : </td>
								<td><input type="password" name="oldpwd" required/></td>
							</tr>
							<tr>
								<td>新密码 : </td>
								<td><input type="password" name="newpwd1" required/></td>
							</tr>
							<tr>
								<td>确认新密码 : </td>
								<td><input type="password" name="newpwd2" required/></td>
							</tr>
						</table>
						<%
							String errorInfo=(String)request.getAttribute("errorInfo");
							if(errorInfo==null){
								errorInfo="";
							}
							System.out.println(errorInfo);
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