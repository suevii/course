package model;

import java.io.Serializable;

public class User implements Serializable {
	private String usernum;
	private String password;
	private int studentOrTeacher;//学生0教师1
	
	public String getUsernum() {
		return usernum;
	}
	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getStudentOrTeacher() {
		return studentOrTeacher;
	}
	public void setStudentOrTeacher(int studentOrTeacher) {
		this.studentOrTeacher = studentOrTeacher;
	}
	
}