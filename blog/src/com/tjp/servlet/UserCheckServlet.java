package com.tjp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjp.dao.UserDao;

/**
 * Servlet implementation class UserCheckServlet
 */
public class UserCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getParameter("method");
		UserDao dao = new UserDao();
		boolean flag = false;
		switch (method) {
		case "email":
			String email = request.getParameter("email");
			flag = dao.isEmailRepeat(email);
			break;
		case "phone":
			String phone = request.getParameter("phone");
			flag = dao.isPhoneRepeat(phone);
			break;
		case "username":
			String username = request.getParameter("username");
			flag = dao.isUsernameRepeat(username);
			break;
		}
		response.getWriter().println(flag);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
