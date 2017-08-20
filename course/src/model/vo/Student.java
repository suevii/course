package model.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	private String snum;
	private String sname;
	private String pwd;
	private Set selects = new HashSet(0);

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** full constructor */
	public Student(String sname, String pwd, Set selects) {
		this.sname = sname;
		this.pwd = pwd;
		this.selects = selects;
	}

	// Property accessors

	public String getSnum() {
		return this.snum;
	}

	public void setSnum(String snum) {
		this.snum = snum;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Set getSelects() {
		return this.selects;
	}

	public void setSelects(Set selects) {
		this.selects = selects;
	}

}