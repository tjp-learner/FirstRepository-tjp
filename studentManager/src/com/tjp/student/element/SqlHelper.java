package com.tjp.student.element;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

//静态加载驱动类
public class SqlHelper {
	public static Connection con=null;
	public static PreparedStatement ps=null;
	private static String url="";
	private static String user="";
	private static String password="";
	private static String driver="";
	
	private static Properties pp=null;
	private static FileInputStream fis=null;
	
	//静态加载驱动类，只需要加载一次
	static {
		try {
			pp=new Properties();
			fis=new FileInputStream("D:/Desktop/studentManager/src/db.properties");
			pp.load(fis);
			url=pp.getProperty("url");
			user=pp.getProperty("user");
			driver=pp.getProperty("driver");
			password=pp.getProperty("password");
			Class.forName(driver);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	//建立连接，得到Connection方法
	public static Connection getConnection() {
		Connection con=null;
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
 	//关闭相关变量
	public static void close(Connection con,PreparedStatement ps,ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(ps!=null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	//关闭相关变量
	public static void close(Connection con,Statement sts,ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(sts!=null) {
			try {
				sts.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
