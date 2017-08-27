package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;

import dao.impl.ISearchCourseDAO;
import factory.HibernateSessionFactory;

public class SearchCourseDAO implements ISearchCourseDAO {

	public ArrayList searchCourse(String cNum, String cName, int credit, 
			String tNum, String tName, String cTerm) {
		ArrayList al = new ArrayList();
		String sql = "select * from course C, open O, teacher T "
					+	"where (O.cNum = '" + cNum 
					+ "' or C.cName = '" + cName 
					+ "' or O.tNum = '" + tNum
					+ "' or T.tName = '" + tName 
					+ "' or C.credit = " + credit
					+ " or O.cTerm like '" + cTerm + "')"
					+ " and T.tNum=O.tNum and C.cNum=O.cNum";
		String hql = "SELECT * "
				+ "FROM Course c, Open o, Teacher T "
				+ "WHERE 1=1";
		//String hql = "SELECT * "
				//+ "FROM Select s, Teacher t, Course c, Open o "
				//+ "WHERE s.id.student.snum=? and o.openId=s.id.open.openId and o.teacher.tnum=t.tnum and o.course.cnum=c.cnum";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setParameter(0, sNum);
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
