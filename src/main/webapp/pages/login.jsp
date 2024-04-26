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


    <!-- Header Section Starts -->


    <header class="header">
        <a href="index.html" class="logo">TIK<span>TIK.</span></a>
        <nav class="navbar">
            <a href="index.html">HOME</a>
            <a href="products.html">PRODUCT</a>
            <a href="#aboutus">ABOUT US</a>
            <a href="signup.html">SIGN UP</a>
        </nav>

        <div class="icons">

            <a href="cart.html">
            <div class="fa fa-shopping-cart" id="cart-btn">0</div>
            </a>
            <div class="fa fa-user" id="user-btn" onclick="menuToggle();"></div>
            <!-- Sub Menu for the user icon -->
            <ul class="menu-items">
                <li><img src="" alt=""><a href="#">View Profile</a></li>
                <li><img src="" alt=""><a href="#">Edit Profile</a></li>
                <li><img src="" alt=""><a href="#">Log Out</a></li>
            </ul>
        </div>

    </header>





    <!-- Header Section Ends -->









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

        <!-- Footer Section Starts -->


        <section class="footer">

            <div class="footer-content">
                <!-- <img src="logo.png" alt="logo">
                 -->
                <a href="index.html" class="logo-foot">TIK<span>TIK.</span></a>
                <p class="par">connect with us.</p>
                <div class="footer-icons">
                    <a href="#" class="fb"><i class="bx bxl-facebook-circle"></i></a>
                    <a href="#" class="insta"><i class="bx bxl-instagram-alt"></i></a>
                    <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
    
    
                </div>
            </div>
    
    
            <div class="footer-content">
                <h4>Company</h4>
                <li><a href="#">How we work</a></li>
                <li><a href="#">Capital</a></li>
                <li><a href="#">Security</a></li>
                <li><a href="#">Pricing</a></li>
                <li><a href="#">Renting</a></li>
            </div>
    
    
            <div class="footer-content">
                <h4>Services</h4>
                <li><a href="index.html">Home</a></li>
                <li><a href="products.html">Products</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="signup.html">Sign Up</a></li>
                <li><a href="cart.html">Cart</a></li>
            </div>
    
    
            <div class="footer-content">
                <h4>Help</h4>
                <li><a href="#">Privacy</a></li>
                <li><a href="#">Condition</a></li>
                <li><a href="#">Blogs</a></li>
                <li><a href="#">FAQs</a></li>
                <li><a href="#">Contact Us</a></li>
            </div>
    
        </section>
    
    
        <!-- Footer Section Ends -->





</body>
</html>