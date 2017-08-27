package model.vo;

/**
 * Semester entity. @author MyEclipse Persistence Tools
 */

public class Semester implements java.io.Serializable {

	// Fields

	private Integer cterm;
	private String realTerm;

	// Constructors

	/** default constructor */
	public Semester() {
	}

	/** full constructor */
	public Semester(String realTerm) {
		this.realTerm = realTerm;
	}

	// Property accessors

	public Integer getCterm() {
		return this.cterm;
	}

	public void setCterm(Integer cterm) {
		this.cterm = cterm;
	}

	public String getRealTerm() {
		return this.realTerm;
	}

	public void setRealTerm(String realTerm) {
		this.realTerm = realTerm;
	}

}