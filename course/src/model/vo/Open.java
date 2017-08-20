package model.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * Open entity. @author MyEclipse Persistence Tools
 */

public class Open implements java.io.Serializable {

	// Fields

	private Long openId;
	private Teacher teacher;
	private Course course;
	private Integer cterm;
	private String ctime;
	private Set selects = new HashSet(0);

	// Constructors

	/** default constructor */
	public Open() {
	}

	/** minimal constructor */
	public Open(Teacher teacher, Course course) {
		this.teacher = teacher;
		this.course = course;
	}

	/** full constructor */
	public Open(Teacher teacher, Course course, Integer cterm, String ctime,
			Set selects) {
		this.teacher = teacher;
		this.course = course;
		this.cterm = cterm;
		this.ctime = ctime;
		this.selects = selects;
	}
	
	public String getRealTerm(){
		StringBuffer cterm = new StringBuffer(Integer.toString(this.cterm/10));
		cterm.append("年");
		switch (this.cterm % 10){
			case 1:
				cterm.append("春季学期");
				break;
			case 2:
				cterm.append("夏季学期");
				break;
			case 3:
				cterm.append("秋季学期");
				break;
			case 4:
				cterm.append("冬季学期");
				break;
		}
		return cterm.toString();
	}
	
	// Property accessors

	public Long getOpenId() {
		return this.openId;
	}

	public void setOpenId(Long openId) {
		this.openId = openId;
	}

	public Teacher getTeacher() {
		return this.teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Course getCourse() {
		return this.course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Integer getCterm() {
		return this.cterm;
	}

	public void setCterm(Integer cterm) {
		this.cterm = cterm;
	}

	public String getCtime() {
		return this.ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public Set getSelects() {
		return this.selects;
	}

	public void setSelects(Set selects) {
		this.selects = selects;
	}

}