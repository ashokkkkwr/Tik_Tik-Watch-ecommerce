<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/allProducts.css">
<%@ page import="model.ProductsModel" %>
<%@ page import="model.UsersModel" %>

<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
        <!-- Code for font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/styles.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    
</head>
<body>

    <!-- Header Section Starts -->

    <header class="header">
        <a href="index.html" class="logo">TIK<span>TIK.</span></a>
        <nav class="navbar">
           <a href="${pageContext.request.contextPath}/pages/home.jsp">
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





    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <%@ page import="model.ProductsModel" %>
<%@ page import="java.util.List" %>
<%@ page import="model.UsersModel" %>
<div class="container">
    <h1 class="heading">Search Results.</h1>
   

<div class="box-container">
    <%
    List<ProductsModel> products = (List<ProductsModel>) request.getAttribute("searchResults");
    List<UsersModel> users = (List<UsersModel>) request.getAttribute("loggedInUser");
    UsersModel user = null;
    if (users != null && !users.isEmpty()) {
        user = users.get(0);
    }
    for (ProductsModel product : products) {
    %>

    <div class="box">
        <div class="image">
            <img src="${pageContext.request.contextPath}/images/<%= product.getImageUrlFromPart() %>" alt="watch image">
        </div>
        <div class="content">
            <h3><%= product.getProductName() %>.</h3>
            <p>Price: $<%= product.getProductPrice() %></p>
          
            
            <div style="margin-left:4vh; margin-top:5px;">
    <a href="${pageContext.request.contextPath}/pages/productDetails.jsp?userId=${user.userId}&id=<%= product.getProdId() %>&name=<%= product.getProductName() %>&description=<%= product.getProductDescription() %>&category=<%= product.getProductCategory() %>&price=<%= product.getProductPrice() %>&availability=<%= product.getProductStock() %>&models=<%= product.getProductModels() %>&size=<%= product.getProductSize() %>&color=<%= product.getProductColor() %>&dialShape=<%= product.getProductDialShape() %>&compatibleOs=<%= product.getProductCompatibleOs() %>&image=<%= product.getImageUrlFromPart() %>" class="btn">View</a>
</div>

        </div>
    </div>

    <% 
    }
    %>
</div>

</div>


<script>
    function addToCart(prodId) {
        var userLoggedIn = <%= (user != null) %>;
        if (!userLoggedIn) {
            window.location.href = "${pageContext.request.contextPath}/pages/login.jsp";
        } else {
            document.getElementById("addToCartForm_" + prodId).submit();
        }
    }
</script>
    
</body>
</html>
