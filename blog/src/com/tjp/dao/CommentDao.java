package com.tjp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.tjp.domain.Comment;
import com.tjp.util.JDBCUtil;

public class CommentDao {

	public void giveComment(String aid, String uid, String account) {
		String cid = UUID.randomUUID().toString().replace("-", "");
		String time = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss").format(new Date());
		String sql = "insert into comment values(?,?,?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cid);
			ps.setString(2, aid);
			ps.setString(3, uid);
			ps.setString(4, account);
			ps.setString(5, time);
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("插入数据错误");
			}
			//将文章评论量加1
			String add = "update article set commentCount=commentCount+1 where aid='" + aid + "'";
			ps.executeUpdate(add);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, ps, con);
		}
		
	}

	public List<Comment> getAllCommentById(String aid) {
		String sql = "select * from comment where aid = '" + aid + "' order by comment_time desc";
		Connection con = null;
		Statement sts = null;
		Statement sts2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		con = JDBCUtil.getConnection();
		try {
			sts = con.createStatement();
			sts2 = con.createStatement();
			rs = sts.executeQuery(sql);
			List<Comment> list = new ArrayList<>();
			while (rs.next()) {
				Comment item = new Comment();
				item.setCid(rs.getString(1));
				item.setAid(rs.getString(2));
				item.setUid(rs.getString(3));
				item.setAccount(rs.getString(4));
				item.setTime(rs.getString(5));
				String getusername = "select username from user where uid = '" + item.getUid() + "'";
				rs2 = sts2.executeQuery(getusername);
				if (rs2.next()) {
					item.setUsername(rs2.getString(1));
				}
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
	
}
