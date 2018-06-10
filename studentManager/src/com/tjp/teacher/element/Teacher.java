package com.tjp.teacher.element;

public class Teacher {
	private int Tno;
	private String Tname;
	private String Tsex;
	private int Tage;
	private String Ttitle;
	private String Temail;
	private String Tphone;
	public Teacher(int tno, String tname, String tsex, int tage, String ttitle, String temail, String tphone) {
		Tno = tno;
		Tname = tname;
		Tsex = tsex;
		Tage = tage;
		Ttitle = ttitle;
		Temail = temail;
		Tphone = tphone;
	}
	public int getTno() {
		return Tno;
	}
	public void setTno(int tno) {
		Tno = tno;
	}
	public String getTname() {
		return Tname;
	}
	public void setTname(String tname) {
		Tname = tname;
	}
	public String getTsex() {
		return Tsex;
	}
	public void setTsex(String tsex) {
		Tsex = tsex;
	}
	public int getTage() {
		return Tage;
	}
	public void setTage(int tage) {
		Tage = tage;
	}
	public String getTtitle() {
		return Ttitle;
	}
	public void setTtitle(String ttitle) {
		Ttitle = ttitle;
	}
	public String getTemail() {
		return Temail;
	}
	public void setTemail(String temail) {
		Temail = temail;
	}
	public String getTphone() {
		return Tphone;
	}
	public void setTphone(String tphone) {
		Tphone = tphone;
	}
	
}
