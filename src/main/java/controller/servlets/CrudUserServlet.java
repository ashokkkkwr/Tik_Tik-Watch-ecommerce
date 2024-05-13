package controller.servlets;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import controller.DatabaseController;
import model.ProductsModel;
import model.UsersModel;
import util.StringUtils;

/**
 * Servlet implementation class ModifyServlet
 */
@WebServlet("/CrudUserServlet")
@MultipartConfig()
public class CrudUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    DatabaseController dbController = new DatabaseController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrudUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String updateId = request.getParameter("updateId");
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String location = request.getParameter("location");
        String phone = request.getParameter("phone"); // Convert String to int
   
        Part imagePart=request.getPart("image");

        // You may need to handle the image upload separately

        // Create a ProductsModel object with the updated information
        UsersModel updatedUser = new UsersModel();
        updatedUser.setUserId(Integer.parseInt(updateId));
        updatedUser.setUserName(userName);
        updatedUser.setEmail(email);
        updatedUser.setLocation(location);
        updatedUser.setPhone(phone);
        updatedUser.setImageFromPart(imagePart);
      
        // Update product information in the database
        int result = dbController.updateUser(updatedUser);
        if (result == 1) {
            request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_UPDATE_MESSAGE);
            response.sendRedirect(request.getContextPath() + "/GetUsers");
        } else {
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_UPDATE_MESSAGE);
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        }
        if(result == -1) {
            System.out.println("error");
        }
    }
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Delete Triggered");
        int deleteId = Integer.parseInt(request.getParameter("deleteId"));
        if(dbController.deleteProduct(deleteId) == 1 ) {
            System.out.print("successful");
            request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_DELETE_MESSAGE);
            response.sendRedirect(request.getContextPath() + StringUtils.PRODUCTS_SERVLET);
        }
        else {
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_DELETE_MESSAGE);
            response.sendRedirect(request.getContextPath() + StringUtils.PRODUCTS_SERVLET);
        }
    }
}
