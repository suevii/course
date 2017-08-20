package action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import db.DB;
import model.UserTable;

public class LoginAction extends ActionSupport{
	private UserTable user;
	String message="用户名或密码错误";
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String character = request.getParameter("character");
		String usr = user.getUsername();
		String pwd = user.getPassword();
		boolean validated = false;
		DB usrdb = new DB();
		ActionContext context = ActionContext.getContext();
		Map session = context.getSession();
		UserTable user1 = (UserTable)session.get("user");
		String sql = null,idcmp = null,next = null;
		int level = -1;
		if(character.equals("student")){
			sql = "select * from student";
			idcmp = "sNum";
			next = "student";
			level = 0;
		}
		else{
			sql = "select * from teacher";
			idcmp = "tNum";
			next ="teacher";
			level = 1;
		}
		if(user1 == null){	
			ResultSet rs = usrdb.executeQuery(sql);
			try{
				while(rs.next()){
					if((rs.getString(idcmp).trim().compareTo(usr) == 0) && (rs.getString("pwd").compareTo(pwd) == 0)){
						user1 = new UserTable();
						user1.setId(rs.getString(1));
						user1.setUsername(rs.getString(2));
						user1.setPassword(rs.getString(3));
						user1.setLevel(level);
						session.put("user", user1);
						validated = true;
					}
				}
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			usrdb.closeStmt();
		}
		else{
			validated = true;
		}
		if(validated){
			return next;
		}
		else{
			 request.setAttribute("tipMessage", message);
			 return "login";
//			return "error";
			
		}
	}
	public UserTable getUser(){
		return user;
	}
	public void setUser(UserTable user){
		this.user = user;
	}
}

