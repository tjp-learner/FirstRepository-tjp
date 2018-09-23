package com.tjp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjp.dao.UserDao;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");
		UserDao dao = new UserDao();
		String uid = (String) request.getSession().getAttribute("uid");
		if (method.equals("logout")) {
			//退出登录，消除session中的uid，然后去除自动登录的cookie
			Cookie cookie = new Cookie("autoLogin", "");
			cookie.setPath(request.getContextPath());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			request.getSession().invalidate();
			//跳转到登录界面
			response.sendRedirect("login.html");
			return ;
		}
		if (method.equals("register")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password1");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			dao.UserRegister(email, phone, username, password);
			response.sendRedirect("login.html");
		}
		if (method.equals("login")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			String ver_code = request.getParameter("ver-code");
			String code = (String) request.getSession().getAttribute("code");
			if (!code.equals(ver_code)) {
				request.setAttribute("login_msg", "验证码不正确");
				request.getRequestDispatcher("login.html").forward(request, response);
				return;
			}
			boolean hasUser = dao.hasUser(username);
			if (!hasUser) {
				request.setAttribute("login_msg", "用户名不存在");
				request.getRequestDispatcher("login.html").forward(request, response);
				return;
			}
			uid = dao.userLogin(username, password);
			if (uid != null) {
				//当uid不为空，那么表示用户名和密码正确，可以登录
				request.getSession().setAttribute("uid", uid);
				//此时，要处理自动登录
				String[] value = request.getParameterValues("autologin");
				if (value != null && value.length == 1) {
					Cookie autoLogin = new Cookie("autoLogin", "yes#" + username + "#" + password);
					autoLogin.setMaxAge(24 * 60 * 60 * 7);
					autoLogin.setPath(request.getContextPath());
					response.addCookie(autoLogin);
				} else {
					//不设置自动登录，那么之前假设设置过得cookie要清除
					Cookie[] cookies = request.getCookies();
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("autoLogin")) {
							cookie.setPath(request.getContextPath());
							cookie.setMaxAge(0);
							break;
						}
					}
				}
				response.sendRedirect("home.html");
			} else {
				request.setAttribute("login_msg", "用户名或密码错误");
				request.getRequestDispatcher("login.html").forward(request, response);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
