package model.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Course entity. @author MyEclipse Persistence Tools
 */

public class Course implements java.io.Serializable {

	// Fields

	private String cnum;
	private String cname;
	private Integer credit;
	private Set opens = new HashSet(0);

	// Constructors

	/** default constructor */
	public Course() {
	}

	/** minimal constructor */
	public Course(String cname) {
		this.cname = cname;
	}

	/** full constructor */
	public Course(String cname, Integer credit, Set opens) {
		this.cname = cname;
		this.credit = credit;
		this.opens = opens;
	}

	// Property accessors

	public String getCnum() {
		return this.cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Integer getCredit() {
		return this.credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public Set getOpens() {
		return this.opens;
	}

	public void setOpens(Set opens) {
		this.opens = opens;
	}

}