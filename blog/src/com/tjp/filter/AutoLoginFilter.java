package com.tjp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjp.dao.UserDao;

/**
 * Servlet Filter implementation class AutoLoginFilter
 */
public class AutoLoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AutoLoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		/*
		 * 自动登录过滤器要完成的功能： 如果用户登录了（session中有uid），如果访问登录页面就跳转到首页home.html
		 * 如果用户没有登录，那么看是否有自动登录的cookie 有cookie，那么帮助自动登录，如果访问登录页面就跳转到首页home.html
		 * 没有cookie，访问登录界面不用跳转，访问其他过滤的界面均跳转到登录界面
		 */
		System.out.println("自动登录过滤器");
		// 强转
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String uid = (String) req.getSession().getAttribute("uid");
		if (uid != null) {
			// 登录了
			String url = req.getRequestURI();
			if (url.endsWith("login.html")) {
				chain.doFilter(request, response);
				res.sendRedirect("home.html");
				return;
			}
		} else {
			// 没有登录
			// 读取cookie
			Cookie[] cookies = req.getCookies();
			if (cookies == null || cookies.length == 0) {
				// 没有cookie
				if (req.getRequestURI().endsWith("person.html")) {
					chain.doFilter(request, response);
					res.sendRedirect("login.html");
					return;
				}
			} else {
				// 有cookie
				Cookie autoLogin = null;
				for (Cookie item : cookies) {
					if (item.getName().equals("autoLogin")) {
						autoLogin = item;
						break;
					}
				}
				if (autoLogin != null) {
					// 检验autoLogin这个Cookie
					String[] values = autoLogin.getValue().split("#");
					String yes = values[0];
					String username = values[1];
					String password = values[2];
					if (yes.equals("yes")) {
						UserDao dao = new UserDao();
						uid = dao.userLogin(username, password);
						if (uid != null) {
							// 返回的uid不为空，说明用户名和密码正确，可以登录
							req.getSession().setAttribute("uid", uid);
							// 登录后
							if (req.getRequestURI().endsWith("login.html")) {
								chain.doFilter(request, response);
								res.sendRedirect("home.html");
								return;
							}
						}
					}
				} else {
					if (req.getRequestURI().endsWith("person.html")) {
						chain.doFilter(request, response);
						res.sendRedirect("login.html");
						return;
					}
				}
			}
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
