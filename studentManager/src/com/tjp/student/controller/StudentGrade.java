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

import com.tjp.student.element.SqlHelper;
import com.tjp.student.element.Student_Grade;

/**
 * Servlet implementation class StudentInfo
 */
@WebServlet("/StudentGrade")
public class StudentGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("from", 1);
		String username=(String) session.getAttribute("username");
		String sql1="select course.Cno,Cname,Crequirement,Ccredit,Grade";
		String sql2=" from score,course";
		String sql3=" where Sno='"+username+"' and score.cno=course.cno";
		String sql=sql1+sql2+sql3;
		Connection con=SqlHelper.getConnection();
		Statement sts=null;
		ResultSet rs=null;
		ArrayList<Student_Grade> sg=new ArrayList<>();
		try {
			sts=con.createStatement();
			rs=sts.executeQuery(sql);
			while(rs.next()) {
				Student_Grade student_grade=new Student_Grade(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5));
				sg.add(student_grade);
			}
			session.setAttribute("student_grade",sg);
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
