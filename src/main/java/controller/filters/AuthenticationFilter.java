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

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    @Override
    public void destroy() {
        // Cleanup code, if any
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);
        boolean isLoggedIn = session != null && session.getAttribute("email") != null;

        // Allow access to login and signup pages without checking for authentication
        if (uri.endsWith("login.jsp") || uri.endsWith("signup.jsp")) {
            chain.doFilter(req, res);
            return;
        }

        // Redirect to login page if not logged in and trying to access restricted pages
        if (!isLoggedIn && !(uri.endsWith("LoginServlet") || uri.endsWith("SignupServlet"))) {
            res.sendRedirect(req.getContextPath() + "/pages/login.jsp");
            return;
        }

        // Allow access to other pages if logged in
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // Initialization code, if any
    }
}
