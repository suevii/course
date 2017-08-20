package model.vo;

/**
 * SelectId entity. @author MyEclipse Persistence Tools
 */

public class SelectId implements java.io.Serializable {

	// Fields

	private Open open;
	private Student student;

	// Constructors

	/** default constructor */
	public SelectId() {
	}

	/** full constructor */
	public SelectId(Open open, Student student) {
		this.open = open;
		this.student = student;
	}

	// Property accessors

	public Open getOpen() {
		return this.open;
	}

	public void setOpen(Open open) {
		this.open = open;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SelectId))
			return false;
		SelectId castOther = (SelectId) other;

		return ((this.getOpen() == castOther.getOpen()) || (this.getOpen() != null
				&& castOther.getOpen() != null && this.getOpen().equals(
				castOther.getOpen())))
				&& ((this.getStudent() == castOther.getStudent()) || (this
						.getStudent() != null && castOther.getStudent() != null && this
						.getStudent().equals(castOther.getStudent())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getOpen() == null ? 0 : this.getOpen().hashCode());
		result = 37 * result
				+ (getStudent() == null ? 0 : this.getStudent().hashCode());
		return result;
	}

}