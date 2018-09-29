package com.tjp.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.tjp.dao.ArticleDao;
import com.tjp.domain.Article;

/**
 * Servlet Filter implementation class ArticleFilter
 */
public class ArticleFilter implements Filter {

    /**
     * Default constructor. 
     */
    public ArticleFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		HttpServletRequest req = (HttpServletRequest) request;
		String get = req.getParameter("get");
		ArticleDao dao = new ArticleDao();
		if (get != null && !get.equals("")) {
			List<Article> related_article = dao.getArticlesByClassfiy(get);
			request.setAttribute("related_article", related_article);
			request.setAttribute("keyword", get);
		} else {
			List<Article> recent_article = dao.getRecentArticle();
			req.setAttribute("recent_article", recent_article);
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
