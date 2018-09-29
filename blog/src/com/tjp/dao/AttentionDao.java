package com.tjp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import com.tjp.util.JDBCUtil;

public class AttentionDao {

	public void addFocus(String focus, String befocus) {
		String focus_id = UUID.randomUUID().toString().replace("-", "");
		String sql = "insert into attention values(?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, focus_id);
			ps.setString(2, focus);
			ps.setString(3, befocus);
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("插入数据异常");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, ps, con);
		}

	}

	public void cancelFocus(String focus, String befocus) {
		String sql = "delete from attention where focus=? and befocus=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, focus);
			ps.setString(2, befocus);
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("删除数据异常");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, ps, con);
		}

	}

	public int getFocusCount(String uid) {
		String sql = "select count(*) from attention where focus = ?";
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

	public int getBeFocusCount(String uid) {
		String sql = "select count(*) from attention where befocus = ?";
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

	public String hasFocus(String uid1, String uid2) {
		String hasFocus = "no";
		String sql = "select * from attention where focus=? and befocus=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, uid1);
			ps.setString(2, uid2);
			rs = ps.executeQuery();
			if (rs.next()) {
				hasFocus = "yes";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, ps, con);
		}
		return hasFocus;
	}

}
