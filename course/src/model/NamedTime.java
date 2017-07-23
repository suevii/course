package model;

import java.util.ArrayList;

public class NamedTime {
	private String tnum;
	private long open_id;
	private String date;
	private ArrayList<String> record=new ArrayList<String>();
	

	public ArrayList<String> getRecord() {
		return record;
	}
	public void setRecord(ArrayList<String> record) {
		this.record = record;
	}
	public String getTnum() {
		return tnum;
	}
	public void setTnum(String tnum) {
		this.tnum = tnum;
	}
	public long getOpen_id() {
		return open_id;
	}
	public void setOpen_id(long open_id) {
		this.open_id = open_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}


	
	
}
