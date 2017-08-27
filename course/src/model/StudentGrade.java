package model;

public class StudentGrade  implements Comparable<StudentGrade>{
	String snum;
	String sname;
	Integer score;
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String aname) {
		this.sname = aname;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public int compareTo(StudentGrade o) {
		String snum=o.getSnum();
		return this.snum.compareTo(snum);
	}
	
	
}
