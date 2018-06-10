package com.tjp.student.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tjp.student.element.Course;
import com.tjp.student.element.SqlHelper;

/**
 * Servlet implementation class StudentInfo
 */
@WebServlet("/StudentSelect")
public class StudentSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("from", 2);
		String username=(String) session.getAttribute("username");
		String sql="select course.Cno,Cname,Ccredit,Credit_hours,Crequirement from course,score where score.Sno='"+username+"' and course.Cno=score.Cno";
		String sql1="select Sname from student where Sno='"+username+"'";
		Connection con=SqlHelper.getConnection();
		Statement sts=null;
		ResultSet rs=null;
		ArrayList<Course> courses=new ArrayList<>();
		try {
			sts=con.createStatement();
			rs=sts.executeQuery(sql1);
			if(rs.next()) {
				session.setAttribute("studentName", rs.getNString("Sname"));
			}
			rs.close();
			rs=sts.executeQuery(sql);
			while(rs.next()) {
				Course course=new Course(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5));
				courses.add(course);
			}
			session.setAttribute("course", courses);
			request.getRequestDispatcher("student.jsp").forward(request, response);
			return ;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlHelper.close(con, sts, rs);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
