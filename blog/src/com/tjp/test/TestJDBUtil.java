package com.tjp.test;

import org.junit.jupiter.api.Test;

import com.tjp.util.JDBCUtil;

public class TestJDBUtil {

	@Test
	public void testJDBCUtil() {
		System.out.println(JDBCUtil.getConnection());
	}
}
