<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="model.OrderModel" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order History</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/header.css">
<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
      integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Boxicons CDN -->
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<style>
h1 {
    font-size: 16px;
    text-align: center;
    margin-bottom: 40px;
}

.container {
    margin-top: 50px;
    text-align: center;
}

.card {
    border: none;
    border-radius: 10px;
    box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    width: 300px;
    margin: 10px;
    display: inline-block;
    vertical-align: top;
    background-color: #f8f9fa;
}

.card:hover {
    box-shadow: 0px 0px 30px 0px rgba(0, 0, 0, 0.2);
    transform: translateY(-5px);
}

.card-body {
    padding: 20px;
}

.card-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #495057;
}

.total-price {
    font-size: 24px;
    font-weight: bold;
    text-align: center;
    margin-top: 30px;
}
</style>
</head>
<body>




 <!-- Header Section Starts -->

    <header class="header">
        <a href="index.html" class="logo"style="text-decoration:none;">TIK<span>TIK.</span></a>
        <nav class="navbar">
           <a href="${pageContext.request.contextPath}/pages/home.jsp"style="text-decoration:none;">
    <i class="fas fa-home"></i> Home
</a>

           <a href="${pageContext.request.contextPath}/CartServlet"style="text-decoration:none; ">            <div class="fa fa-shopping-cart" id="cart-btn"></div>
           cart</a>
           
         <a href="${pageContext.request.contextPath}/pages/aboutUs.jsp"style="text-decoration:none;">
    <i class="fas fa-info-circle"></i> About Us
</a>

<a href="${pageContext.request.contextPath}/OrderServlet"style="text-decoration:none;color: orange;">
    <i class="fas fa-shopping-bag"></i> Order
</a>



            
            
            
            
        </nav>

<div class="icons">

            
            
          <!-- Check if user is logged in -->
<% if (request.getSession().getAttribute("email") != null) { %>
<div class="icons">
    <a href="${pageContext.request.contextPath}/GetUsers"style="text-decoration:none;">
        <div class="fa fa-user" id="user-btn" onclick="menuToggle();"></div>
        </a>
       
        
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













<div style="margin-left:22vh; margin-top:10vh;">
<h1>Order History</h1>
</div>
<div class="container mt-5">
    <div class="row">
        <%
        List<OrderModel> orders = (List<OrderModel>) request.getAttribute("UserOrder");
        double totalPrice = 0.0;
        if (orders != null && !orders.isEmpty()) {
            for (OrderModel order : orders) {
                totalPrice += order.getQuantity() * order.getPrice();
        %>
        <div class="card">
            <div class="card-body">
                <img class="card-img-top img-fluid" style="max-width: 100px; height: auto;"
                     src="${pageContext.request.contextPath}/images/<%= order.getImage() %>" alt="Order Image">
                                     <h5 class="card-title">Product Name: <%= order.getName() %></h5>
                <h5 class="card-title">Quantity: <%= order.getQuantity() %></h5>
                <h5 class="card-title">Price: <%= order.getPrice() %></h5>
                <h5 class="card-title">Total: <%= order.getQuantity() * order.getPrice() %></h5>
 

            </div>
        </div>
        <%
            } // end of for loop
        } // end of if
        %>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h1 class="total-price">Total Money Spend: <%= totalPrice %></h1>
        </div>
    </div>
    
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
