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
import com.tjp.teacher.element.TeachingGrade;

/**
 * Servlet implementation class StudentInfo
 */
@WebServlet("/UpdateGrade")
public class UpdateGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("from", 2);
		Connection con=SqlHelper.getConnection();
		Statement sts=null;
		ResultSet rs=null;
		String username=(String) session.getAttribute("username");
		String sql="select score.Cno,Cname,Sname,score.Sno,Grade from student,course,teaching,score where teaching.Tno='"+username+"' and teaching.Cno=score.Cno and student.Sno=score.Sno and course.Cno=score.Cno order by Cno"; 
		ArrayList<TeachingGrade> teachinggrades=new ArrayList<>();
		try {
			sts=con.createStatement();
			rs=sts.executeQuery(sql);
			while(rs.next()) {
				TeachingGrade teachinggrade=new TeachingGrade(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5));
				teachinggrades.add(teachinggrade);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlHelper.close(con, sts, rs);
			session.setAttribute("teachinggrades", teachinggrades);
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
