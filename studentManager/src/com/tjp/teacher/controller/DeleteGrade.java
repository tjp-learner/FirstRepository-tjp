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
@WebServlet("/DeleteGrade")
public class DeleteGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("from", 2);
		Connection con=SqlHelper.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int Sno=Integer.parseInt(request.getParameter("Sno"));
		int Cno=Integer.parseInt(request.getParameter("Cno"));
		String sql="delete from score where Sno=? and Cno=?";
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(sql);
			ps.setInt(1, Sno);
			ps.setInt(2, Cno);
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
			request.getRequestDispatcher("DeleteSuccess").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
