package restful;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.opensymphony.xwork2.ActionContext;

import db.DB;
import model.UserTable;

@RestController
@RequestMapping("/user")
public class User {
	
	@Autowired
	DB db=new DB();
	
	@RequestMapping(value="/login",method=RequestMethod.POST,consumes="application/json")
	public ResponseEntity<UserTable> login(@RequestBody UserTable user){
		String character = user.getCharacter();
		String usr = user.getUsername();
		String pwd = user.getPassword();
		boolean validated = false;
		DB usrdb = new DB();
//		ActionContext context = ActionContext.getContext();
//		Map session = context.getSession();
		UserTable user1 = null;//(UserTable)session.get("user");
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
						//session.put("user", user1);
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
			return new ResponseEntity<UserTable>(user1,HttpStatus.OK);
		}
		else{
			 //request.setAttribute("tipMessage", message);
			 return new ResponseEntity<UserTable>(user1,HttpStatus.NOT_FOUND);
//			return "error";
			
		}
	}
	
	
	
}
