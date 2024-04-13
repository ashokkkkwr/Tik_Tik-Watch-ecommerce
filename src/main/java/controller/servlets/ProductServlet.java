package controller.servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import controller.DatabaseController;
import model.ProductsModel;
import util.ProductStringUtils;


@WebServlet(asyncSupported = true, urlPatterns = { ProductStringUtils.REGISTER_SERVLET })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseController dbController = new DatabaseController();

	public ProductServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse 		response)
			throws ServletException, IOException {
		PrintWriter printOut = response.getWriter();
		response.setContentType("text/html");
		printOut.print("Hello World!");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse 		response)
			throws ServletException, IOException {
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter printOut = response.getWriter();
		
		
		String productName = request.getParameter(ProductStringUtils.PRODUCT_NAME);
		String productDescription = request.getParameter(ProductStringUtils.PRODUCT_DESCRIPTION);
		String productCategory = request.getParameter(ProductStringUtils.PRODUCT_CATEGORY);
		String productPrice = request.getParameter(ProductStringUtils.PRODUCT_PRICE);
		String productAvailability = request.getParameter(ProductStringUtils.PRODUCT_AVAILABILITY);

		

 
        
		ProductsModel studentModel = new ProductsModel(productName, productDescription, productCategory, productPrice, productAvailability);
		
		int result = dbController.addStudent(studentModel);
		System.out.println(result);
		


		if (password.equals(retypePassword)) {
			switch (result) {
				case 1 -> {
					request.setAttribute(StringUtils.SUCCESS_MESSAGE, StringUtils.SUCCESS_REGISTER_MESSAGE);
				    response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
				}
				case 0 -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.ERROR_REGISTER_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
				case -1 -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
				case -2 -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.USERNAME_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
				case -3 -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.EMAIL_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
				case -4 -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PHONE_NUMBER_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
				default -> {
					request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.SERVER_ERROR_MESSAGE);
				    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
				}
			}
		}
		else {
			request.setAttribute(StringUtils.ERROR_MESSAGE, StringUtils.PASSWORD_UNMATCHED_ERROR_MESSAGE);
		    request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
		}
	}}


