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
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		session.setAttribute("from", 4);
		String username=(String) session.getAttribute("username");
		String gotoPage;
		if(username.startsWith("200")) {
			gotoPage="teacher.jsp";
		}else {
			gotoPage="student.jsp";
		}
		Connection con=SqlHelper.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			String oldpwd=(String) request.getParameter("oldpwd");
			ps=con.prepareStatement("select password from user where username=?");
			ps.setString(1, username);
			rs=ps.executeQuery();
			String temp=null;;
			if(rs.next()) {
				temp=rs.getString(1);
			}
			ps.close();
			if(oldpwd==null||oldpwd.equals("")) {
				request.setAttribute("errorInfo", "");
				request.getRequestDispatcher(gotoPage).forward(request, response);
				return ;
			}
			if(!temp.equals(oldpwd)) {
				request.setAttribute("errorInfo", "旧密码输入错误");
				request.getRequestDispatcher(gotoPage).forward(request, response);
				return ;
			}else {
				String newpwd1=request.getParameter("newpwd1");
				String newpwd2=request.getParameter("newpwd2");
				if(!newpwd2.equals(newpwd1)) {
					request.setAttribute("errorInfo", "新密码两次输入不一致");
					request.getRequestDispatcher(gotoPage).forward(request, response);
					return ;
				}else {
					ps=con.prepareStatement("update user set password=? where username=?");
					ps.setString(1,newpwd1);
					ps.setString(2,username);
					if(ps.execute()) {
						response.sendRedirect("/studentManager/updateSuccess");
					}
					ps.close();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} finally {
			SqlHelper.close(con, ps, rs);
		};
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
