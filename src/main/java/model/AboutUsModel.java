package model;

public class AboutUsModel {
	
	private String userEmail;
	private String userPhone;
	private String message;
	
	
	public AboutUsModel(String userEmail, String userPhone, String message) {
		super();
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.message = message;
	}
	public AboutUsModel() {
		
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
