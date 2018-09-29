package com.tjp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.tjp.domain.Article;
import com.tjp.util.JDBCUtil;

public class ArticleDao {

	public void saveArticle(Article article) {
		String sql = "insert into article values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, article.getAid());
			ps.setString(2, article.getTitle());
			ps.setString(3, article.getContent());
			ps.setString(4, article.getTag());
			ps.setString(5, article.getPerson_classify());
			ps.setString(6, article.getType());
			ps.setString(7, article.getAll_classify());
			ps.setString(8, article.getStatus());
			ps.setString(9, article.getUid());
			ps.setString(10, article.getTime());
			ps.setInt(11, article.getReadCount());
			ps.setInt(12, article.getCommentCount());
			ps.setString(13, article.getUsername());
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("插入数据错误");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, ps, con);
		}
	}

	public Article getArticleById(String aid) {
		String sql = "select * from article where aid='" + aid + "'";
		Connection con = null;
		Statement sts = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			sts = con.createStatement();
			rs = sts.executeQuery(sql);
			if (rs.next()) {
				Article article = new Article();
				article.setAid(aid);
				article.setTitle(rs.getNString("title"));
				article.setContent(rs.getNString("content"));
				article.setTime(rs.getNString("time"));
				article.setType(rs.getNString("type"));
				article.setUid(rs.getNString("uid"));
				article.setUsername(rs.getNString("username"));
				article.setTag(rs.getNString("tag"));
				article.setAll_classify(rs.getNString("all_classify"));
				return article;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		return null;
	}

	public List<Article> getAllArticleById(String uid) {
		String sql = "select * from article where uid='" + uid + "'";
		Connection con = null;
		Statement sts = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			sts = con.createStatement();
			rs = sts.executeQuery(sql);
			List<Article> list = new ArrayList<>();
			while (rs.next()) {
				Article article = new Article();
				article.setAid(rs.getNString("aid"));
				article.setTitle(rs.getNString("title"));
				article.setType(rs.getNString("type"));
				article.setTime(rs.getNString("time"));
				article.setStatus(rs.getNString("status"));
				article.setPerson_classify(rs.getNString("person_classify"));
				article.setUid(uid);
				list.add(article);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		return null;
	}

	//删除文章，是把文章放入回收站，这里是将article的status置为回收
	public void deleteArticle(String aid) {
		String sql = "update article set status = '回收' where aid='" + aid + "'";
		Connection con = null;
		Statement sts = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			sts = con.createStatement();
			if (sts.executeUpdate(sql) != 1) {
				throw new RuntimeException("文章回收异常");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
	}

	//发布文章，就是将文章的status改为已发布，并且更新时间
	public void publishArticle(String aid) {
		String time = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss").format(new Date());
		String sql = "update article set status = '已发布', time='" + time + "' where aid='" + aid + "'";
		Connection con = null;
		Statement sts = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			sts = con.createStatement();
			if (sts.executeUpdate(sql) != 1) {
				throw new RuntimeException("文章发布异常");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
	}

	//彻底删除文章，就是删除该文章项
	public void thoroughDeleteArticle(String aid) {
		String sql = "delete from article where aid='" + aid + "'";
		Connection con = null;
		Statement sts = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			sts = con.createStatement();
			if (sts.executeUpdate(sql) != 1) {
				throw new RuntimeException("文章彻底删除异常");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		
	}

	public List<Article> getRecentArticle() {
		String sql = "select * from article where status='已发布' order by time desc limit 6";
		Connection con = null;
		Statement sts = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		List<Article> list = new ArrayList<>();
		try {
			sts = con.createStatement();
			rs = sts.executeQuery(sql);
			while (rs.next()) {
				Article item = new Article();
				item.setAid(rs.getNString("aid"));
				item.setTitle(rs.getNString("title"));
				item.setContent(rs.getNString("content"));
				item.setUid(rs.getNString("uid"));
				item.setUsername(rs.getNString("username"));
				item.setTime(rs.getNString("time"));
				item.setAll_classify(rs.getNString("all_classify"));
				item.setReadCount(rs.getInt("readCount"));
				item.setCommentCount(rs.getInt("commentCount"));
				list.add(item);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		return null;
	}

	public void updateReadCount(String aid) {
		String sql = "update article set readCount=readCount+1 where aid='" + aid + "'";
		Connection con = null;
		Statement sts = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			sts = con.createStatement();
			if (sts.executeUpdate(sql) != 1) {
				throw new RuntimeException("更新数据异常");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
	}

	public int getByselfCount(String uid) {
		String sql = "select count(*) from article where uid=? and status='已发布' and type='原创'";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		int count = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, uid);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, ps, con);
		}
		return count;
	}

	public List<Article> getArticlesByClassfiy(String get) {
		String sql = "select * from article where status='已发布' and all_classify = '" + get + "' order by time desc limit 6";
		Connection con = null;
		Statement sts = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		List<Article> list = new ArrayList<>();
		try {
			sts = con.createStatement();
			rs = sts.executeQuery(sql);
			while (rs.next()) {
				Article item = new Article();
				item.setAid(rs.getNString("aid"));
				item.setTitle(rs.getNString("title"));
				item.setContent(rs.getNString("content"));
				item.setUid(rs.getNString("uid"));
				item.setUsername(rs.getNString("username"));
				item.setTime(rs.getNString("time"));
				item.setAll_classify(rs.getNString("all_classify"));
				item.setReadCount(rs.getInt("readCount"));
				item.setCommentCount(rs.getInt("commentCount"));
				list.add(item);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		return null;
	}

	public List<Article> getRecentArticleById(String uid) {
		String sql = "select * from article where uid='" + uid + "' and status='已发布' order by time desc limit 3";
		Connection con = null;
		Statement sts = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			sts = con.createStatement();
			rs = sts.executeQuery(sql);
			List<Article> list = new ArrayList<>();
			while (rs.next()) {
				Article article = new Article();
				article.setAid(rs.getNString("aid"));
				article.setTitle(rs.getNString("title"));
				article.setType(rs.getNString("type"));
				article.setTime(rs.getNString("time"));
				article.setStatus(rs.getNString("status"));
				article.setReadCount(rs.getInt("readCount"));
				list.add(article);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		return null;
	}

	public Map<String, Integer> getClassifyCount(String uid) {
		Connection con = null;
		Statement sts = null;
		ResultSet rs = null;
		List<String> classifys = new ArrayList<>();
		Map<String, Integer> map = new HashMap<>();
		String classify = "select person_classify from article where uid='" + uid + "'";
		try {
			con = JDBCUtil.getConnection();
			sts = con.createStatement();
			rs = sts.executeQuery(classify);
			while (rs.next()) {
				String temp = rs.getString(1);
				if (temp != null && temp.length() != 0) {
					String[] items = temp.split(",");
					for (int i = 0; i < items.length; i++) {
						if (!classifys.contains(items[i])) {
							classifys.add(items[i]);
						}
					}
				}
			}
			for (int i = 0; i < classifys.size(); i++) {
				String sql = "select count(*) from article where uid='" + uid + "' and person_classify like '%" + classifys.get(i) + "%'";
				rs = sts.executeQuery(sql);
				if (rs.next()) {
					map.put(classifys.get(i), rs.getInt(1));
				}
			}
			return map;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		return null;
	}

	public List<Article> searchArticle(String uid, String type, String classify, String keyword) {
		List<Article> list = getAllArticleById(uid);
		Iterator<Article> iter = list.iterator();
		while (iter.hasNext()) {
			Article temp = iter.next();
			if (temp.getStatus().equals("回收")) {
				iter.remove();
			}
		}
		if (type != null && !type.equals("0")) {
			Iterator<Article> iter1 = list.iterator();
			while (iter1.hasNext()) {
				Article temp = iter1.next();
				if (!temp.getType().equals(type)) {
					iter1.remove();
				}
			}
		}
		if (classify != null && !classify.equals("0")) {
			Iterator<Article> iter1 = list.iterator();
			while (iter1.hasNext()) {
				Article temp = iter1.next();
				if (temp.getPerson_classify().indexOf(classify) == -1) {
					iter1.remove();
				}
			}
		}
		if (keyword != null && !keyword.equals("")) {
			keyword = keyword.toLowerCase();
			Iterator<Article> iter1 = list.iterator();
			while (iter1.hasNext()) {
				Article temp = iter1.next();
				String _title = temp.getTitle().toLowerCase();
				if (_title.indexOf(keyword) == -1) {
					iter1.remove();
				}
			}
		}
		return list;
	}



}
