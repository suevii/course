package model.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Teacher entity. @author MyEclipse Persistence Tools
 */

public class Teacher implements java.io.Serializable {

	// Fields

	private String tnum;
	private String tname;
	private String pwd;
	private Set opens = new HashSet(0);

	// Constructors

	/** default constructor */
	public Teacher() {
	}

	/** minimal constructor */
	public Teacher(String tname) {
		this.tname = tname;
	}

	/** full constructor */
	public Teacher(String tname, String pwd, Set opens) {
		this.tname = tname;
		this.pwd = pwd;
		this.opens = opens;
	}

	// Property accessors

	public String getTnum() {
		return this.tnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public String getTname() {
		return this.tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Set getOpens() {
		return this.opens;
	}

	public void setOpens(Set opens) {
		this.opens = opens;
	}

}