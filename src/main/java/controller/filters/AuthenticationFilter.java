package controller.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebFilter("/*")
public class AuthenticationFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();	
		
		boolean isRegisterServlet = uri.endsWith("RegisterServlet");
		boolean isLogin = uri.endsWith("login.jsp");
		boolean isLoginServlet = uri.endsWith("LoginServlet");
		boolean isLogoutServlet = uri.endsWith("LogoutServlet");
		
		
		HttpSession session = req.getSession(false);
		boolean isLoggedIn = session != null && session.getAttribute("user") != null;
		
		if (uri.endsWith("register.jsp")) {
			chain.doFilter(req, res);
			return;
		}
		
		if(uri.endsWith("pages/home.jsp")) {
			chain.doFilter(request, response);
			return;
		}
		
		if (!isLoggedIn && isRegisterServlet) {
			chain.doFilter(req, res);
			return;
		}
		
		if (!isLoggedIn && !(isLogin || isLoginServlet)) {
			System.out.println("Hello");
			res.sendRedirect(req.getContextPath() + "/pages/login.jsp");
		}
		else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
