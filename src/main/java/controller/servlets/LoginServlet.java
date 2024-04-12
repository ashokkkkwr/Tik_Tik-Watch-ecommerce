package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import model.UsersModel;
import util.StringUtils;

@WebServlet(asyncSupported=true, urlPatterns = StringUtils.LOGIN_SERVLET)

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   private DatabaseController dbController = new DatabaseController();
   
    public LoginServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter(StringUtils.EMAIL);
		String password = request.getParameter(StringUtils.PASSWORD);
		
		System.out.println(email);
		System.out.println(password);
		
		int loginResult = dbController.getLogin(email, password);
		if(loginResult ==1) {
			HttpSession userSession = request.getSession();
        	userSession.setAttribute("email", email);
        	userSession.setMaxInactiveInterval(30*3);
        	
        	Cookie userCookie = new Cookie("email", email);
        	userCookie.setMaxAge(30*60);
        	response.addCookie(userCookie);
        	
        	UsersModel user=null;
        	try {
        		user=dbController.getUserDetails(email);
        		
        	}catch(ClassNotFoundException e) {
        		e.printStackTrace();
        	}
        	  if (user != null) {
                  request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_LOGIN_MESSAGE);
                  request.getRequestDispatcher(StringUtils.HOME_PAGE).forward(request, response);
              } else {
                  request.setAttribute(StringUtils.ERROR_MESSAGE, "user details not found");
                  request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
              }
          } else if (loginResult == 0) {
              request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_LOGIN_MESSAGE);
              request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
          } else {
              request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
              request.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(request, response);
          }

}
}
