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

        boolean isSignupServlet = uri.endsWith("SignupServlet");
        boolean isLogin = uri.endsWith("login.jsp");
        boolean isLoginServlet = uri.endsWith("LoginServlet");
        boolean isLogoutServlet = uri.endsWith("LogoutServlet");

        HttpSession session = req.getSession(false);
        boolean isLoggedIn = session != null && session.getAttribute("user") != null;

        if (uri.endsWith("login.jsp") || uri.endsWith("signup.jsp")) {
            chain.doFilter(req, res);
            return;
        }

        if(uri.endsWith("home.jsp")) {
            chain.doFilter(request, response);
            return;
        }

        if (!isLoggedIn && (isSignupServlet || uri.endsWith("signup.jsp"))) {
            chain.doFilter(req, res);
            return;
        }

        if (!isLoggedIn && !(isLogin || isLoginServlet)) {
            res.sendRedirect(req.getContextPath() + "/pages/login.jsp");
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // Initialization code, if any
    }
}
