package com.tjp.student.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class StudentInfo
 */
@WebServlet("/updateSuccess")
public class updateSuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<h1>密码修改成功！3秒钟跳到主页</h1>");  
		HttpSession session=request.getSession();
		String username=(String) session.getAttribute("username");
		String gotoPage;
		if(username.startsWith("200")) {
			gotoPage="TeacherInfo";
		}else {
			gotoPage="StudentInfo";
		}
		//设置3秒钟跳转  
        response.setHeader("refresh", "3;url="+gotoPage);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
