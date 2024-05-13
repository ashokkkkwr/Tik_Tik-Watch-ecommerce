package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ProductStringUtils;
import util.StringUtils;
import model.AboutUsModel;
import model.CartModel;
import model.OrderModel;
import model.PasswordEncryptionWithAes;
import model.ProductsModel;
import model.UsersModel;

public class DatabaseController {

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/tik_tik";
        String user = "root";
        String pass = "";
        return DriverManager.getConnection(url, user, pass);
    }

    public int addUser(UsersModel userModel) {
        try (Connection con = getConnection()) {
            PreparedStatement checkUsernameUser = con.prepareStatement(StringUtils.GET_USERNAME);
            checkUsernameUser.setString(1, userModel.getUserName());
            ResultSet checkUsernameRs = checkUsernameUser.executeQuery();

            if (checkUsernameRs.next() && checkUsernameRs.getInt(1) > 0) {
                return -2; // Username exists
            }

            PreparedStatement checkPhoneUser = con.prepareStatement(StringUtils.GET_PHONE);
            checkPhoneUser.setString(1, userModel.getPhone());
            ResultSet checkPhoneRs = checkPhoneUser.executeQuery();

            if (checkPhoneRs.next() && checkPhoneRs.getInt(1) > 0) {
                return -4; // Phone Number exists
            }

            PreparedStatement checkEmailUser = con.prepareStatement(StringUtils.GET_EMAIL);
            checkEmailUser.setString(1, userModel.getEmail());
            ResultSet checkEmailRs = checkEmailUser.executeQuery();

            if (checkEmailRs.next() && checkEmailRs.getInt(1) > 0) {
                return -3; // Email exists
            }

            // Encrypt password before storing it in the database
            String encryptedPassword = PasswordEncryptionWithAes.encryptPassword(userModel.getPassword(),
                    "U3CdwubLD5yQbUOG92ZnHw==");

            PreparedStatement st = con.prepareStatement(StringUtils.SIGNUP);
            st.setString(1, userModel.getUserName());
            st.setString(2, userModel.getEmail());
            st.setString(3, userModel.getLocation());
            st.setString(4, userModel.getPhone());
            st.setString(5, encryptedPassword);
            st.setString(6, userModel.getImageUrlFromPart());
            int result = st.executeUpdate();
            return result > 0 ? 1 : 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        } catch (Exception ex) {
            ex.printStackTrace();
            return -1;
        }
    }
