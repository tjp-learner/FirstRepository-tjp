package com.tjp.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjp.dao.ArticleDao;
import com.tjp.domain.Article;

/**
 * Servlet implementation class UeditorServlet
 */
public class UeditorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UeditorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uid = (String) request.getSession().getAttribute("uid");
		String method = request.getParameter("method");
		String aid = UUID.randomUUID().toString().replace("-", "");
		String title = request.getParameter("title");
		String content = request.getParameter("editorValue");
		String tag = request.getParameter("tag");
		String person_classify = request.getParameter("classify");
		String type = request.getParameter("type");
		String all_classify = request.getParameter("all-classify");
		Article article = new Article();
		article.setAid(aid);
		article.setTitle(title);
		article.setContent(content);
		article.setTag(tag);
		article.setPerson_classify(person_classify);
		switch (type) {
		case "1":
			type = "原创";
			break;
		case "2":
			type = "转载";
			break;
		case "3":
			type = "翻译";
			break;
		}
		article.setType(type);
		switch (all_classify) {
		case "1":
			all_classify = "云计算/大数据";
			break;
		case "2":
			all_classify = "游戏开发";
			break;
		case "3":
			all_classify = "运维";
			break;
		case "4":
			all_classify = "数据库";
			break;
		case "5":
			all_classify = "前端";
			break;
		case "6":
			all_classify = "后端";
			break;
		case "7":
			all_classify = "编程语言";
			break;
		case "8":
			all_classify = "网络安全";
			break;
		}
		article.setAll_classify(all_classify);
		article.setUid(uid);
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		String time = df.format(date);
		article.setTime(time);
		article.setUsername((String) request.getSession().getAttribute("username"));
		article.setReadCount(0);
		article.setCommentCount(0);
		ArticleDao dao = new ArticleDao();
		if (method.equals("publish")) {
			article.setStatus("已发布");
		} else {
			article.setStatus("草稿");
		}
		dao.saveArticle(article);
		response.getWriter().println("ok" + aid);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
