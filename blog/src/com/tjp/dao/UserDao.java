package com.tjp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;

import com.tjp.domain.JDBCUtil;
import com.tjp.domain.User;

public class UserDao {

	public boolean isEmailRepeat(String email) {
		String sql = "select email from user";
		Connection con = JDBCUtil.getConnection();
		Statement sts = null;
		ResultSet rs = null;
		try {
			sts = con.createStatement();
			rs = sts.executeQuery(sql);
			while (rs.next()) {
				String temp = rs.getString(1);
				if (temp.equals(email)) {
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		return false;
	}

	public boolean isPhoneRepeat(String phone) {
		String sql = "select phone from user";
		Connection con = JDBCUtil.getConnection();
		Statement sts = null;
		ResultSet rs = null;
		try {
			sts = con.createStatement();
			rs = sts.executeQuery(sql);
			while (rs.next()) {
				String temp = rs.getString(1);
				if (temp.equals(phone)) {
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		return false;
	}

	public boolean isUsernameRepeat(String username) {
		String sql = "select username from user";
		Connection con = JDBCUtil.getConnection();
		Statement sts = null;
		ResultSet rs = null;
		try {
			sts = con.createStatement();
			rs = sts.executeQuery(sql);
			while (rs.next()) {
				String temp = rs.getString(1);
				if (temp.equals(username)) {
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		return false;
	}

	public void UserRegister(String email, String phone, String username, String password) {
		String sql = "insert into user(uid,email,phone,username,password) values(?,?,?,?,?)";
		String uid = UUID.randomUUID().toString().replace("-", "");
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, username);
			ps.setString(5, password);
			if (ps.executeUpdate() != 1) {
				throw new RuntimeException("插入数据错误");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, ps, con);
		}
	}

	public String userLogin(String username, String password) {
		String sql = "select uid from user where username=? and password=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				String uid = rs.getString(1);
				return uid;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, ps, con);
		}
		return null;
	}
	
	public boolean hasUser(String username) {
		String sql = "select * from user where username=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = JDBCUtil.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, ps, con);
		}
		return false;
	}

	public User getUserById(String uid) {
		String sql = "select * from user where uid='" + uid + "'";
		Connection con = JDBCUtil.getConnection();
		Statement sts = null;
		ResultSet rs = null;
		try {
			sts = con.createStatement();
			rs = sts.executeQuery(sql);
			if (rs.next()) {
				User user = new User();
				user.setUsername(rs.getNString("username"));
				user.setEmail(rs.getNString("email"));
				user.setPhone(rs.getNString("phone"));
				user.setImage(rs.getNString("image"));
				user.setSex(rs.getNString("sex"));
				user.setTruename(rs.getNString("truename"));
				user.setJob(rs.getNString("job"));
				user.setLocation(rs.getNString("location"));
				user.setBirthday(rs.getNString("birthday"));
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
		return null;
	}

	public void saveImg(String uid, String fileName) {
		String sql = "update user set image='" + fileName + "' where uid='" + uid + "'";
		Connection con = JDBCUtil.getConnection();
		Statement sts = null;
		ResultSet rs = null;
		try {
			sts = con.createStatement();
			sts.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, sts, con);
		}
	}
}
