package action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.ILoginDAO;
import dao.LoginDAO;
import db.DB;
import model.UserTable;
import model.vo.*;

public class LoginAction extends ActionSupport{
	private UserTable user;
	String message="用户名或密码错误";
	
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String character = request.getParameter("character");
		String usr = user.getUsername();
		String pwd = user.getPassword();
		boolean validated = false;
		ActionContext context = ActionContext.getContext();
		Map session = context.getSession();
		Object user1 = (Object)session.get("user");
		String next = null;
		if(user1 == null){	
			ILoginDAO loginDAO = new LoginDAO();
			user1 = loginDAO.validateUser(usr, pwd, character);
			if(user1 != null){
				session.put("user", user1);
				if(user1 instanceof Student){
					session.put("character", "student");
					next = "student";
				}else if(user1 instanceof Teacher){
					session.put("character", "teacher");
					next = "teacher";
				}
				validated = true;
			}
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

