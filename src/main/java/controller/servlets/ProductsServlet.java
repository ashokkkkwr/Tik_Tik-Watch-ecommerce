package controller.servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.DatabaseController;
import model.ProductsModel;
import util.ProductStringUtils;


@WebServlet(asyncSupported = true, urlPatterns = ProductStringUtils.PRODUCTS_SERVLET)
public class ProductsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DatabaseController dbController = new DatabaseController();

    public ProductsServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch all student details from the database
        List<ProductsModel> products = dbController.getAllProducts();

        // Set the list of students as an attribute in the request object
        request.setAttribute("products", products);

        // Forward the request to the students.jsp page
        request.getRequestDispatcher("pages/allProducts.jsp").forward(request, response);
    }
}
