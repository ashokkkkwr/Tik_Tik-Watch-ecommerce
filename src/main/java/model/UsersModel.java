package model;

import java.io.File;

import javax.servlet.http.Part;

public class UsersModel {
	private int userId;
	private String userName;
	private String email;
	private String location;
	private String phone;
	private String password;
	private String isAdmin;
	private String imageUrlFromPart;

	
	public UsersModel(String userName, String email, String location, String phone, String password, String isAdmin,Part imagePart) {
		super();
		this.userName = userName;
		this.email = email;
		this.location = location;
		this.phone = phone;
		this.password = password;
		this.isAdmin = isAdmin;
		this.imageUrlFromPart=getImageUrl(imagePart);
	}
	
	public UsersModel() {
		
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getImageUrl(Part image) {
		String savePath = "/home/arch/eclipse-test/ecommerce/src/main/webapp/images";
		File files = new File(savePath);
		String getImgPart = null;
		if(!files.exists()) {
		files.mkdir();} 
		String contDisp = image.getHeader("content-disposition");
		String item[] = contDisp.split(";");
		for(String i : item) {
			if(i.trim().startsWith("filename")) {
			getImgPart = i.substring(i.indexOf("=")+2,i.length()-1);
			}
		}
		if(getImgPart==null || getImgPart.isEmpty()) {
			getImgPart="default.png";
		}
		return getImgPart;
	}

	public String getImageUrlFromPart() {
		return imageUrlFromPart;
	}

	public void setImageFromPart(Part image) {
		this.imageUrlFromPart = getImageUrl(image);
	}
	 public void setImageUrlFromString(String imageUrl) {
	        this.imageUrlFromPart = imageUrl;
	    }
	
	
	
}