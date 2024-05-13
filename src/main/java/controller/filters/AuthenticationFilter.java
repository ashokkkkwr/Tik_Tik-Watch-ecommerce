package controller.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.StringUtils;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);
        boolean isLoggedIn = session != null && session.getAttribute("email") != null;
        boolean isAdmin = session != null && session.getAttribute("Adminemail") != null;
		boolean isHomeJ = uri.endsWith("home.jsp");
		boolean isAdminJ = uri.endsWith("admin.jsp");

        // Allow access to login and signup pages without checking for authentication
        if(isAdmin && isHomeJ) {
        	 res.sendRedirect(req.getContextPath() + "/pages/admin.jsp");
             return;
        }
        else if(isAdmin && isAdminJ) {
        	chain.doFilter(req, res);
            return;
        } else if(isLoggedIn && isAdminJ) {
       	 res.sendRedirect(req.getContextPath() + "/pages/home.jsp");
         return;
    }
    if(isLoggedIn && isHomeJ) {
    	chain.doFilter(req, res);
        return;
    }
    if(!isLoggedIn && isHomeJ) {
    	chain.doFilter(req, res);
        return;
    }
    if(!isLoggedIn && uri.endsWith("CartServlet")) {
        res.sendRedirect(req.getContextPath() + "/pages/login.jsp");
        return;
    }
    if(!isLoggedIn && uri.endsWith("OrderServlet")) {
        res.sendRedirect(req.getContextPath() + "/pages/login.jsp");
        return;
    }
     
        
        
        if(isLoggedIn && isAdminJ) {
       	 res.sendRedirect(req.getContextPath() + "/pages/admin.jsp");
            return;
       }
        if (uri.endsWith("login.jsp") || uri.endsWith("signup.jsp") || uri.endsWith(".css") || uri.endsWith(".png")|| uri.endsWith(".jpg") || uri.endsWith(".jpeg")||uri.endsWith("UsersServlet") ||uri.endsWith("CrudServlet") ||uri.endsWith("ProductsServlet") ||uri.endsWith("ProductServlet") || uri.endsWith("CartServlet")||uri.endsWith("GetUsers")|| uri.endsWith("addProduct.jsp")||uri.endsWith("singleRegisterUser.jsp") ||uri.endsWith("editProduct.jsp")||uri.endsWith("UserProductServlet")||uri.endsWith("productDetails.jsp")||uri.endsWith("OrderServlet")||uri.endsWith("adminOrder.jsp")||uri.endsWith("AdminOrder")||uri.endsWith("search.jsp")||uri.endsWith("SearchServlet")||uri.endsWith("CrudUserServlet")||uri.endsWith("aboutUs.jsp")||uri.endsWith("ContactUsServlet")||uri.endsWith("AllContacts") ){
            chain.doFilter(req, res);
            return;
        }

        // Redirect to login page if not logged in and trying to access restricted pages
        if (!isLoggedIn && !(uri.endsWith("LoginServlet") || uri.endsWith("SignupServlet") || uri.endsWith("cart.jsp"))) {
            res.sendRedirect(req.getContextPath() + "/pages/login.jsp");
            return;
        }
      
        // Allow access to other pages if logged in
        chain.doFilter(request, response);
    }


    @Override
    public void init(FilterConfig arg0) throws ServletException {
    }
}
