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
        System.out.println("yo user ko pugina");
        String email = (String) request.getSession().getAttribute("Adminemail");
        System.out.println(email);
        List<UsersModel> users = dbController.getAllUsers1(email);
        // Fetch admin email from the session

        // Set the user as an attribute in the request object
        request.setAttribute("loggedInUser", users);

        // Forward the request to the singleRegisterUser.jsp page
        request.getRequestDispatcher("pages/singleRegisterUser.jsp").forward(request, response);
    }

}
