package test;

import db.DB;

public class Test {

	@org.junit.Test
	public void testAttendence(){
		DB db=new DB();
		System.out.println(db.getCourseAttendence(5));
		System.out.println(db.getStudentAttendence(5,"14120926"));

	}
}
