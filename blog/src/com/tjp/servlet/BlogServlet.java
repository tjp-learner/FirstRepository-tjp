package com.tjp.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjp.dao.ArticleDao;
import com.tjp.domain.Article;

/**
 * Servlet implementation class BlogServlet
 */
public class BlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String get = request.getParameter("get");
		String uid = (String) request.getSession().getAttribute("uid");
		ArticleDao dao = new ArticleDao();
		List<Article> article_list = dao.getAllArticleById(uid);
		//先存入所有文章的信息
		request.setAttribute("article_list", article_list);
		//保存 已发布文章的数量,草稿的数量,回收站的数量
		int all = 0;
		int enable = 0;
		int temp = 0;
		int trash = 0;
		for (Article article : article_list) {
			if (!article.getStatus().equals("回收")) {
				all++;
			}
			if (article.getStatus().equals("已发布")) {
				enable++;
			} 
			if (article.getStatus().equals("草稿")) {
				temp++;
			} 
			if (article.getStatus().equals("回收")){
				trash++;
			}
		}
		request.setAttribute("all", all);
		request.setAttribute("enable", enable);
		request.setAttribute("temp", temp);
		request.setAttribute("trash", trash);
		Iterator<Article> iter = article_list.iterator();
		if (get.equals("all")) {
			//该作者有哪些分类，每个分类写了几篇文章
			ArticleDao adao = new ArticleDao();
			Map<String, Integer> classify_count = adao.getClassifyCount(uid);
			request.setAttribute("classify_count", classify_count);
			
			/*将所有status为回收的文章都去掉，前台只显示不是回收的文章*/
			while (iter.hasNext()) {
				Article item = iter.next();
				if (item.getStatus().equals("回收")) {
					iter.remove();
				}
			}
			request.getRequestDispatcher("myblog-article-all.jsp").forward(request, response);
			return ;
		} else if (get.equals("enable")) {
			/*将所有status不是已发布的文章都去掉，前台只显示已发布的文章*/
			while (iter.hasNext()) {
				Article item = iter.next();
				if (!item.getStatus().equals("已发布")) {
					iter.remove();
				}
			}
			request.getRequestDispatcher("myblog-article-enable.jsp").forward(request, response);
			return ;
		} else if (get.equals("temp")) {
			/*将所有status不是草稿的文章都去掉，前台只显示草稿的文章*/
			while (iter.hasNext()) {
				Article item = iter.next();
				if (!item.getStatus().equals("草稿")) {
					iter.remove();
				}
			}
			request.getRequestDispatcher("myblog-article-temp.jsp").forward(request, response);
			return ;
		} else {
			/*将所有status不是回收站的文章都去掉，前台只显示回收的文章*/
			while (iter.hasNext()) {
				Article item = iter.next();
				if (!item.getStatus().equals("回收")) {
					iter.remove();
				}
			}
			request.getRequestDispatcher("myblog-article-trash.jsp").forward(request, response);
			return ;
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
