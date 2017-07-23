package action;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import model.*;
import com.opensymphony.xwork2.*;
import db.DB;

public class DeleteTaskAction extends ActionSupport{
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] title = request.getParameterValues("title");
		int length = title.length;
		ActionContext context = ActionContext.getContext();
		Map session = context.getSession();
		String open_id = (String)session.get("openid");
		Long openid = Long.parseLong(open_id);
		PreparedStatement pstmt = null;
		DB db = new DB();
		Connection ct = db.getConn();
		for(int i = 0; i < length; i++){
			try{
				pstmt = ct.prepareStatement("DELETE FROM homework where open_id=? and title=?");
				pstmt.setLong(1, openid);
				pstmt.setString(2, title[i]);
				pstmt.executeUpdate();
			}catch(SQLException e){
				e.printStackTrace();
				return "error";
			}
		}
		
		return "success";
	}

}
