<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="util.StringUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/login.css">

<style>
body {
    background-color: rgb(158, 133, 133);
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}

.container {
    position: relative;
    border-radius: 20px;
    padding-top: 5px;
    background-color: rgb(158, 133, 133);
    height: 600px;
    width: 1000px;
    margin: auto;
    background-image: url("../images/image.png");


}

.signin-box {
    /* position: relative */
    position: absolute;
    top: 50%; /* Adjust this value to move the form down */
    left: 79%;
    transform: translate(-50%, -50%);
    width: 350px;
    height: 400px;
    margin: auto;
    background-color: white;
    border-radius: 25px;
    text-align: center;
    margin-right: 35px;
}

h1 {
    text-align: center;
    padding-top: 10px;
}

form {
    width: 240px;
    margin-left: 60px;
}

form label {
    display: flex;
    margin-top: 20px;
    margin-bottom: 12px;
    font-size: 16px;
    margin-left: 10px;
    color: rgb(116, 112, 112);

}

form input {
    width: 90%;
    height: 15px;
    padding: 9px;
    border: none;

    border-radius: 6px;
    outline: none;
    background-color: rgb(232, 231, 231);


}

p {
    margin-top: 35px;
    text-align: center;
    font-size: 15px;
    color: rgb(91, 91, 230);

}

p a {
    color: rgb(91, 91, 230);
    text-decoration: none;
}

input[type="submit"] {
    width: 150px;
    height: 40px;
    margin-top: 12px;
    border: none;
    background-color: orange;
    color: white;
    font-size: 14px;
    border-radius: 20px;
    font-weight: bold;
    text-transform: uppercase;
    cursor: pointer;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    -webkit-transition-duration: 0.3s;
    transition-duration: 0.3s;
    -webkit-transition-property: box-shadow, transform;
    transition-property: box-shadow, transform;



}

input[type="submit"]:hover,
input[type="submit"]:focus,
input[type="submit"]:active {

    box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
    color: blue;

}
</style>
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