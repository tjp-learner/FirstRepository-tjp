package com.tjp.student.element;

public class Student_Grade {
	private int Cno;
	private String Cname;
	private String Crequirement;
	private int Ccredit;
	private int Grade;
	public Student_Grade(int cno, String cname, String crequirement, int ccredit, int grade) {
		Cno = cno;
		Cname = cname;
		Crequirement = crequirement;
		Ccredit = ccredit;
		Grade = grade;
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
	public String getCrequirement() {
		return Crequirement;
	}
	public void setCrequirement(String crequirement) {
		Crequirement = crequirement;
	}
	public int getCcredit() {
		return Ccredit;
	}
	public void setCcredit(int ccredit) {
		Ccredit = ccredit;
	}
	public int getGrade() {
		return Grade;
	}
	public void setGrade(int grade) {
		Grade = grade;
	}
	
}
