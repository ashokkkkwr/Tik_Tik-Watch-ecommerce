package util;

public class ProductStringUtils {
    public static final String INSERT_PRODUCT = "INSERT into products "
            + "(prod_name,prod_description,prod_category, prod_price, prod_availability)"
            + "VALUES(?,?,?,?,?)";
    public static final String GET_ALL_PRODUCTS = "SELECT * FROM products";
    public static final String GET_PRODUCT_NAME = "SELECT * FROM users WHERE prod_name=?";

    public static final String PRODUCT_NAME = "prod_name";
    public static final String PRODUCT_DESCRIPTION = "prod_description";
    public static final String PRODUCT_CATEGORY = "prod_category";
    public static final String PRODUCT_PRICE = "prod_price";
    public static final String PRODUCT_AVAILABILITY = "prod_availability";
}
