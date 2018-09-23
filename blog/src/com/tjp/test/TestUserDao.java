package com.tjp.test;

import org.junit.jupiter.api.Test;

import com.tjp.dao.UserDao;

public class TestUserDao {

	
	@Test
	public void testUserDao() {
		UserDao dao = new UserDao();
		System.out.println(dao.isEmailRepeat("asdfasdf"));
		System.out.println("中国人");
	}
}
