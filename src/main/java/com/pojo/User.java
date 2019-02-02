package com.pojo;

public class User {

	private String emailid;
	private String username;
	private String password;
	
	public User(String emailid, String username, String password) {
		super();
		this.emailid = emailid;
		this.username = username;
		this.password = password;
	}
	public User() {
		this.emailid = "admin@gmail.com";
		this.username ="admin";
		this.password="admin";
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
