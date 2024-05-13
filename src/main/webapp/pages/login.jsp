<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="util.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Code for font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        
        


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
                <p><a href=${pageContext.request.contextPath}/pages/signup.jsp>Don't have an account?</a></p>
                <input type="submit" value="Log In">
                 <% 
        String successMessage = (String) request.getAttribute(StringUtils.SUCCESS_MESSAGE);
        String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);

        if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
        <!-- Display error message -->
         <div style="color: #ff3860;
    font-size: 15px;
    height: 13px;">
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
            </form>
        </div>
    </div>

</div>



</body>
</html>