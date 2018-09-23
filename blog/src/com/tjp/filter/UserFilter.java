package com.tjp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.tjp.dao.UserDao;
import com.tjp.domain.User;

/**
 * Servlet Filter implementation class UserFilter
 */
public class UserFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public UserFilter() {
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

		// 强转
		HttpServletRequest req = (HttpServletRequest) request;
		String uid = (String) req.getSession().getAttribute("uid");
		UserDao dao = new UserDao();
		User user = dao.getUserById(uid);
		if (user != null) {
			req.getSession().setAttribute("user", user);
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