//add contactUs
    public int addContactUs(AboutUsModel aboutUsModel) {
        try (Connection con = getConnection()) {
           
            PreparedStatement st = con.prepareStatement(StringUtils.ABOUTUS);
            st.setString(1, aboutUsModel.getUserEmail());
            st.setString(2, aboutUsModel.getUserPhone());
            st.setString(3, aboutUsModel.getMessage());

            int result = st.executeUpdate();
            return result > 0 ? 1 : 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        } catch (Exception ex) {
            ex.printStackTrace();
            return -1;
        }
    }

    public int getLogin(String email, String password, String isAdmin) {
        try (Connection con = getConnection()) {
            PreparedStatement user = con.prepareStatement(StringUtils.GET_LOGIN_INFO);
            user.setString(1, email);
            ResultSet rs = user.executeQuery();
            if (rs.next()) {
                String userDb = rs.getString("email");
                String encryptedPassword = rs.getString("password");
                String admin = rs.getString("is_Admin");
                // System.out.println("email from DB: " + userDb);
                // System.out.println("Encrypted Password from DB: " + encryptedPassword);
                // System.out.println("is admin is"+admin);
                // Decrypt password from database and compare
                String decryptedPassword = PasswordEncryptionWithAes.decryptPassword(encryptedPassword,
                        "U3CdwubLD5yQbUOG92ZnHw==");
                System.out.println("Decrypted Password: " + decryptedPassword);

                if (decryptedPassword != null && userDb.equals(email) && decryptedPassword.equals(password)) {
                    if (admin != null) {
                        return 2;// login as admin successfull.
                    } else {
                        return 1;
                    } // Login successful
                } else {
                    return 0; // Password mismatch
                }
            } else {
                // No matching record found
                return 0;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int addProduct(ProductsModel productModel) {
        try (Connection con = getConnection();
                PreparedStatement product = con.prepareStatement(ProductStringUtils.INSERT_PRODUCT);
                PreparedStatement checkProduct = con.prepareStatement(ProductStringUtils.GET_PRODUCT_NAME)) {

            // Check if the product already exists
            checkProduct.setString(1, productModel.getProductName());
            try (ResultSet checkProductRs = checkProduct.executeQuery()) {
                if (checkProductRs.next()) {
                    return -2; // Product already exists
                }
            }

            // Insert the new product
            product.setString(1, productModel.getProductName());
            product.setString(2, productModel.getProductDescription());
            product.setString(3, productModel.getProductCategory());
            product.setInt(4, productModel.getProductPrice());
            product.setInt(5, productModel.getProductStock());
            product.setString(6, productModel.getProductModels());
            product.setString(7, productModel.getProductSize());
            product.setString(8, productModel.getProductColor());
            product.setString(9, productModel.getProductDialShape());
            product.setString(10, productModel.getProductCompatibleOs());
            product.setString(11, productModel.getImageUrlFromPart());

            // Execute the insert statement
            int result = product.executeUpdate();

            // Check if the insertion was successful
            return result > 0 ? 1 : 0;

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1; // Error occurred
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public UsersModel getUserDetails(String email) throws ClassNotFoundException {
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(StringUtils.GET_LOGIN_INFO)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    // Fetch student details from the result set and create a Student object
                    UsersModel user = new UsersModel();
                    user.setUserName(resultSet.getString("userName"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPhone(resultSet.getString("phone"));
                    user.setLocation(resultSet.getString("location"));

                    // Populate other fields as needed
                    return user;
                } else {
                    // No student found with the given email
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
            return null;
        }
    }// get users

    public List<UsersModel> getAllUsers1(String email) {
        List<UsersModel> users = new ArrayList<>();
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement("SELECT * FROM users WHERE email=?");
            st.setString(1, email);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UsersModel user = new UsersModel();
                user.setUserId(rs.getInt("user_id"));
                user.setUserName(rs.getString("userName"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setLocation(rs.getString("location"));
                user.setImageUrlFromString(rs.getString("profile_Img"));
                // Populate other fields as needed
                users.add(user);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return users;
    }
    //get user_id
    public UsersModel getUserId(String email) throws ClassNotFoundException {
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement("SELECT user_id FROM users WHERE email=?")) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    // Fetch student details from the result set and create a Student object
                    UsersModel user = new UsersModel();
                    user.setUserId(resultSet.getInt("user_id"));
        

                    // Populate other fields as needed
                    return user;
                } else {
                    // No student found with the given email
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
            return null;
        }
    }
    // list all users
    public List<UsersModel> getAllUsers() {
        List<UsersModel> users = new ArrayList<>();
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_ALL_USERS);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UsersModel user = new UsersModel();
                user.setEmail(rs.getString("email"));
                user.setLocation(rs.getString("location"));
                user.setImageUrlFromString(rs.getString("profile_Img"));
                // Populate other fields as needed
                users.add(user);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return users;
    }
    // list all Contacts
    public List<AboutUsModel> getAllContacts() {
        List<AboutUsModel> contacts = new ArrayList<>();
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_ALL_CONTACT);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
            	AboutUsModel contact = new AboutUsModel();
            	contact.setUserEmail(rs.getString("user_email"));
            	contact.setUserPhone(rs.getString("user_phone"));
            	contact.setMessage(rs.getString("message"));
                // Populate other fields as needed
            	contacts.add(contact);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return contacts;
    }

    // list all products:
    public List<ProductsModel> getAllProducts() {
        List<ProductsModel> products = new ArrayList<>();
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(ProductStringUtils.GET_ALL_PRODUCTS);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductsModel product = new ProductsModel();
                product.setProdId(rs.getInt("prod_Id"));
                product.setProductName(rs.getString("prod_Name"));
                product.setProductDescription(rs.getString("prod_Description"));
                product.setProductCategory(rs.getString("prod_Category"));
                product.setProductPrice(rs.getInt("prod_price"));

                product.setProductStock(rs.getInt("prod_Stock"));
                product.setProductModels(rs.getString("prod_model"));
                product.setProductSize(rs.getString("prod_size"));
                product.setProductColor(rs.getString("prod_color"));
                product.setProductDialShape(rs.getString("prod_dial_shape"));
                product.setProductCompatibleOs(rs.getString("prod_compatible_os"));
                product.setImageUrlFromString(rs.getString("profile_Img"));

                // Populate other fields as needed
                products.add(product);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return products;
    }
 /// delete product:
    public int deleteProduct(int id) {
        try (Connection con = getConnection()) {
            // Delete related rows from the orders table first
            PreparedStatement deleteFromOrders = con.prepareStatement("DELETE FROM orders WHERE cart_id IN (SELECT cart_id FROM carts WHERE prod_id = ?)");
            deleteFromOrders.setInt(1, id);
            deleteFromOrders.executeUpdate();
            
            // Now delete related rows from the carts table
            PreparedStatement deleteFromCarts = con.prepareStatement("DELETE FROM carts WHERE prod_id = ?");
            deleteFromCarts.setInt(1, id);
            deleteFromCarts.executeUpdate();
            
            // Now delete the product
            PreparedStatement deleteProductStmt = con.prepareStatement("DELETE FROM products WHERE prod_id = ?");
            deleteProductStmt.setInt(1, id);
            int result = deleteProductStmt.executeUpdate();
            
            return result > 0 ? 1 : 0; // Return 1 if deletion is successful, otherwise return 0
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1; // Return -1 for any exceptions
        }
    }



    // delete cart:
    public int deleteCart(String cartId) {
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(ProductStringUtils.DELETE_CART_INFO_BY_ID);
            st.setString(1, cartId);

            int result = st.executeUpdate();
            return result > 0 ? 1 : 0; // Return 1 if deletion is successful, otherwise return 0
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1; // Return -1 for any exceptions
        }
    }

    // update product
    public int updateProduct(ProductsModel productModel) {
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(ProductStringUtils.UPDATE_PRODUCT_WITH_IMAGE);

            st.setString(1, productModel.getProductName());
            st.setString(2, productModel.getProductDescription());
            st.setString(3, productModel.getProductCategory());
            st.setInt(4, productModel.getProductPrice());
            st.setInt(5, productModel.getProductStock());
            st.setString(6, productModel.getProductModels());
            st.setString(7, productModel.getProductSize());
            st.setString(8, productModel.getProductColor());
            st.setString(9, productModel.getProductDialShape());
            st.setString(10, productModel.getProductCompatibleOs());
            st.setString(11, productModel.getImageUrlFromPart());
            st.setInt(12, productModel.getProdId());

            int result = st.executeUpdate();
            return result > 0 ? 1 : 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    //update user
    public int updateUser(UsersModel userModel) {
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(ProductStringUtils.UPDATE_USER_WITH_IMAGE);

            st.setString(1, userModel.getUserName());
            st.setString(2, userModel.getEmail());
            st.setString(3, userModel.getLocation());
            st.setString(4, userModel.getPhone());
            st.setString(5, userModel.getImageUrlFromPart());
            st.setInt(6, userModel.getUserId());

            int result = st.executeUpdate();
            return result > 0 ? 1 : 0;
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    // add to cart:
    public int addCart(CartModel cartModel) {
        try (Connection con = getConnection();
             PreparedStatement product = con.prepareStatement(StringUtils.ADD_TO_CART)) {

            // Insert the new product
            product.setInt(1, cartModel.getQuantity());
            product.setString(2, cartModel.getProductId());
            product.setString(3, cartModel.getUserId());
       
            // Execute the insert statement
            int result = product.executeUpdate();

            // Check if the insertion was successful
            return result > 0 ? 1 : 0;

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1; // Error occurred
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    //display cart
  
    public List<CartModel> displayCart(String userId) {
        List<CartModel> carts = new ArrayList<>();
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.CART_DISPLAY);
            st.setString(1, userId);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartModel cart = new CartModel();
                cart.setCartId(rs.getInt("cart_id"));
                cart.setQuantity(rs.getInt("quantity"));
                cart.setPrice(rs.getString("prod_price"));
                cart.setName(rs.getString("prod_name"));

                cart.setCartStatus(rs.getInt("cart_status"));
                cart.setImage(rs.getString("profile_Img"));
                //carts.setEmail(rs.getString("email"));
                
                // Populate other fields as needed
                carts.add(cart);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return carts;
    }
    public String getUserIdByEmail(String email) {
        String userid = null;
        try (Connection con = getConnection();
             PreparedStatement stmt = con.prepareStatement("SELECT user_id FROM users WHERE email = ?")) {

            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    userid = rs.getString("user_id");
                }
            }

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return userid;
    }
    
    // add to Order:
    public int addOrder(OrderModel orderModel) {
        try (Connection con = getConnection();
             PreparedStatement product = con.prepareStatement("INSERT INTO orders (cart_id) VALUES (?)")) {

            // Insert the new product
            product.setString(1, orderModel.getCartId());
            
       
            // Execute the insert statement
            int result = product.executeUpdate();

            // Check if the insertion was successful
            return result > 0 ? 1 : 0;

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1; // Error occurred
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    //setorderStatus
    public void setOrderStatus(int cartStatus, String cardId) {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE carts SET cart_status = ? WHERE cart_id = ?")) {

            ps.setInt(1, cartStatus);
            ps.setString(2, cardId);

            ps.executeUpdate();

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
    
    
    //set order status 1 for order
    public void setOrderStatus1(int orderStatus, String orderId) {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE orders SET order_status = ? WHERE order_id = ?")) {

            ps.setInt(1, orderStatus);
            ps.setString(2, orderId);

            ps.executeUpdate();

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
    //display order:

    public List<OrderModel> displayOrder(String userId) {
        List<OrderModel> orders = new ArrayList<>();
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.ORDER_DISPLAY);
            st.setString(1, userId);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderModel order = new OrderModel();
                
                order.setQuantity(rs.getInt("quantity"));
                order.setPrice(rs.getInt("prod_price"));
                order.setName(rs.getString("prod_name"));
                order.setImage(rs.getString("profile_Img"));
                //carts.setEmail(rs.getString("email"));
                
                // Populate other fields as needed
                orders.add(order);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return orders;
    }
//Display admin Order:
    public List<OrderModel> displayAdminOrder() {
        List<OrderModel> orders = new ArrayList<>();
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.ADMIN_ORDER_DISPLAY);
            

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderModel order = new OrderModel();
                
                order.setQuantity(rs.getInt("quantity"));
                order.setPrice(rs.getInt("prod_price"));
                order.setName(rs.getString("prod_name"));
                order.setOrderId(rs.getInt("order_id"));
                order.setOrderStatus(rs.getInt("order_status"));
                order.setCartStatus(rs.getInt("cart_status"));
                order.setImage(rs.getString("profile_Img"));
                order.setUserName(rs.getString("userName"));
                order.setEmail(rs.getString("email"));
                
                //carts.setEmail(rs.getString("email"));
                
                // Populate other fields as needed
                orders.add(order);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
        }
        return orders;
    }//Search functionality
    public List<ProductsModel> searchProducts(String query) throws Exception {
        List<ProductsModel> products = new ArrayList<>();

        DatabaseController dbController = new DatabaseController();
        try (Connection con = dbController.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE prod_name LIKE ? OR prod_price LIKE ?");
            ps.setString(1, "%" + query + "%");
            ps.setString(2, "%" + query + "%");

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductsModel product = new ProductsModel();
                    product.setProdId(rs.getInt("prod_id"));
                    product.setProductName(rs.getString("prod_name"));
                    product.setProductDescription(rs.getString("prod_description"));
                    product.setProductPrice(rs.getInt("prod_price"));
                    product.setImageUrlFromString(rs.getString("profile_Img"));
                    products.add(product);
                }
            }
        }

        return products;
    }

}
