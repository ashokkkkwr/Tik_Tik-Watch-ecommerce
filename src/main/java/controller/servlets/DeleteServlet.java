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
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DatabaseController dbController = new DatabaseController();
   
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
