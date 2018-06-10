package com.tjp.teacher.element;

public class TeachingCourse {
	private int Cno;
	private String Cname;
	private int Ccredit;
	private int Ccredit_hours;
	private String T_address;
	public TeachingCourse(int cno, String cname, int ccredit, int ccredit_hours, String t_address) {
		Cno = cno;
		Cname = cname;
		Ccredit = ccredit;
		Ccredit_hours = ccredit_hours;
		T_address = t_address;
	}
	public int getCno() {
		return Cno;
	}
	public void setCno(int cno) {
		Cno = cno;
	}
	public String getCname() {
		return Cname;
	}
	public void setCname(String cname) {
		Cname = cname;
	}
	public int getCcredit() {
		return Ccredit;
	}
	public void setCcredit(int ccredit) {
		Ccredit = ccredit;
	}
	public int getCcredit_hours() {
		return Ccredit_hours;
	}
	public void setCcredit_hours(int ccredit_hours) {
		Ccredit_hours = ccredit_hours;
	}
	public String getT_address() {
		return T_address;
	}
	public void setT_address(String t_address) {
		T_address = t_address;
	}
	
}
