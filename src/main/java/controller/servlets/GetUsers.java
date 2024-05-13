package controller.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.DatabaseController;
import model.UsersModel;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.GET_USERS)
public class GetUsers extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DatabaseController dbController = new DatabaseController();

    public GetUsers() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve email from the session
        String email = (String) request.getSession().getAttribute("Adminemail");
        if (email == null || email.isEmpty()) {
            // If "Adminemail" is not found in the session, try "email"
            email = (String) request.getSession().getAttribute("email");
            System.out.println(email);
        }

        if (email != null && !email.isEmpty()) {
            // Fetch users from the database based on the email
            List<UsersModel> users = dbController.getAllUsers1(email);

            // Set the users as an attribute in the request object
            request.setAttribute("loggedInUser", users);

            // Forward the request to the singleRegisterUser.jsp page
            request.getRequestDispatcher("pages/singleRegisterUser.jsp").forward(request, response);

           
        } else {
            // If neither "Adminemail" nor "email" is found in the session, redirect to login page
            response.sendRedirect("login.jsp");
        }
    }


}
