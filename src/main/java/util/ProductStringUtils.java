package util;

public class ProductStringUtils {
    public static final String INSERT_PRODUCT = "INSERT into products "
            + "(prod_name,prod_description,prod_category, prod_price, prod_availability)"
            + "VALUES(?,?,?,?,?)";
    public static final String GET_ALL_PRODUCTS = "SELECT * FROM products";
    public static final String GET_PRODUCT_NAME = "SELECT * FROM products WHERE prod_name=?";

    public static final String PRODUCT_NAME = "prod_name";
    public static final String PRODUCT_DESCRIPTION = "prod_description";
    public static final String PRODUCT_CATEGORY = "prod_category";
    public static final String PRODUCT_PRICE = "prod_price";
    public static final String PRODUCT_AVAILABILITY = "prod_availability";



	public static final String SUCCESSFUL_PRODUCT_ADDED_MESSAGE="Successful product added.";
	public static final String SUCCESS_MESSAGE = "Successful message";
	public static final String ERROR_MESSAGE = "Error message";
	public static final String ERROR_PRODUCT_MESSAGE_MESSAGE = "Product not Added";
	public static final String SERVER_ERROR_MESSAGE = "Sorry, there's been an unexpected server error.";
	public static final String PRODUCT_ERROR_MESSAGE = "Product already added";

	
	
	//jsp routes
	public static final String SIGNUP_PAGE = "/pages/signup.jsp";
	public static final String LOGIN_PAGE = "/pages/login.jsp";
	public static final String HOME_PAGE = "/pages/home.jsp";
	
	public static final String SIGNUP_SERVLET="/SignupServlet";
	public static final String LOGIN_SERVLET = "/LoginServlet";
	public static final String USERS_SERVLET = "/UsersServlet";
	public static final String PRODUCT_SERVLET = "/ProductServlet";

}
