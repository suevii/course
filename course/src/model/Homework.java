package model;

import java.util.Date;

public class Homework {
	private String title;
	private Long open_id;
	private String content;
	private Date out_time;
	private Date deadline;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getOpen_id() {
		return open_id;
	}
	public void setOpen_id(Long open_id) {
		this.open_id = open_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getOut_time() {
		return out_time;
	}
	public void setOut_time(Date out_time) {
		this.out_time = out_time;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	
}
