package model.vo;

/**
 * Select entity. @author MyEclipse Persistence Tools
 */

public class Select implements java.io.Serializable {

	// Fields

	private SelectId id;
	private Integer grade;

	// Constructors

	/** default constructor */
	public Select() {
	}

	/** minimal constructor */
	public Select(SelectId id) {
		this.id = id;
	}

	/** full constructor */
	public Select(SelectId id, Integer grade) {
		this.id = id;
		this.grade = grade;
	}

	// Property accessors

	public SelectId getId() {
		return this.id;
	}

	public void setId(SelectId id) {
		this.id = id;
	}

	public Integer getGrade() {
		return this.grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

}