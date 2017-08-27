package dao.impl;

import java.util.ArrayList;

public interface ISearchCourseDAO {
	public ArrayList searchCourse(String cNum, String cName, int credit, 
						String tNum, String tName, String cTerm);
}
