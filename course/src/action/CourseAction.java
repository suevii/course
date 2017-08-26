package action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import model.UserTable;

public class CourseAction extends ActionSupport{
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String coursenum = request.getParameter("coursenum");
		String openid = request.getParameter("openid");
		ActionContext context = ActionContext.getContext();
		Map session = context.getSession();
		session.put("coursenum",coursenum);
		session.put("openid",openid);
		
		String character = (String)session.get("character");
		return character;
	}
}
