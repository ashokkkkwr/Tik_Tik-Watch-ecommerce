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
@WebServlet("/CrudServlet")
@MultipartConfig()
public class CrudServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    DatabaseController dbController = new DatabaseController();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrudServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String updateId = request.getParameter("updateId");
        String deleteId = request.getParameter("deleteId");
        
        System.out.println(updateId);
        
        if (updateId != null && !updateId.isEmpty()) {
            doPut(request, response);
        }
        if (deleteId != null && !deleteId.isEmpty()) {
            doDelete(request, response);
        }
    }

    /**
     * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
     */
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String updateId = request.getParameter("updateId");
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDescription");
        String productCategory = request.getParameter("productCategory");
        int productPrice = Integer.parseInt(request.getParameter("productPrice")); // Convert String to int
        int productStock = Integer.parseInt(request.getParameter("productStock"));
        String productModel = request.getParameter("productModel");
        String productSize = request.getParameter("productSize");
        String productColor = request.getParameter("productColor");
        String productDialShape = request.getParameter("productDialShape");
        String productCompatibleOs = request.getParameter("productCompatibleOs");
        Part imagePart=request.getPart("image");

        // You may need to handle the image upload separately

        // Create a ProductsModel object with the updated information
        ProductsModel updatedProduct = new ProductsModel();
        updatedProduct.setProdId(Integer.parseInt(updateId));
        updatedProduct.setProductName(productName);
        updatedProduct.setProductDescription(productDescription);
        updatedProduct.setProductCategory(productCategory);
        updatedProduct.setProductPrice(productPrice);
        updatedProduct.setProductStock(productStock);
        updatedProduct.setProductModels(productModel);
        updatedProduct.setProductSize(productSize);
        updatedProduct.setProductColor(productColor);
        updatedProduct.setProductDialShape(productDialShape);
        updatedProduct.setProductCompatibleOs(productCompatibleOs);
        updatedProduct.setImageFromPart(imagePart);

        // Update product information in the database
        int result = dbController.updateProduct(updatedProduct);
        if (result == 1) {
            request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_UPDATE_MESSAGE);
            response.sendRedirect(request.getContextPath() + StringUtils.PRODUCTS_SERVLET);
        } else {
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_UPDATE_MESSAGE);
            response.sendRedirect(request.getContextPath() + StringUtils.PRODUCTS_SERVLET);
        }
        if(result == -1) {
            System.out.println("error");
        }
    }

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
