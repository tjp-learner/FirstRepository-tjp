package com.tjp.student.element;

public class Teaching_eva {
	private int Tno;
	private int Cno;
	private int E_grade;
	public Teaching_eva(int tno, int cno, int e_grade) {
		Tno = tno;
		Cno = cno;
		E_grade = e_grade;
	}
	public int getTno() {
		return Tno;
	}
	public void setTno(int tno) {
		Tno = tno;
	}
	public int getCno() {
		return Cno;
	}
	public void setCno(int cno) {
		Cno = cno;
	}
	public int getE_grade() {
		return E_grade;
	}
	public void setE_grade(int e_grade) {
		E_grade = e_grade;
	}
	
}
