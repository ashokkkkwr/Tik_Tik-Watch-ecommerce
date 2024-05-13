package util;

import java.io.File;

public class ProductStringUtils {
    public static final String INSERT_PRODUCT = "INSERT into products "
            + "(prod_name,prod_description,prod_category, prod_price, prod_stock,prod_model, prod_size, prod_color,prod_dial_shape, prod_compatible_os,profile_Img)"
            + "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    public static final String GET_ALL_PRODUCTS = "SELECT * FROM products";
    public static final String GET_PRODUCT_NAME = "SELECT * FROM products WHERE prod_name=?";
    public static final String DELETE_PRODUCT_INFO_BY_ID="DELETE FROM products WHERE prod_id = ?";
    public static final String UPDATE_PRODUCT = "UPDATE products SET  prod_name=?,prod_description=?, prod_category=?, prod_price=?, prod_stock=?, prod_model=?, prod_size=?, prod_color=?, prod_dial_shape=?, prod_compatible_os=? WHERE prod_id=?";
    public static final String UPDATE_PRODUCT_WITH_IMAGE = "UPDATE products SET  prod_name=?,prod_description=?, prod_category=?, prod_price=?, prod_stock=?, prod_model=?, prod_size=?, prod_color=?, prod_dial_shape=?, prod_compatible_os=?, profile_Img=? WHERE prod_id=?";
    public static final String UPDATE_USER_WITH_IMAGE = "UPDATE users SET  userName=?,email=?, location=?, phone=?, profile_Img=? WHERE user_id=?";
    public static final String DELETE_CART_INFO_BY_ID="DELETE FROM carts WHERE cart_id = ?";


    public static final String PRODUCT_NAME = "prod_name";
    public static final String PRODUCT_DESCRIPTION = "prod_description";
    public static final String PRODUCT_CATEGORY = "prod_category";
    public static final String PRODUCT_PRICE = "prod_price";
    public static final String PRODUCT_STOCK = "prod_stock";
    public static final String PRODUCT_MODEL = "prod_model";
    public static final String PRODUCT_SIZE = "prod_size";
    public static final String PRODUCT_COLOR = "prod_color";
    public static final String PRODUCT_DIAL_SHAPE = "prod_dial_shape";
    public static final String PRODUCT_COMPATIBLE_OS = "prod_compatible_os";
    public static final String PRODUCT_INTERCHANGEABLE_STRAP = "prod_interchangeable_strap";







    
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
	public static final String ADD_PRODUCT = "/pages/addProduct.jsp";
	
	public static final String SIGNUP_SERVLET="/SignupServlet";
	public static final String LOGIN_SERVLET = "/LoginServlet";
	public static final String USERS_SERVLET = "/UsersServlet";
	public static final String PRODUCT_SERVLET = "/ProductServlet";
	public static final String PRODUCTS_SERVLET = "/ProductsServlet";
	public static final String USER_PRODUCT_SERVLET = "/UserProductServlet";


	public static final String IMG_DIR = "Users\\tiger\\eclipse-test\\Tik_Tik\\src\\main\\webapp\\images\\";
	public static final String IMG_DIR_SAVE_PATH = "C:"+File.separator+IMG_DIR;

}
