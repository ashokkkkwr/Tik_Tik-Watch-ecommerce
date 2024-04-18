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

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.USERS_SERVLET)
public class UsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DatabaseController dbController = new DatabaseController();

    public UsersServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch all student details from the database
        List<UsersModel> users = dbController.getAllUsers();

        // Set the list of students as an attribute in the request object
        request.setAttribute("users", users);

        // Forward the request to the students.jsp page
        request.getRequestDispatcher("pages/RegisterUser.jsp").forward(request, response);
    }
}
