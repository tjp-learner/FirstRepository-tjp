package com.tjp.student.element;

public class Course {
	private int Cno;
	private String Cname;
	private int Ccredit;
	private int Ccredit_hours;
	private String Crequirement;
	public Course(int cno, String cname, int ccredit, int ccredit_hours, String crequirement) {
		Cno = cno;
		Cname = cname;
		Ccredit = ccredit;
		Ccredit_hours = ccredit_hours;
		Crequirement = crequirement;
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
	public String getCrequirement() {
		return Crequirement;
	}
	public void setCrequirement(String crequirement) {
		Crequirement = crequirement;
	}
	
}
