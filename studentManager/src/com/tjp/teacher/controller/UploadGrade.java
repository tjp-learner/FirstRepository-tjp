package com.tjp.teacher.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

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
@WebServlet("/UploadGrade")
public class UploadGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("from", 2);
		String username=(String) session.getAttribute("username");
		Connection con=SqlHelper.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Integer Sno=new Integer(request.getParameter("Sno"));
		Integer Cno=new Integer(request.getParameter("Cno"));
		int Grade=Integer.parseInt(request.getParameter("Grade"));
		String query_Sno="select Sno from student";
		String query_Cno="select Cno from teaching where Tno='"+username+"'";
		String query_result="select * from score where Sno='"+Sno+"' and Cno='"+Cno+"'";
		Set<Integer> Snos=new HashSet<Integer>();
		Set<Integer> Cnos=new HashSet<Integer>();
		try {
			ps=con.prepareStatement(query_Sno);
			rs=ps.executeQuery();
			while(rs.next()) {
				Snos.add(rs.getInt(1));
			}
			ps.close();
			rs.close();
			ps=con.prepareStatement(query_Cno);
			rs=ps.executeQuery();
			while(rs.next()) {
				Cnos.add(rs.getInt(1));
			}
			ps.close();
			rs.close();
			if(Snos.contains(Sno)==false) {
				request.setAttribute("errInfo", "学号错误");
				request.getRequestDispatcher("uploadGrade.jsp").forward(request, response);
				return ;
			}
			if(Cnos.contains(Cno)==false) {
				request.setAttribute("errInfo", "你没有教该课程");
				request.getRequestDispatcher("uploadGrade.jsp").forward(request, response);
				return ;
			}
			ps=con.prepareStatement(query_result);
			rs=ps.executeQuery();
			if(rs.next()) {
				request.setAttribute("errInfo", "该学生该课程分数已存在");
				request.getRequestDispatcher("uploadGrade.jsp").forward(request, response);
				return ;
			}
		} catch (SQLException e2) {
			e2.printStackTrace();
		} 
		try {
			con.setAutoCommit(false);
			String sql="insert into score values(?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, Sno);
			ps.setInt(2, Cno);
			ps.setInt(3, Grade);
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
			request.getRequestDispatcher("UploadSuccess").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
