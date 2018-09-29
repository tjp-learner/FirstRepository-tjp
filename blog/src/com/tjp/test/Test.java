package com.tjp.test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

	public static void main(String[] args) {
		String date = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒").format(new Date());
		 System.out.println(date);
	}
}
