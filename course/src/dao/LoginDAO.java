package dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;

import dao.impl.ILoginDAO;
import factory.HibernateSessionFactory;
import model.UserTable;
import model.vo.*;

public class LoginDAO implements ILoginDAO {

	public Object validateUser(String username, String password, String character) {
		Object user = null;
		String hql = null;
		int flag = 1;
		if(character.equals("student")){
			hql = "from Student s where s.snum=? and s.pwd=?";
			flag = 1;
		}else if(character.equals("teacher")){
			hql = "from Teacher t where t.tnum=? and t.pwd=?";
			flag = 0;
		}
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setParameter(0, username);
		query.setParameter(1, password);
		List users = query.list();
		Iterator it = users.iterator();
		while(it.hasNext()){
			if(users.size() != 0){
				if(flag == 1)
					user = (Student)it.next();
				else if(flag == 0)
					user = (Teacher)it.next();
				return user;
			}
		}
		HibernateSessionFactory.closeSession();
		return null;
	}

}
