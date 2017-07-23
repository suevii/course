package model;

public class OpenCourse {
	private long open_id;
	private String cnum;
	private String tnum;
	private String cname;
	
	private int term;
	
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
	
	public void setRealTerm(String term){//读取前四个字符   并查找季节字符
		String result=term.substring(0, 4);
		if(term.indexOf("春")!=-1){
			result+="1";
		}
		else if(term.indexOf("夏")!=-1){
			result+="2";
		}
		else if(term.indexOf("秋")!=-1){
			result+="3";
		}
		else if(term.indexOf("冬")!=-1){
			result+="4";
		}
		this.term=Integer.parseInt(result);
	}
	
	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname =cname;
	}
	
	public long getOpen_id() {
		return open_id;
	}
	public void setOpen_id(long open_id) {
		this.open_id = open_id;
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
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
}
