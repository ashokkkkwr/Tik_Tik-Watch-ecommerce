package model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    DatabaseController dbController = new DatabaseController();

    public CartServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter printOut = response.getWriter();

        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");

        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        int result = 0;

        switch (action) {
            case "addToCart":
                result = dbController.addToCart(userId, productId, quantity);
                break;
            case "updateCart":
                // Update cart functionality
                break;
            case "removeFromCart":
                result = dbController.removeFromCart(userId, productId);
                break;
        }

        if (result > 0) {
            // Redirect back to the cart page
            response.sendRedirect(request.getContextPath() + "/cart.jsp");
        } else {
            request.setAttribute("error", "Error occurred while updating the cart");
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
        }
    }
}
