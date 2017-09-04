package action;
import java.sql.Date;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import db.DB;
import model.MailTable;
import model.UserTable;
import model.vo.*;

public class mail_send {
	private String num_to;
	private String title;
	private String content;
	
	public String execute(){
		ActionContext context;
		Map session;
		DB db=new DB();
		context=ActionContext.getContext();
		session=context.getSession();
		String character = (String)session.get("character");
		String id = null;
		Object user = session.get("user");
		if(character.equals("student")){
			user = (Student)user;
			id = ((Student)user).getSnum();
		}else if(character.equals("teacher")){
			user = (Teacher)user;
			id = ((Teacher)user).getTnum();
		}
		//UserTable user=(UserTable) session.get("user");
		MailTable mail=new MailTable();
		mail.setNum_from(id);
		mail.setNum_to(num_to);
		
		mail.setTitle(title);
		mail.setContent(content);
		mail.setTime(new Date(System.currentTimeMillis()));
		System.out.println(content);
		if(db.addInfo(mail)){
			return "success";
		}
		else{
			return "error";
		}
		
	}
	
	public String getNum_to() {
		return num_to;
	}
	public void setNum_to(String num_to) {
		this.num_to=num_to;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}


