package com.tjp.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tjp.dao.ArticleDao;
import com.tjp.dao.AttentionDao;
import com.tjp.dao.CommentDao;
import com.tjp.domain.Article;
import com.tjp.domain.Comment;

/**
 * Servlet implementation class ArticleServlet
 */
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String aid = request.getParameter("aid");
		String method = request.getParameter("method");
		String uid = (String) request.getSession().getAttribute("uid");
		ArticleDao dao = new ArticleDao();
		if (method.equals("show")) {
			//修改阅读量，刷新一次，页面算一次阅读，暂时这样处理
			dao.updateReadCount(aid);
			
			//存入文章的一些信息
			Article article = dao.getArticleById(aid);
			request.setAttribute("article", article);
			
			//存该文章作者的一些信息
			//该作者最近的文章的前三篇
			List<Article> recent_article = dao.getRecentArticleById(uid);
			request.setAttribute("recent_article", recent_article);
			
			//该作者有哪些分类，每个分类写了几篇文章
			Map<String, Integer> classify_count = dao.getClassifyCount(article.getUid());
			request.setAttribute("classify_count", classify_count);
			
			//关注的数量
			AttentionDao attention = new AttentionDao();
			int focus = attention.getFocusCount(article.getUid());
			request.setAttribute("focus_count", focus);
			
			//粉丝的数量
			int befocus = attention.getBeFocusCount(article.getUid());
			request.setAttribute("befocus_count", befocus);
			
			//原创文章的数量
			int byself_count = dao.getByselfCount(article.getUid());
			request.setAttribute("byself_count", byself_count);
			
			//当前登录用户是否关注当前文章作者
			String hasFocus = attention.hasFocus(uid, article.getUid());
			request.setAttribute("hasFocus", hasFocus);
			
			//存入所有评论的信息
			CommentDao cdao = new CommentDao();
			List<Comment> comment_list = cdao.getAllCommentById(aid);
			request.setAttribute("comment_list", comment_list);
			request.getRequestDispatcher("article.jsp").forward(request, response);
		} else if (method.equals("delete")) {
			dao.deleteArticle(aid);
		} else if (method.equals("publish")) {
			dao.publishArticle(aid);
		} else if (method.equals("thorough-delete")) {
			dao.thoroughDeleteArticle(aid);
		} else if (method.equals("search")) {
			String type = request.getParameter("type");
			String classify = request.getParameter("classify");
			String keyword = request.getParameter("keyword");
			List<Article> searchResult = dao.searchArticle(uid, type, classify, keyword);
			ObjectMapper mapper = new ObjectMapper();
			mapper.setSerializationInclusion(Include.NON_EMPTY );
			String jsonlist = mapper.writeValueAsString(searchResult);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().println(jsonlist);
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
