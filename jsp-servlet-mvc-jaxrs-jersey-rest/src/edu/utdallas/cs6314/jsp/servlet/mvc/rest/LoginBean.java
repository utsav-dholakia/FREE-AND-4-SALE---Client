package edu.utdallas.cs6314.jsp.servlet.mvc.rest;

public class LoginBean {

	private String name;
	private String password;
    /**
     * Default constructor. 
     */
    public LoginBean() {
    	name = "";
    	password = "";
    }
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
}
