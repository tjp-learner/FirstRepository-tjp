package com.tjp.teacher.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tjp.student.element.SqlHelper;

/**
 * Servlet implementation class StudentInfo
 */
@WebServlet("/CorrectGrade")
public class CorrectGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("from", 2);
		int Sno=(Integer) session.getAttribute("Sno");
		int Cno=(Integer) session.getAttribute("Cno");
		int Grade=Integer.parseInt(request.getParameter("grade"));
		Connection con=SqlHelper.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement("update score set Grade=? where Sno=? and Cno=?");
			ps.setInt(1, Grade);
			ps.setInt(2, Sno);
			ps.setInt(3, Cno);
			ps.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			SqlHelper.close(con, ps, rs);
			request.getRequestDispatcher("UpdateGrade").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
