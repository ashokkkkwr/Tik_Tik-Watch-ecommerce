package util;

public class StringUtils {
	
	//Queries
	public static final String SIGNUP ="INSERT INTO users "
			+"(userName,email,location,phone,password)"
			+"VALUES(?,?,?,?,?)";
	public static final String GET_LOGIN_INFO = "SELECT * FROM users WHERE username = ?";
	public static final String GET_USERNAME = "SELECT * FROM users WHERE userName=?";
	public static final String GET_PHONE = "SELECT * FROM users WHERE phone=?";
	public static final String GET_EMAIL = "SELECT * FROM users WHERE EMAIL=?";
	public static final String GET_ALL_USERS = "SELECT * FROM users";
//storing in global variables
	public static final String USERNAME = "userName";
	public static final String EMAIL = "email";
	public static final String LOCATION = "location";
	public static final String PHONE = "phone";
	public static final String PASSWORD = "password";
	public static final String RETYPE_PASSWORD = "retypePassword";
	//signup page messages 
	public static final String SUCCESSFUL_SIGNUP_MESSAGE="Successful";
	public static final String ERROR_SIGNUP_MESSAGE = "Invalid Credentials";
	public static final String SERVER_ERROR_MESSAGE = "Sorry, there's been an unexpected server error.";
	public static final String USERNAME_ERROR_MESSAGE = "Username is Taken.";
	public static final String EMAIL_ERROR_MESSAGE = "Email is already Taken.";
	public static final String PHONE_NUMBER_ERROR_MESSAGE = "Number is already in use.";
	public static final String PASSWORD_UNMATCHED_ERROR_MESSAGE = "Passwords do not match. Please try again.";
	//login page messages
	public static final String SUCCESS_LOGIN_MESSAGE = "Successfully LoggedIn!";
	public static final String ERROR_LOGIN_MESSAGE = "Invalid credentials!";
	//global messages
	public static final String SUCCESS_MESSAGE = "Successful message";
	public static final String ERROR_MESSAGE = "Error message";
	//jsp routes
	public static final String SIGNUP_PAGE = "/pages/signup.jsp";
	public static final String LOGIN_PAGE = "pages/login.jsp";
	public static final String HOME_PAGE = "/pages/home.jsp";
	//servlets Routes
	public static final String SIGNUP_SERVLET="/SignupServlet";
	public static final String LOGIN_SERVLET = "/LoginServlet";
	public static final String USERS_SERVLET = "/UsersServlet";
	
}
