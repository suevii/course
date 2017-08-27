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
	private String ssex;
	private String sbirthplace;
	private String sphone;
	private String pwd;
	private String sdept;
	private Double gpa;
	private Set selects = new HashSet(0);

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** full constructor */
	public Student(String sname, String ssex, String sbirthplace, String sphone, String pwd, String sdept, Double gpa,
			Set selects) {
		this.sname = sname;
		this.ssex = ssex;
		this.sbirthplace = sbirthplace;
		this.sphone = sphone;
		this.pwd = pwd;
		this.sdept = sdept;
		this.gpa = gpa;
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

	public String getSsex() {
		return this.ssex;
	}

	public void setSsex(String ssex) {
		this.ssex = ssex;
	}

	public String getSbirthplace() {
		return this.sbirthplace;
	}

	public void setSbirthplace(String sbirthplace) {
		this.sbirthplace = sbirthplace;
	}

	public String getSphone() {
		return this.sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSdept() {
		return this.sdept;
	}

	public void setSdept(String sdept) {
		this.sdept = sdept;
	}

	public Double getGpa() {
		return this.gpa;
	}

	public void setGpa(Double gpa) {
		this.gpa = gpa;
	}

	public Set getSelects() {
		return this.selects;
	}

	public void setSelects(Set selects) {
		this.selects = selects;
	}

}