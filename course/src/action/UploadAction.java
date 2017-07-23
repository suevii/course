package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import db.DB;
import model.UserTable;

public class UploadAction extends ActionSupport {
	private File upload;
	private String uploadFileName;
	
	public String execute() throws Exception{
		ActionContext context = ActionContext.getContext();
		Map session = context.getSession();
		UserTable user = (UserTable)session.get("user");		//teacher
		String userId = user.getId();
		String openId = (String)session.get("openid");	//cnum
		int open_id = Integer.parseInt(openId);
		
		//get date
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = dateFormat.format(calendar.getTime());
		
		InputStream is = new FileInputStream(getUpload());
		String userPath = "D:\\file\\" + userId;	//用户文件夹路径
		String path = userPath + "\\" + uploadFileName;
		File userFile = new File(userPath);
		if(!userFile.exists()){
			userFile.mkdirs();
		}
		OutputStream os = new FileOutputStream(path);
		byte buffer[] = new byte[1024];
		int count = 0;
		while((count = is.read(buffer)) > 0){
			os.write(buffer, 0, count);
		}
		DB db = new DB();
		db.addFile(uploadFileName, path, userId, dateStr, open_id);
		os.close();
		is.close();
		
		return SUCCESS;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
}
