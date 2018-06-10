package com.tjp.teacher.element;

public class TeachingGrade {
	private int Cno;
	private String Cname;
	private String Sname;
	private int Sno;
	private int Grade;
	public TeachingGrade(int cno, String cname, String sname, int sno, int grade) {
		Cno = cno;
		Cname = cname;
		Sname = sname;
		Sno = sno;
		Grade = grade;
	}
	public String getCname() {
		return Cname;
	}
	public void setCname(String cname) {
		Cname = cname;
	}
	public int getCno() {
		return Cno;
	}
	public void setCno(int cno) {
		Cno = cno;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public int getSno() {
		return Sno;
	}
	public void setSno(int sno) {
		Sno = sno;
	}
	public int getGrade() {
		return Grade;
	}
	public void setGrade(int grade) {
		Grade = grade;
	}
}
