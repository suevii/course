package action;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import model.*;
import com.opensymphony.xwork2.*;
import db.DB;

public class Score extends ActionSupport{
	private ArrayList<Integer> score=new ArrayList<Integer>();
	private ArrayList<String> student=new ArrayList<String>();

	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		ActionContext context = ActionContext.getContext();
		Map session = context.getSession();
		String open_id = (String)session.get("openid");
		Long openid = Long.parseLong(open_id);
		DB db = new DB();
		db.setScore(student, score, openid);
		return "success";
	}



	public ArrayList<Integer> getScore() {
		return score;
	}



	public void setScore(ArrayList<Integer> score) {
		this.score = score;
	}



	public ArrayList<String> getStudent() {
		return student;
	}

	public void setStudent(ArrayList<String> student) {
		this.student = student;
	}


}
