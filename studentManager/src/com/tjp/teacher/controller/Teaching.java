package com.tjp.teacher.controller;

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

import com.tjp.student.element.SqlHelper;
import com.tjp.teacher.element.TeachingCourse;

/**
 * Servlet implementation class StudentInfo
 */
@WebServlet("/Teaching")
public class Teaching extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("from", 1);
		String username=(String) session.getAttribute("username");
		String sql="select * from course,teaching " + 
				"where teaching.Tno='"+username+
				"' and course.Cno=teaching.Cno";
		Connection con=SqlHelper.getConnection();
		Statement sts=null;
		ResultSet rs=null;
		ArrayList<TeachingCourse> teachingcourses=new ArrayList<>();
		try {
			sts=con.createStatement();
			rs=sts.executeQuery(sql);
			while(rs.next()) {
				TeachingCourse teachingcourse=new TeachingCourse(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(8));
				teachingcourses.add(teachingcourse);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlHelper.close(con, sts, rs);
			session.setAttribute("teachingcourses", teachingcourses);
			request.getRequestDispatcher("teacher.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
