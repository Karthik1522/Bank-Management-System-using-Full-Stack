package Servlets;

public class User {
	String name;
	String email;
	String code;
	
	public User(String n,String e,String c) {
		name = n;
		email = e;
		code = c;
	}
	
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getCode() {
		return this.code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
}
