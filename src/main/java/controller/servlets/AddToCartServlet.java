package controller.servlets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;

import java.io.IOException;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private DatabaseController dbController = new DatabaseController();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract product details from request parameters
        int productId = Integer.parseInt(request.getParameter("productId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Add the product to the cart
        int addToCartResult = dbController.addToCart(userId, productId, quantity);

        if (addToCartResult == 1) {
            // Successful addition to cart
            response.sendRedirect("cart.jsp"); // Redirect to the cart page
        } else {
            // Handle error
            response.sendRedirect("error.jsp");
        }
    }
}
