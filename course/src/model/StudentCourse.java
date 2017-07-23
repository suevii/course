package model;

public class StudentCourse {
	private String cnum;
	private String tnum;
	private String snum;
	private String tname;
	private String cname;
	private int term;
	private long open_id;
	
	public long getOpen_id() {
		return open_id;
	}
	public void setOpen_id(long open_id) {
		this.open_id = open_id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	public String getTnum() {
		return tnum;
	}
	public void setTnum(String tnum) {
		this.tnum = tnum;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public String getRealTerm(){
		StringBuffer term=new StringBuffer(Integer.toString(this.term/10));
		term.append("年");
		switch (this.term%10){
			case 1:
				term.append("春季学期");
				break;
			case 2:
				term.append("夏季学期");
				break;
			case 3:
				term.append("秋季学期");
				break;
			case 4:
				term.append("冬季学期");
				break;
		}
		return term.toString();
	}
	
}
