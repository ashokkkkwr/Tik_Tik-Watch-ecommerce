// SignupServlet Class
package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import util.StringUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.CartModel;
@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.CART_SERVLET})
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    DatabaseController dbController = new DatabaseController();

    public CartServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter printOut = response.getWriter();
        response.setContentType("text/html");
        printOut.print("Hello World");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter printOut = response.getWriter();
      
        String   user_id =request.getParameter(StringUtils.USER_ID);
        String quantity = request.getParameter(StringUtils.QUANTITY);
        String prod_id = request.getParameter(StringUtils.PROD_ID);

        CartModel cartModel = new CartModel( quantity,  prod_id,  user_id);
        int result = dbController.addCart(cartModel);

        switch (result) {
            case 1:
                request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESSFUL_SIGNUP_MESSAGE);
                response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
                break;
            case 0:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_SIGNUP_MESSAGE);
                request.getRequestDispatcher(StringUtils.SIGNUP_PAGE).forward(request, response);
                break;
            case -1:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
                request.getRequestDispatcher(StringUtils.SIGNUP_PAGE).forward(request, response);
                break;
            case -2:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.USERNAME_ERROR_MESSAGE);
                request.getRequestDispatcher(StringUtils.SIGNUP_PAGE).forward(request, response);
                break;
            case -3:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.EMAIL_ERROR_MESSAGE);
                request.getRequestDispatcher(StringUtils.SIGNUP_PAGE).forward(request, response);
                break;
            case -4:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PHONE_NUMBER_ERROR_MESSAGE);
                request.getRequestDispatcher(StringUtils.SIGNUP_PAGE).forward(request, response);
                break;
            default:
                request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
                request.getRequestDispatcher(StringUtils.SIGNUP_PAGE).forward(request, response);
                break;
        }
    } 
}
