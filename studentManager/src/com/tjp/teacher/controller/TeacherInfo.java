package com.tjp.teacher.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tjp.student.element.SqlHelper;
import com.tjp.teacher.element.Teacher;

/**
 * Servlet implementation class StudentInfo
 */
@WebServlet("/TeacherInfo")
public class TeacherInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("from", 0);
		String username=(String) session.getAttribute("username");
		String sql="select * from teacher where Tno='"+username+"'";
		String sql1="select Tname from Teacher where Tno='"+username+"'";		
		Connection con=SqlHelper.getConnection();
		Statement sts=null;
		ResultSet rs=null;
		try {
			sts=con.createStatement();
			rs=sts.executeQuery(sql1);
			if(rs.next()) {
				session.setAttribute("teacherName", rs.getNString("Tname"));
			}
			rs.close();
			rs=sts.executeQuery(sql);
			if(rs.next()) {
				Teacher teacher=new Teacher(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7));
				request.setAttribute("teacher", teacher);
				request.getRequestDispatcher("teacher.jsp").forward(request, response);
				return ;
			}
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
