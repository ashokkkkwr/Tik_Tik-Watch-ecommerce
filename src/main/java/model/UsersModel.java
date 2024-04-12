package model;

public class UsersModel {
	private String userName;
	private String email;
	private String location;
	private String phone;
	private String password;
	
	
	
	public UsersModel(String userName, String email, String location, String phone, String password) {
		super();
		this.userName = userName;
		this.email = email;
		this.location = location;
		this.phone = phone;
		this.password = password;
	}
	public UsersModel() {
		
	}


	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}


}