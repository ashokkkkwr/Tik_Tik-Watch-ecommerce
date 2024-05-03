package controller.servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.DatabaseController;
import model.ProductsModel;
import util.ProductStringUtils;


@WebServlet(asyncSupported = true, urlPatterns = { ProductStringUtils.PRODUCT_SERVLET })
@MultipartConfig
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
		String productModels = request.getParameter(ProductStringUtils.PRODUCT_MODEL);
		String productSize = request.getParameter(ProductStringUtils.PRODUCT_SIZE);
		String productColor = request.getParameter(ProductStringUtils.PRODUCT_COLOR);
		String productDialShape = request.getParameter(ProductStringUtils.PRODUCT_DIAL_SHAPE);
		String productCompatibleOs = request.getParameter(ProductStringUtils.PRODUCT_COMPATIBLE_OS);
		Part imagePart=request.getPart("image");

		

 
        
		ProductsModel productModel = new ProductsModel(productName,productDescription,productCategory,productPrice,productAvailability,productModels,productSize,productColor,productDialShape,productCompatibleOs,imagePart);	
		String savePath = ProductStringUtils.IMG_DIR_SAVE_PATH;
        String fileName= productModel.getImageUrlFromPart();
        if(!fileName.isEmpty() && fileName !=null)
        	imagePart.write(savePath + fileName);
		
		
		int result = dbController.addProduct(productModel);
		System.out.println(result);
		

			switch (result) {
				case 1 -> {
					request.setAttribute(ProductStringUtils.SUCCESS_MESSAGE, ProductStringUtils.SUCCESSFUL_PRODUCT_ADDED_MESSAGE);
				    response.sendRedirect(request.getContextPath() + ProductStringUtils.HOME_PAGE);
				}
				case 0 -> {
					request.setAttribute(ProductStringUtils.ERROR_MESSAGE, ProductStringUtils.ERROR_PRODUCT_MESSAGE_MESSAGE);
				    request.getRequestDispatcher(ProductStringUtils.HOME_PAGE).forward(request, response);
				}
				case -1 -> {
					request.setAttribute(ProductStringUtils.ERROR_MESSAGE, ProductStringUtils.SERVER_ERROR_MESSAGE);
				    request.getRequestDispatcher(ProductStringUtils.HOME_PAGE).forward(request, response);
				}
				case -2 -> {
					request.setAttribute(ProductStringUtils.ERROR_MESSAGE, ProductStringUtils.PRODUCT_ERROR_MESSAGE);
				    request.getRequestDispatcher(ProductStringUtils.ADD_PRODUCT).forward(request, response);
				}
				
				default -> {
					request.setAttribute(ProductStringUtils.ERROR_MESSAGE, ProductStringUtils.SERVER_ERROR_MESSAGE);
				    request.getRequestDispatcher(ProductStringUtils.HOME_PAGE).forward(request, response);
				}
			}
		}
	
	}


