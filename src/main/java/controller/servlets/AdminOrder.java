// SignupServlet Class
package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
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



@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.ADMIN_ORDER})

@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)

public class AdminOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;
    DatabaseController dbController = new DatabaseController();

    public AdminOrder() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("email");
    	
    	 String userid=dbController.getUserIdByEmail(email);
    	 System.out.println("users ko :"+userid);
               // Fetch users from the database based on the email
               List<OrderModel> order = dbController.displayAdminOrder();
               System.out.println(order);
               // Set the users as an attribute in the request object
               request.setAttribute("AdminOrder", order);

               // Forward the request to the singleRegisterUser.jsp page
               request.getRequestDispatcher("pages/adminOrder.jsp").forward(request, response);

              
           } 
    
          
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter printOut = response.getWriter();
        
        // Iterate over the parameters to find the clicked button
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("acceptOrder_")) {
                String orderId = paramName.split("_")[1];
                int orderStatus = Integer.parseInt(request.getParameter("order_status"));
                
                // Update the order status
                dbController.setOrderStatus1(orderStatus, orderId);
                break; // Break out of the loop once the order is accepted
            }
        }
        response.sendRedirect(request.getContextPath() + "/AdminOrder");


    }
}

