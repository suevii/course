package action;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import model.*;
import com.opensymphony.xwork2.*;
import db.DB;

public class AddTaskAction extends ActionSupport{
	private Homework task;
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String deadline = request.getParameter("deadline");
		ActionContext context = ActionContext.getContext();
		Map session = context.getSession();
		String open_id = (String)session.get("openid");
		Long openid = Long.parseLong(open_id);
		String title = task.getTitle();
		String content = task.getContent();
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp out_time = new Timestamp(System.currentTimeMillis());
		Timestamp dead = Timestamp.valueOf(deadline+ " 00:00:00");
		PreparedStatement pstmt = null;
		DB db = new DB();
		Connection ct = db.getConn();
		try{
			pstmt = ct.prepareStatement("insert into homework values(?,?,?,?,?)");
			pstmt.setString(1, title);
			pstmt.setLong(2, openid);
			pstmt.setString(3, content);
			pstmt.setTimestamp(4, out_time);
			pstmt.setTimestamp(5, dead);
			pstmt.executeUpdate();
			return "success";
		}catch(SQLException e){
			e.printStackTrace();
			return "error";
		}
	}
	public Homework getTask(){
		return this.task;
	}
	public void setTask(Homework task){
		this.task = task;
	}

}
