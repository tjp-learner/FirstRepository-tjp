package com.tjp.student.controller;

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
import com.tjp.student.element.Student;

/**
 * Servlet implementation class StudentInfo
 */
@WebServlet("/StudentInfo")
public class StudentInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("from", 0);
		String username=(String) session.getAttribute("username");
		String sql="select * from student where Sno='"+username+"'";
		String sql1="select Sname from student where Sno='"+username+"'";		
		Connection con=SqlHelper.getConnection();
		Statement sts=null;
		ResultSet rs=null;
		try {
			sts=con.createStatement();
			rs=sts.executeQuery(sql1);
			if(rs.next()) {
				session.setAttribute("studentName", rs.getNString("Sname"));
			}
			rs.close();
			rs=sts.executeQuery(sql);
			if(rs.next()) {
				Student student=new Student(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
				session.setAttribute("student", student);
				request.getRequestDispatcher("student.jsp").forward(request, response);
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
