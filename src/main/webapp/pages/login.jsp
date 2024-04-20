<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="util.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/login.css">


</head>
<body>
<div>
  <div class="container">
        <div class="signin-box">
            <h1>LOG IN</h1>
            <a href="#"><i class="ri-arrow-left-line"></i></a>
            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                
<label for="email">Email:</label>
<input type="text" id="email"  name="email" required>
<label for="password">Password:</label>
<input type="password" id="password" name="password" required>
                <p><a href="signup.html">Forget Password?</a></p>
                <input type="submit" value="Log In">
            </form>
        </div>
    </div>
 <% 
        String successMessage = (String) request.getAttribute(StringUtils.SUCCESS_MESSAGE);
        String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);

        if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
        <!-- Display error message -->
         <div class="alert alert-danger mt-2" role="alert">
            <%= errorMessage %>
        </div>
        <% } %>

        <% 
        if (successMessage != null && !successMessage.isEmpty()) {
        %>
        <!-- Display success message -->
        <div class="alert alert-success mt-2" role="alert">
            <%= successMessage %>
        </div>
        <% } %>
</div>
</body>
</html>