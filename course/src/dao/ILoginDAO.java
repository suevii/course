package dao;

import model.UserTable;

public interface ILoginDAO {
	public Object validateUser(String username, String password, String character);
}
