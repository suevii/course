package model;

public class UserTable  implements Comparable<UserTable>{
	private String id;
	private String username;
	private String password;
	private int level;//ѧ��level = 0����ʦlevel=1
	private String character;
	public String getId(){
		return this.id;
	}
	public void setId(String id){
		this.id = id;
	}
	public String getUsername(){
		return this.username;
	}
	public void setUsername(String username){
		this.username = username;
	}
	public String getPassword(){
		return this.password;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int compareTo(UserTable o) {
		String id=o.getId();
		return this.id.compareTo(id);
	}
	public String getCharacter() {
		return character;
	}
	public void setCharacter(String character) {
		this.character = character;
	}
	
}
