package dao.impl;

import java.util.ArrayList;

public interface ISearchCourseDAO {
	public ArrayList searchCourse(String cNum, String cName, String credit, 
						String tNum, String tName, String cTerm);
}
