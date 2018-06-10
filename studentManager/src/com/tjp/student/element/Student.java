package com.tjp.student.element;

public class Student {
	private int Sno;
	private String Sname;
	private String Ssex;
	private int Sage;
	private String Sdept;
	private String Semail;
	private String Sphone;
	private String Spassword;
	public Student(int sno, String sname, String ssex, int sage, String sdept, String semail, String sphone,
			String spassword) {
		Sno = sno;
		Sname = sname;
		Ssex = ssex;
		Sage = sage;
		Sdept = sdept;
		Semail = semail;
		Sphone = sphone;
		Spassword = spassword;
	}
	public int getSno() {
		return Sno;
	}
	public void setSno(int sno) {
		Sno = sno;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public String getSsex() {
		return Ssex;
	}
	public void setSsex(String ssex) {
		Ssex = ssex;
	}
	public int getSage() {
		return Sage;
	}
	public void setSage(int sage) {
		Sage = sage;
	}
	public String getSdept() {
		return Sdept;
	}
	public void setSdept(String sdept) {
		Sdept = sdept;
	}
	public String getSemail() {
		return Semail;
	}
	public void setSemail(String semail) {
		Semail = semail;
	}
	public String getSphone() {
		return Sphone;
	}
	public void setSphone(String sphone) {
		Sphone = sphone;
	}
	public String getSpassword() {
		return Spassword;
	}
	public void setSpassword(String spassword) {
		Spassword = spassword;
	}
	
}
