package action;

import java.io.File;
import java.util.Map;

import model.MyFile;
import model.UserTable;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import db.DB;

public class DeleteAction extends ActionSupport {
	private MyFile file;
	public String execute() throws Exception{
		ActionContext context = ActionContext.getContext();
		Map session = context.getSession();
		UserTable user = (UserTable)session.get("user");
		String userId = user.getId();
		String file_name = file.getName();
		String path = file.getPath();
		DB db = new DB();
		MyFile deleteFile = db.findFile(file_name, userId);
		new File(deleteFile.getPath()).delete();	//delete in folder
		db.deleteFile(file_name, userId);			//delete in database
		return "success";
	}
	public MyFile getFile() {
		return file;
	}
	public void setFile(MyFile file) {
		this.file = file;
	}
}
