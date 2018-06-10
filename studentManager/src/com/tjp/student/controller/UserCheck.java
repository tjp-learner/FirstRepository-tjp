package com.tjp.student.controller;

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
 * Servlet implementation class UserCheck
 */
@WebServlet("/UserCheck")
public class UserCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		HttpSession session=request.getSession(true);
		session.setAttribute("username", username);
		if(username==null||"".equals(username)) {
			request.setAttribute("errInfo","用户名为空");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return ;
		} else {
			Connection con=SqlHelper.getConnection();
			String sql="select * from user where username='"+username+"'";
			PreparedStatement ps=null;
			ResultSet rs=null;
			String temp="";
			try {
				ps=con.prepareStatement(sql);
				rs=ps.executeQuery();
				if(rs.next()) {
					temp=rs.getString(2);
				} else {
					request.setAttribute("errInfo", "用户名不存在");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return ;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				SqlHelper.close(con, ps, rs);
			}
			if(temp.equals(password)) {
				if(username.length()==4) {
					request.getRequestDispatcher("TeacherInfo").forward(request, response);
				} else {
					request.getRequestDispatcher("StudentInfo").forward(request, response);
				}
				return ;
			} else {
				request.setAttribute("errInfo", "密码错误");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return ;
			}
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
