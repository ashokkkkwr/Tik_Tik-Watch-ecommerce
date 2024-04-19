<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.UsersModel" %>
<%@page import="util.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1> Sign up</h1>


 <%
        String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);
    
        
        if (errorMessage !=null && !errorMessage.isEmpty()) {
    %>
        <div class="alert alert-danger" role="alert">
            <%= errorMessage %>
        </div>
        <% 
        }
        %>
        
        
<form action="${pageContext.request.contextPath}/SignupServlet" method="post">
<label>UserName:</label>
<input type="text" id="userName" name="userName" required>
<label>Email:</label>
<input type="text" id="email" name="email" required>
<label>Location:</label>
<input type="text" id="location" name="location" required>
<label>Phone:</label>
<input type="text" id="phone" name="phone" required>
<label>Password:</label>
<input type="text" id="password" name="password" required>
<label>Retype Password:</label>
<input type="text" id="retypePassword" name="retypePassword" required>
<button type="submit">Sign up</button>
</form>


</div>
</body>
</html>