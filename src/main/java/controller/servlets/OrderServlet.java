package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import util.StringUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.DatabaseController;
import model.CartModel;
import model.OrderModel;
import model.UsersModel;

@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.ORDER_SERVLET})
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)

public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    DatabaseController dbController = new DatabaseController();

    public OrderServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("email");
    	
        String userid=dbController.getUserIdByEmail(email);
        System.out.println("users ko :"+userid);
        // Fetch users from the database based on the email
        List<OrderModel> order = dbController.displayOrder(userid);
        System.out.println(order);
        // Set the users as an attribute in the request object
        request.setAttribute("UserOrder", order);

        // Forward the request to the singleRegisterUser.jsp page
        request.getRequestDispatcher("pages/order.jsp").forward(request, response);     
    } 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter printOut = response.getWriter();
        
        String[] cartIds = request.getParameterValues("cart_ids");
        int cartStatus = 1; // Set the order status
        
        if (request.getParameter("orderItem") != null) {
            String cartId = request.getParameter("cart_ids");
            dbController.setOrderStatus(cartStatus, cartId);
            OrderModel orderModel = new OrderModel(cartId);
            orderModel.setOrderStatus(cartStatus);
            dbController.addOrder(orderModel);
        } else if (request.getParameter("deleteItem") != null) {
            String cartId = request.getParameter("cart_ids");
            dbController.deleteCart(cartId);
        } else if (request.getParameter("orderAll") != null && cartIds != null) { // Check if orderAll parameter is present
            for (String cartId : cartIds) {
                dbController.setOrderStatus(cartStatus, cartId);
                OrderModel orderModel = new OrderModel(cartId);
                orderModel.setOrderStatus(cartStatus);
                dbController.addOrder(orderModel);
            }
        }
        
        // Redirect back to wherever you need to go after ordering
        response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
    }
}
