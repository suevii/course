package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import model.vo.Open;

import org.hibernate.Query;

import dao.impl.ISearchCourseDAO;
import factory.HibernateSessionFactory;

public class SearchCourseDAO implements ISearchCourseDAO {

	public ArrayList searchCourse(String cNum, String cName, String credit, 
			String tNum, String tName, String cTerm) {
		ArrayList al = new ArrayList();
		String hql = "SELECT c.cnum, c.cname, c.credit, t.tnum, t.tname, o.ctime, o.cterm "
				+ "FROM Course c, Open o, Teacher t "
				+ "WHERE 1=1 AND t.tnum = o.teacher.tnum AND c.cnum = o.course.cnum ";
		if(cNum != null && cNum != "")
			hql += " AND c.cnum = '" + cNum + "'";
		if(cName != null && cName != "")
			hql += " AND c.cname = '" + cName + "'";
		if(tNum != null && tNum != "")
			hql += " AND t.tnum = '" + tNum + "'";
		if(tName != null && tName != "")
			hql += " AND t.tname = '" + tName + "'";
		if(cTerm != null && cTerm != "")
			hql += " AND o.cterm LIKE '%" + cTerm + "'";
		if(credit != null && credit != ""){
			int nCredit = Integer.parseInt(credit);
			hql += " AND c.credit = " + nCredit;
		}
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		List<Object[]> courses = query.list();
		Iterator it = courses.iterator();
		for(Object[] object : courses){
			HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("cNum", object[0]);
            map.put("cName", object[1]);
            map.put("credit", object[2]);
            map.put("tNum", object[3]);
            map.put("tName", object[4]);
            map.put("cTime", object[5]);
            Open open = new Open();
            open.setCterm(Integer.valueOf(String.valueOf(object[6])));
            map.put("cTerm", open.getRealTerm());
            al.add(map);
        }
		HibernateSessionFactory.closeSession();
		return al;
	}

}
