package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import model.vo.Course;
import model.vo.Open;
import model.vo.Select;
import model.vo.SelectId;
import model.vo.Student;
import model.vo.Teacher;

import org.hibernate.Query;

import factory.HibernateSessionFactory;

public class StudentCourseDAO implements IStudentCourseDAO {

	public ArrayList getStudentCourse(String snum) {
		ArrayList al = new ArrayList();
		String hql = "SELECT o.openId, c.cnum, t.tnum, c.cname, t.tname, o.cterm "
				+ "FROM Select s, Teacher t, Course c, Open o "
				+ "WHERE s.id.student.snum=? and o.openId=s.id.open.openId and o.teacher.tnum=t.tnum and o.course.cnum=c.cnum";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setParameter(0, snum);
		List<Object[]> courses = query.list();
		Iterator it = courses.iterator();
		for(Object[] object : courses){
			HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("open_id", object[0]);
            map.put("cNum", object[1]);
            map.put("tNum", object[2]);
            map.put("cName", object[3]);
            map.put("tName", object[4]);
            map.put("cTerm", object[5]);
            al.add(map);
        }
		HibernateSessionFactory.closeSession();
		return al;
	}

}
