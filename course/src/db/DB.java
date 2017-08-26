package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import factory.HibernateSessionFactory;
import model.Homework;
import model.MailTable;
import model.MyFile;
import model.NamedTime;
import model.OpenCourse;
import model.StudentCourse;
import model.UserTable;
import model.vo.Course;
import model.vo.Open;
import model.vo.Select;
import model.vo.SelectId;
import model.vo.Student;
import model.vo.Teacher;
public class DB {
	private String DBname = "course_manage";
	private String DBuser = "course";
	private String DBpwd = "123456";
	Connection ct = null;
	private Statement stmt;
	private Connection conn;
	private PreparedStatement pstmt;
	ResultSet rs;

	public DB() {
		stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/" + DBname + "?characterEncoding=UTF-8&useSSL=true", DBuser, DBpwd);
			ct=conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/" + DBname + "?characterEncoding=UTF-8&useSSL=true", DBuser, DBpwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		rs = null;
	}

	// 获取数据连接
	public Connection getConn() {
		return this.conn;
	}

	public ResultSet executeQuery(String sql) {
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			System.err.println("Data.executeQuery:" + e.getMessage());
		}
		return rs;
	}

	public void executeUpdate(String sql) {
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.err.println("Data.executeQuery:" + e.getMessage());
		}
	}

	public void closeStmt() {
		try {
			stmt.close();
		} catch (SQLException e) {
			System.err.println("Data.executeQuery:" + e.getMessage());
		}
	}

	public void closeConn() {
		try {
			conn.close();
		} catch (SQLException e) {
			System.err.println("Data.executeQuery:" + e.getMessage());
		}
	}

	public ArrayList getTeacherCourse(String tnum) {// 获取老师的课程
		try {
			ArrayList al = new ArrayList();
//			Teacher teacher = new Teacher();
//			teacher.setTnum(tnum);
			pstmt = conn.prepareStatement(
					"select * from open,course where tNum=? and open.cNum=course.cNum ORDER BY cTerm DESC");
			pstmt.setString(1, tnum);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				OpenCourse course = new OpenCourse();
				course.setOpen_id(rs.getLong("open_id"));
				course.setCnum(rs.getString("cNum"));
				course.setCname(rs.getString("cName"));
				course.setTnum(rs.getString("tNum"));
				course.setTerm(rs.getInt("cTerm"));
				al.add(course);
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList getStudentCourse(String snum) {// 获取学生的课程
		try {
			ArrayList al = new ArrayList();
			Student student = new Student();
			student.setSnum(snum);
			pstmt = conn.prepareStatement(
					"SELECT s.open_id, s.sNum, c.cNum, t.tNum, c.cName, t.tName, o.cTerm "
					+ "FROM `select` s,teacher t, course c, open o "
					+ "WHERE s.sNum=? and o.open_id=s.open_id and o.tNum=t.tNum and o.cNum=c.cNum;");
			pstmt.setString(1, snum);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				Course course = new Course();
				course.setCnum(rs.getString("cNum"));
				course.setCname(rs.getString("cName"));
				Teacher teacher = new Teacher();
				teacher.setTnum(rs.getString("tNum"));
				teacher.setTname(rs.getString("tName"));
				Open open = new Open();
				open.setCterm(rs.getInt("cTerm"));
				open.setOpenId(rs.getLong("open_id"));
				Select select = new Select();
				SelectId selectId = new SelectId(open, student);
				select.setId(selectId);
				map.put("course", course);
				map.put("teacher", teacher);
				map.put("open", open);
				map.put("select", select);
				al.add(map);
				
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public HashMap<String, NamedTime> getNamedRecord(String tnum, long open_id) {
		try {
			pstmt = conn.prepareStatement("select * from named_time where tnum=? and open_id=?");
			pstmt.setString(1, tnum);
			pstmt.setLong(2, open_id);
			ResultSet rs = pstmt.executeQuery();
			HashMap<String, NamedTime> al = new HashMap<String, NamedTime>();
			while (rs.next()) {
				NamedTime time = new NamedTime();
				time.setDate(rs.getString("date").substring(0, 19));
				time.setOpen_id(open_id);
				time.setTnum(tnum);
				al.put(rs.getString("date").substring(0, 19), time);
			}

			pstmt = conn.prepareStatement(
					"select * from named_time,named_record where named_time.named_id=named_record.named_id and tnum=? and open_id=?");
			pstmt.setString(1, tnum);
			pstmt.setLong(2, open_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String record;
				record = rs.getString("snum");
				al.get(rs.getString("date").substring(0, 19)).getRecord().add(record);
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<UserTable> getStudentList(long open_id) {
		try {

			pstmt = conn
					.prepareStatement("select * from `select` s,student where s.snum=student.snum and s.open_id=? ");
			pstmt.setLong(1, open_id);

			List<UserTable> al = new ArrayList<UserTable>();

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				UserTable user = new UserTable();
				user.setId(rs.getString("s.snum"));
				user.setUsername(rs.getString("student.sname"));
				al.add(user);
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void addNamed(String tnum, long openId, String date, List<String> named) {
		try {
			pstmt = conn.prepareStatement("insert into named_time(tnum,open_id,date) values(?,?,?) ");
			pstmt.setString(1, tnum);
			pstmt.setLong(2, openId);
			pstmt.setString(3, date);
			int rs = pstmt.executeUpdate();

			pstmt = conn.prepareStatement("select named_id from named_time where tnum=? and open_id=? and date=? ");
			pstmt.setString(1, tnum);
			pstmt.setLong(2, openId);
			pstmt.setString(3, date);
			ResultSet rt = pstmt.executeQuery();
			rt.next();
			long namedId = rt.getLong(1);

			Iterator<String> it = named.iterator();
			while (it.hasNext()) {
				String snum = it.next();
				if (!(snum.equals("") || snum == null)) {
					pstmt = conn.prepareStatement("insert into named_record(named_id,snum) values(?,?)");
					pstmt.setLong(1, namedId);
					pstmt.setString(2, snum);
					rs = pstmt.executeUpdate();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList getStudentHomework(long openid) {// 获取学生的作业通知
		try {

			pstmt = conn.prepareStatement("SELECT * from homework WHERE open_id=? ORDER BY out_time DESC;");
			pstmt.setLong(1, openid);

			ArrayList al = new ArrayList();

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Homework task = new Homework();
				task.setOpen_id(rs.getLong("open_id"));
				task.setTitle(rs.getString("title"));
				task.setContent(rs.getString("content"));
				task.setOut_time(new Date(rs.getTimestamp("out_time").getTime()));
				task.setDeadline(new Date(rs.getTimestamp("deadline").getTime()));
				al.add(task);
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList getAllHomework(String snum,String date) {// 获取所有作业通知
		try {

			pstmt = conn.prepareStatement("SELECT * from homework h WHERE h.open_id IN(select s.open_id from `select` s where s.snum=?  )  and unix_timestamp(h.deadline)>unix_timestamp(?) ORDER BY h.out_time DESC;");
			pstmt.setString(1, snum);
			pstmt.setString(2, date);
			ArrayList al = new ArrayList();

			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Homework task = new Homework();
				task.setOpen_id(rs.getLong("open_id"));
				task.setTitle(rs.getString("title"));
				task.setContent(rs.getString("content"));
				task.setOut_time(new Date(rs.getTimestamp("out_time").getTime()));
				task.setDeadline(new Date(rs.getTimestamp("deadline").getTime()));
				al.add(task);
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String getCourseName(String cnum) {
		String cname = null;
		try {

			pstmt = conn.prepareStatement("SELECT cname from course WHERE cnum=?;");
			pstmt.setString(1, cnum);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				cname = rs.getString("cname");
			}
			return cname;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public MyFile findFile(String name, String owner_num) {
		try {
			pstmt = ct.prepareStatement("select * from file where name = ? and owner_num = ?;");
			pstmt.setString(1, name);
			pstmt.setString(2, owner_num);
			ResultSet rs = pstmt.executeQuery();
			MyFile file = new MyFile();
			while (rs.next()) {
				file.setFile_id(rs.getInt(1));
				file.setName(rs.getString(2));
				file.setPath(rs.getString(3));
				file.setDateTime(rs.getString(5));
				return file;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/*
	 * findFile for student
	 */
	public MyFile findFile(int file_id) {
		try {
			pstmt = ct.prepareStatement("select * from file where file_id = ?;");
			pstmt.setInt(1, file_id);
			ResultSet rs = pstmt.executeQuery();
			MyFile file = new MyFile();
			while (rs.next()) {
				file.setFile_id(rs.getInt(1));
				file.setName(rs.getString(2));
				file.setPath(rs.getString(3));
				file.setDateTime(rs.getString(5));
				return file;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/*
	 * add file to [file] and [course_file] (for teacher)
	 */
	public boolean addFile(String name, String path, String owner_num, String file_date, int open_id) {
		try {
			String sql = "insert into file(name, path, owner_num, file_date) values (?,?,?,?);";
			pstmt = ct.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, name);
			pstmt.setString(2, path);
			pstmt.setString(3, owner_num);
			pstmt.setString(4, file_date);
			pstmt.executeUpdate();
			// 6：执行完上面的更新数据操作后，获取自增长列
			ResultSet rsTemp = pstmt.getGeneratedKeys();
			// 7：输出该数据对应的自增长列的值
			int file_id = 0;
			if (rsTemp.next()) {
				file_id = rsTemp.getInt(1);
			}
			pstmt = ct.prepareStatement("insert into course_file(file_id, open_id) values (?,?);");
			pstmt.setInt(1, file_id);
			pstmt.setInt(2, open_id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/*
	 * delete file from [file]
	 */
	public boolean deleteFile(String name, String owner_num) {
		try {
			MyFile mFile = this.findFile(name, owner_num);
			int file_id = mFile.getFile_id();
			String sql = "delete from file where name = ? and owner_num = ?;";
			pstmt = ct.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, owner_num);
			pstmt.executeUpdate();
			sql = "delete from course_file where file_id = ?;";
			pstmt = ct.prepareStatement(sql);
			pstmt.setInt(1, file_id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public ArrayList findMailInfo1(Object user){   //获取发信箱内容
		try{				
			DB db = new DB();
			ActionContext context = ActionContext.getContext();
			Map session = context.getSession();
			String character = (String)session.get("character");
			pstmt = conn.prepareStatement("select * from mail where num_to=?");
			String id = null;
			if(character.equals("student")){
				user = (Student)user;
				id = ((Student)user).getSnum();
			}else if(character.equals("teacher")){
				user = (Teacher)user;
				id = ((Teacher)user).getTnum();
			}
			pstmt = conn.prepareStatement("select * from mail where num_from=?");
			pstmt.setString(1, id);
			ArrayList al=new ArrayList();
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				MailTable mail=new MailTable();
				mail.setMail_Id(rs.getInt(1));
				mail.setNum_from(db.getName(rs.getString(2)));
				mail.setNum_to(db.getName(rs.getString(3)));
		
				mail.setTitle(rs.getString(5));
				mail.setContent(rs.getString(6));
				mail.setTime(rs.getDate(7));
				al.add(mail);
			}
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList findMailInfo2(Object user){   //获取收信箱内容
		try{		
			DB db = new DB();
			ActionContext context = ActionContext.getContext();
			Map session = context.getSession();
			String character = (String)session.get("character");
			String id = null;
			if(character.equals("student")){
				user = (Student)user;
				id = ((Student)user).getSnum();
			}else if(character.equals("teacher")){
				user = (Teacher)user;
				id = ((Teacher)user).getTnum();
			}
			pstmt = conn.prepareStatement("select * from mail where num_to=?");
			pstmt.setString(1,id);
			ArrayList al=new ArrayList();
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				MailTable mail = new MailTable();
				mail.setMail_Id(rs.getInt(1));
				mail.setNum_from(db.getName(rs.getString(2)));
				mail.setNum_to(db.getName(rs.getString(3)));
				mail.setTitle(rs.getString(5));
				mail.setContent(rs.getString(6));
				mail.setTime(rs.getDate(7));
				al.add(mail);
			}
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean addInfo(MailTable mail){  //写邮件，将邮件信息添加到数据库
		try{
			System.out.println(mail.getContent());
			pstmt=conn.prepareStatement("insert into mail (mail_id, num_from, num_to, title, content, time) values(?,?,?,?,?,?)");
			pstmt.setInt(1, mail.getMail_Id());
			pstmt.setString(2, mail.getNum_from());
			pstmt.setString(3, mail.getNum_to());

			pstmt.setString(4, mail.getTitle());
			pstmt.setString(5, mail.getContent());
			pstmt.setDate(6, mail.getTime());
			pstmt.executeUpdate();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
		
	
	public boolean deleteMailInfo(int id){  //删除邮件
		try{
			pstmt=conn.prepareStatement("delete from mail where mail_id = ?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public ArrayList findMailInfo3(int id){   //获取邮箱内容
		try{			
			DB db=new DB();
			pstmt=conn.prepareStatement("select * from mail where mail_id=?");
			pstmt.setInt(1,id);
			ArrayList al=new ArrayList();
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				MailTable mail=new MailTable();
				mail.setMail_Id(rs.getInt(1));
				mail.setNum_from(db.getName(rs.getString(2)));
				mail.setNum_to(db.getName(rs.getString(3)));
				
				mail.setTitle(rs.getString(5));
				mail.setContent(rs.getString(6));
				mail.setTime(rs.getDate(7));
				al.add(mail);
			}
			return al;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public String getName(String num){   //获取邮箱内容
		try{								
			pstmt=conn.prepareStatement("select sname from student where snum=?");
			pstmt.setString(1,num);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
			else{
				pstmt=conn.prepareStatement("select tname from teacher where tnum=?");
				pstmt.setString(1,num);
				rs=pstmt.executeQuery();
				if(rs.next()){
					return rs.getString(1);
				}
			}
			return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public List<UserTable> getMailTo(){
		try {
			 List<UserTable> list =new ArrayList<UserTable>(); 
			pstmt = ct.prepareStatement("select * from teacher t");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				UserTable user=new UserTable();
				user.setId(rs.getString("t.tnum"));
				user.setUsername(rs.getString("t.tname"));
				list.add(user);
			}
			pstmt = ct.prepareStatement("select * from student s");
			rs=pstmt.executeQuery();
			while(rs.next()){
				UserTable user=new UserTable();
				user.setId(rs.getString("s.snum"));
				user.setUsername(rs.getString("s.sname"));
				list.add(user);
			}
			
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
