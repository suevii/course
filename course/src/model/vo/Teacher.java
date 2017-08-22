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
	private String tsex;
	private String tdegree;
	private String tdept;
	private String ttitle;
	private String tinfo;
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
	public Teacher(String tname, String pwd, String tsex, String tdegree,
			String tdept, String ttitle, String tinfo, Set opens) {
		this.tname = tname;
		this.pwd = pwd;
		this.tsex = tsex;
		this.tdegree = tdegree;
		this.tdept = tdept;
		this.ttitle = ttitle;
		this.tinfo = tinfo;
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

	public String getTsex() {
		return this.tsex;
	}

	public void setTsex(String tsex) {
		this.tsex = tsex;
	}

	public String getTdegree() {
		return this.tdegree;
	}

	public void setTdegree(String tdegree) {
		this.tdegree = tdegree;
	}

	public String getTdept() {
		return this.tdept;
	}

	public void setTdept(String tdept) {
		this.tdept = tdept;
	}

	public String getTtitle() {
		return this.ttitle;
	}

	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}

	public String getTinfo() {
		return this.tinfo;
	}

	public void setTinfo(String tinfo) {
		this.tinfo = tinfo;
	}

	public Set getOpens() {
		return this.opens;
	}

	public void setOpens(Set opens) {
		this.opens = opens;
	}

}