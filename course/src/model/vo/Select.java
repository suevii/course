package model.vo;

/**
 * Select entity. @author MyEclipse Persistence Tools
 */

public class Select implements java.io.Serializable {

	// Fields
	private Long open_id;
	

	private SelectId id;

	// Constructors

	/** default constructor */
	public Select() {
	}

	/** full constructor */
	public Select(SelectId id) {
		this.id = id;
	}

	// Property accessors

	public Long getOpen_id() {
		return open_id;
	}

	public void setOpen_id(Long open_id) {
		this.open_id = open_id;
	}
	
	public SelectId getId() {
		return this.id;
	}

	public void setId(SelectId id) {
		this.id = id;
	}

}