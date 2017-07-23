package model;
import java.io.Serializable;
import java.sql.Date;
public class MailTable implements Serializable{
	private int mail_id;
	private String num_from;
	private String num_to;
	private int open_id;
	private String title;
	private String content;
	private Date time;
	
	public int getMail_Id() {
		return mail_id;
	}
	public void setMail_Id(int mail_id) {
		this.mail_id=mail_id;
	}
	public int getOpen_Id() {
		return open_id;
	}
	public void setOpen_Id(int open_id) {
		this.open_id=open_id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time=time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title=title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content=content;
	}
	public String getNum_from() {
		return num_from;
	}
	public void setNum_from(String num_from) {
		this.num_from=num_from;
	}
	public String getNum_to() {
		return num_to;
	}
	public void setNum_to(String num_to) {
		this.num_to=num_to;
	}
	

}
