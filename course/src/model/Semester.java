package model;

public class Semester {
	private int term;
	private int year;
	private int season;
	public Semester(){
		year = 2017;
		season = 1;
		term = year*10 + season;
	}
	public void setTerm(int year, int season){
		this.year = year;
		this.season = season;
		term = year*10 + season;
	}
	public String getLongTerm(){
		StringBuffer term=new StringBuffer(Integer.toString(this.year));
		term.append("年");
		switch (this.season){
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
	public String getShortTerm(){
		StringBuffer term=new StringBuffer(Integer.toString(this.year));
		switch (this.season){
			case 1:
				term.append("春");
				break;
			case 2:
				term.append("夏");
				break;
			case 3:
				term.append("秋");
				break;
			case 4:
				term.append("冬");
				break;
		}
		return term.toString();
	}
	public int getTerm(){
		return this.term;
	}
	public int getYear(){
		return this.year;
	}
	public int getSeason(){
		return this.season;
	}

}
