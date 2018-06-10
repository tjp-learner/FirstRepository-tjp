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
import com.tjp.student.element.Teaching_eva;

/**
 * Servlet implementation class StudentInfo
 */
@WebServlet("/StudentComment")
public class StudentComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("from", 3);
		String username=(String) session.getAttribute("username");
		String sql="select * from teaching_evaluation where Sno='"+username+"'";
		Connection con=SqlHelper.getConnection();
		Statement sts=null;
		ResultSet rs=null;
		ArrayList<Teaching_eva> teaching_evas=new ArrayList<>();
		try {
			sts=con.createStatement();
			rs=sts.executeQuery(sql);
			while(rs.next()) {
				Teaching_eva teaching_eva=new Teaching_eva(rs.getInt(1),rs.getInt(2),rs.getInt(3));
				teaching_evas.add(teaching_eva);
			}
			session.setAttribute("teaching_eva", teaching_evas);
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
