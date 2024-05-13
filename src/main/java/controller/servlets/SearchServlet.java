package controller.servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductsModel;
import controller.DatabaseController;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        List<ProductsModel> products = null;
        
        try {
            DatabaseController dbController = new DatabaseController();
            products = dbController.searchProducts(query);
            request.setAttribute("searchResults", products); // Set search results as request attribute
            request.getRequestDispatcher("pages/search.jsp").forward(request, response); // Forward to search.jsp
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
