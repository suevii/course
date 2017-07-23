package action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import model.MyFile;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import db.DB;

public class DownloadAction extends ActionSupport {
	private int file_id;
	private String fileName;  

	public InputStream getInputStream() throws IOException
    {
		DB db = new DB();
		/*this.fileName = new String(this.fileName.getBytes("GBK"),"ISO-8859-1"); */
		MyFile file = db.findFile(file_id);
		String path = file.getPath();
		File newFile = new File(path);
		return FileUtils.openInputStream(newFile);
//		return ServletActionContext.getServletContext().getResourceAsStream(path);  
    }  
	      
    public String execute() throws Exception {  
        return SUCCESS;  
    }  
    public int getFile_id() {
		return file_id;
	}

	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
