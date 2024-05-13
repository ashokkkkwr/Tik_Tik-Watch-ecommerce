<%@ page import="model.ProductsModel" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TIKTIK</title>
    <!-- Code for font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/styles.css">
   

    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
   <style>
        body {
            background-color: black;
            color: white;
            font-size: 20px;
            text-align: center;
        }
        
        .login button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
            text-decoration: none;
        }
        
        .login button:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
    <!-- Header Section Starts -->
















    <header class="header">
        <a href="index.html" class="logo">TIK<span>TIK.</span></a>
        <nav class="navbar">
           <a href="${pageContext.request.contextPath}/pages/home.jsp" style="text-decoration:none; color: orange;">
    <i class="fas fa-home"></i> Home
</a>


           <a href="${pageContext.request.contextPath}/CartServlet">            <div class="fa fa-shopping-cart" id="cart-btn"></div>
           cart</a>
           
         <a href="${pageContext.request.contextPath}/pages/aboutUs.jsp">
    <i class="fas fa-info-circle"></i> About Us
</a>

<a href="${pageContext.request.contextPath}/OrderServlet">
    <i class="fas fa-shopping-bag"></i> Order
</a>



            
            
            
            
        </nav>

<div class="icons">

            
            
          <!-- Check if user is logged in -->
<% if (request.getSession().getAttribute("email") != null) { %>
<div class="icons">
    <a href="${pageContext.request.contextPath}/GetUsers">
        <div class="fa fa-user" id="user-btn" onclick="menuToggle();"></div>
        </a>
       
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
         <div>
         <button type="submit" class="fas fa-sign-out-alt"></button>
           </div> 
           
        
        </form>
        </div>
        
    
<% } else { %>
    <!-- Show login link if not logged in -->
    <div class="login">
    
    <a href="login.jsp">
<button class="fas fa-sign-in-alt">Login</button>    </a>
    </div>
<% } %>

            <!-- Sub Menu for the user icon -->
            <ul class="menu-items">
                <li><img src="" alt=""><a href="#">View Profile</a></li>
                <li><img src="" alt=""><a href="#">Edit Profile</a></li>
                <li><img src="" alt=""><a href="#">Log Out</a></li>
            </ul>
</div>

    </header>





    <!-- Header Section Ends -->





    <!-- Hero Section Starts-->


    <main>
        <section class="hero-section">
            <div class="hero-container"></div>
            <div class="hero-data">
                <p class="hero-bottom-data1">TIKTIK is always ready to serve our customers.</p>

                <h1 class="hero-heading1">Elegance that endures</h1>
                <h1 class="hero-heading">Wear the <span class="span-heading">Future.</span></h1>
                
                <p class="hero-bottom-data">Crafted for perfection, made for you.</p>


                <!-- Search box -->
             <form action="${pageContext.request.contextPath}/SearchServlet" class="search-box" method="get">
                    <!-- icon -->
                    <i class="fas fa-search"></i>
                    <!-- Input -->
                    <input type="text" class="search-input" placeholder="Search here" name="query" required>
                    <!-- btn -->
                    <input type="submit" class="search-btn" value="Search">
                </form>



            </div>
            <!-- Hero section right side -->
            <div class="hero-image">
            
<img src="${pageContext.request.contextPath}/images/image copy.png" alt="watch image" class="hero-image">
            </div>

        </section>
    </main>


    <!-- Hero Section Ends -->




    <!-- Product Section Starts-->
 
 
 
 
 


 
 
 
 

    
        <div id="productContent"></div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
  $(document).ready(function(){
    $.get("${pageContext.request.contextPath}/UserProductServlet", function(data, status){
      $("#productContent").html(data);
    });
  });
</script>

            



        </div>
    </div>


    <!-- Product Section Ends -->







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



    <!-- Linking the JavaScript Code -->

    <script src="script.js"></script>

</body>

</html>
