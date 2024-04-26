<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.UsersModel" %>
<%@page import="util.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
          <!-- code for boxicons  -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <!-- code for boxicons  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/signup.css">
</head>
<body>



    
 <div class="container">
        <div class="signup-box">
            <h1 class="sign-head">SIGN UP</h1>      
<form action="${pageContext.request.contextPath}/SignupServlet" method="post" enctype="multipart/form-data">
<div class="input-control">
<label>UserName:</label>
<input type="text" id="userName" name="userName" required>
</div>
<div class="input-control">
<label>Email:</label>
<input type="text" id="email" name="email" required>
</div>
<div class="input-control">
<label>Location:</label>
<input type="text" id="location" name="location" required>
</div>
<div class="input-control">
<label>Phone:</label>
<input type="text" id="phone" name="phone" required>
</div>
<div class="input-control">
<label>Password:</label>
<input type="text" id="password" name="password" required>
</div>
<div class="input-control">
<label>Retype Password:</label>
<input type="text" id="retypePassword" name="retypePassword" required>
</div>
<div class="input-control">
<label for="image">Profile Picture</label> <input type="file" id="image" name="image">
</div>
 <div class="group">
                    <p class="sign-para"><a href="login.html">Already have an account? </a></p>
                </div>
<div class="button">
<button type="submit">Sign up</button>
</div>
 <%
        String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);
    
        
        if (errorMessage !=null && !errorMessage.isEmpty()) {
    %>
        <div class="error" role="alert">
            <%= errorMessage %>
        </div>
        <% 
        }
        %> 
</form>


</div>
</div>
</body>
</html>