package util;

import java.io.File;

public class StringUtils {
	
	//Queries
	public static final String SIGNUP ="INSERT INTO users "
			+"(userName,email,location,phone,password,profile_Img)"
			+"VALUES(?,?,?,?,?,?)";
	public static final String GET_LOGIN_INFO = "SELECT * FROM users WHERE email = ?";
	public static final String GET_USERNAME = "SELECT * FROM users WHERE userName=?";
	public static final String GET_PHONE = "SELECT * FROM users WHERE phone=?";
	public static final String GET_EMAIL = "SELECT * FROM users WHERE email=?";
	public static final String GET_ALL_USERS = "SELECT * FROM users";
	public static final String GET_IMAGE = "SELECT profile_Img FROM users";
	public static final String GET_ALL_CONTACT = "SELECT * FROM aboutus";

	
	//cart
	 public static final String CHECK_CART = "SELECT * FROM cart WHERE user_id = ? AND product_id = ?";
	    public static final String ADD_TO_CART = "INSERT INTO carts (quantity, prod_id, user_id) VALUES (?, ?, ?)";
	    public static final String GET_CART_ID = "SELECT * FROM carts WHERE cart_id=?";
	    public static final String UPDATE_CART = "UPDATE cart SET quantity = ? WHERE user_id = ? AND prod_id = ?";
	    public static final String REMOVE_FROM_CART = "DELETE FROM cart WHERE user_id = ? AND prod_id = ?";

	//order
	    public static final String ADD_TO_ORDER = "INSERT INTO orders (cart_id) VALUES (?)";

	
//storing in global variables
	public static final String IS_ADMIN = "is_admin";
	public static final String USERNAME = "userName";
	public static final String EMAIL = "email";
	public static final String LOCATION = "location";
	public static final String PHONE = "phone";
	public static final String PASSWORD = "password";
	public static final String RETYPE_PASSWORD = "retypePassword";
	public static final String PROFILE_IMAGE = "profile_Img";
	
	
	//cart golbal variables:
	public static final String CART_ID = "card_id";

	public static final String QUANTITY = "quantity";
	public static final String PROD_ID = "prod_id";
	public static final String USER_ID = "user_id";
	public static final String CART_DISPLAY = "SELECT c.*, p.prod_name, p.prod_price,p.profile_Img " +
            "FROM carts c " +
            "JOIN products p ON c.prod_id = p.prod_id " +
            "WHERE c.user_id = ?";
	public static final String ORDER_DISPLAY = "SELECT carts.*, products.*, orders.*\n"
	        + "FROM carts\n"
	        + "JOIN products ON carts.prod_id = products.prod_id\n"
	        + "JOIN orders ON carts.cart_id = orders.cart_id\n"
	        + "WHERE carts.user_id = ?;";

	public static final String ADMIN_ORDER_DISPLAY = "SELECT carts.*, products.*, orders.*, users.* "
	        + "FROM carts "
	        + "JOIN products ON carts.prod_id = products.prod_id "
	        + "JOIN orders ON carts.cart_id = orders.cart_id "
	        + "JOIN users ON carts.user_id = users.user_id";


//aboutus
	//Queries
	public static final String ABOUTUS ="INSERT INTO aboutus "
			+"(user_email,user_phone,message)"
			+"VALUES(?,?,?)";
	
	
	//signup page messages 
	public static final String SUCCESSFUL_SIGNUP_MESSAGE="Successful";
	public static final String SUCCESSFUL_CONTACT_MESSAGE="Successfully sent";
	public static final String ERROR_SIGNUP_MESSAGE = "Invalid Credentials";
	public static final String SERVER_ERROR_MESSAGE = "Sorry, there's been an unexpected server error.";
	public static final String USERNAME_ERROR_MESSAGE = "Username is Taken.";
	public static final String EMAIL_ERROR_MESSAGE = "Email is already Taken.";
	public static final String PHONE_NUMBER_ERROR_MESSAGE = "Number is already in use.";
	public static final String PASSWORD_UNMATCHED_ERROR_MESSAGE = "Passwords do not match. Please try again.";
	public static final String  SUCCESS_DELETE_MESSAGE= "Product Deleted Successfully";
	public static final String  ERROR_DELETE_MESSAGE= "Error while deleting product ";
	public static final String  ERROR_UPDATE_MESSAGE="Error while updating product ";
	//login page messages
	public static final String SUCCESS_LOGIN_MESSAGE = "Successfully LoggedIn!";
	public static final String ERROR_LOGIN_MESSAGE = "Invalid credentials!";
	//global messages
	public static final String SUCCESS_MESSAGE = "Successful message";
	public static final String SUCCESS_UPDATE_MESSAGE="product Added Successfully";
	public static final String ERROR_MESSAGE = "Error message";
	//jsp routes
	public static final String SIGNUP_PAGE = "/pages/signup.jsp";
	public static final String LOGIN_PAGE = "/pages/login.jsp";
	public static final String HOME_PAGE = "/pages/home.jsp";
	public static final String ADMIN_PAGE ="/pages/admin.jsp";
	//servlets Routes
	public static final String SIGNUP_SERVLET="/SignupServlet";
	public static final String CART_SERVLET="/CartServlet";
	public static final String ORDER_SERVLET="/OrderServlet";
	public static final String ADMIN_ORDER="/AdminOrder";
	public static final String SEARCH_SERVLET="/SearchServlet";
	public static final String CONTACTUS_SERVLET="/ContactUsServlet";

	

	public static final String LOGIN_SERVLET = "/LoginServlet";
	public static final String USERS_SERVLET = "/UsersServlet";
	public static final String GET_USERS="/GetUsers";
	public static final String PRODUCTS_SERVLET="/ProductsServlet";
	public static final String All_CONTACTS = "/AllContacts";

	public static final String IMG_DIR = "Users\\tiger\\eclipse-test\\Tik_Tik\\src\\main\\webapp\\images\\";
	public static final String IMG_DIR_SAVE_PATH = "C:"+File.separator+IMG_DIR;
}
