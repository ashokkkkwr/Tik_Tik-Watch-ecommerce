// SignupServlet Class
package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import util.StringUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.DatabaseController;
import model.UsersModel;



@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.SIGNUP_SERVLET})

@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
maxFileSize=1024*1024*50,      	// 50 MB
maxRequestSize=1024*1024*100)

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    DatabaseController dbController = new DatabaseController();

    public SignupServlet() {
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

        String userName = request.getParameter(StringUtils.USERNAME);
        String email = request.getParameter(StringUtils.EMAIL);
        String location = request.getParameter(StringUtils.LOCATION);
        String phone = request.getParameter(StringUtils.PHONE);
        String password = request.getParameter(StringUtils.PASSWORD);
        String isAdmin = request.getParameter(StringUtils.IS_ADMIN);
        String retypePassword = request.getParameter(StringUtils.RETYPE_PASSWORD);
        Part imagePart = request.getPart("image");

        if (password.equals(retypePassword)) {
            UsersModel userModel = new UsersModel(userName, email, location, phone, password, isAdmin,imagePart);
            String savePath = StringUtils.IMG_DIR_SAVE_PATH;
            String fileName= userModel.getImageUrlFromPart();
            if(!fileName.isEmpty() && fileName !=null)
            	imagePart.write(savePath + fileName);
            int result = dbController.addUser(userModel);

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
        } else {
            request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PASSWORD_UNMATCHED_ERROR_MESSAGE);
            request.getRequestDispatcher(StringUtils.SIGNUP_PAGE).forward(request, response);
        }

    } 
}