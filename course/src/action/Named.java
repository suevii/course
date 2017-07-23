package action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import db.DB;

public class Named extends ActionSupport{
	private String tnum;
	private long openId;
	private ArrayList<String> named=new ArrayList<String>();
	
	public String execute() throws Exception{
		System.out.println(named.size());
		
		HttpServletRequest request = ServletActionContext.getRequest();
		/*tnum = request.getParameter("tnum");
		openId =Long.parseLong( (String)request.getParameter("openId"));*/
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = dateFormat.format(calendar.getTime());
		
		DB db=new DB();
		db.addNamed(tnum, openId, date, named);
		
		return "success";
	}

	public String getTnum() {
		return tnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public long getOpenId() {
		return openId;
	}

	public void setOpenId(long openId) {
		this.openId = openId;
	}

	public ArrayList<String> getNamed() {
		return named;
	}

	public void setNamed(ArrayList<String> named) {
		this.named = named;
	}
	
}
	
