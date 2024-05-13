<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="model.CartModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
     <!-- Code for font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   

    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            color: white;
            padding-top: 50px;
        }
        /* Header Starts */

.header {
    border: 0px solid;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    display: flex;
    align-items: center;
    padding: 2rem 9%;
    justify-content: space-between;
    background: rgb(31, 30, 30);
    z-index: 1000;

    /* box-shadow: var(--box-shadow); */


}

.header .logo {
    font-size: 2.5em;
    font-weight: bolder;
    /* color: var(--orange); */
    color: var(--white);

}


.header .navbar a {

    font-size: 1.2rem;
    margin: 2rem;
    
    color: var(--white);
 
}

.header .navbar a:hover {
    color: var(--orange);
 


}


.header .icons div {
    border: 0px solid;
    color: #fff;
    height: 2.5rem;
    width: 2.5rem;
    line-height: 2.5rem;
    border-radius: 2.5rem;
    background: #eee;
    color: var(--light-color);
    font-size: 1.2em;
    margin-right: 1rem;
    text-align: center;


    

}


.header .icons div:hover {
    color: var(--white);
    background: var(--orange);

}




.icons .menu-items li {

    list-style: none;
}

.icons .menu-items li a {
    text-decoration: none;
    color: var(--light-color);
}

.icons .menu-items {
    position: absolute;
    top:85px;
  /*  top: calc(100% + 0px); Adjust the distance from the header */
    right: 20px;
    padding: 10px 20px;
    background: #fff;
    width: 131px;
    border-radius: 5px;
    box-sizing: border-box;
    transition: 0.5s;
    visibility: hidden;
    opacity: 0;
}
.icons{
	display:flex;
}


.icons .menu-items.active {
    visibility: visible;
    opacity: 1;

}

.icons .menu-items li a:hover {
    color: black;
    background-color: #dfd8d8;
    transition: all ease .3s;
    visibility: visible;
    opacity: 1; 

}


/* Header Ends */
        
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .card {
            border: none;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(255,255,255,0.1);
            padding: 20px;
            background-color: #333;
        }
        .card-title {
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: bold;
            color: white;
        }
        .total-price {
            margin-top: 20px;
            font-size: 24px;
            font-weight: bold;
            color: white;
        }
        
        .btn-order {
            background-color:orange;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        .btn-order:hover {
            background-color: #0056b3;
        }
        .btn-delete {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        .btn-delete:hover {
            background-color: #bd2130;
        }
        .alert-secondary {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
            padding: 10px;
            border-radius: 5px;
            margin-top: 20px;
            color: black;
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

           <a href="${pageContext.request.contextPath}/CartServlet"style="text-decoration:none; color: orange;">            <div class="fa fa-shopping-cart" id="cart-btn"></div>
           cart</a>
           
         <a href="${pageContext.request.contextPath}/pages/aboutUs.jsp"style="text-decoration:none;">
    <i class="fas fa-info-circle"></i> About Us
</a>

<a href="${pageContext.request.contextPath}/OrderServlet"style="text-decoration:none;">
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
       
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
         <div>
         <button type="submit" class="fas fa-sign-out-alt"style="text-decoration:none;"></button>
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




    <div class="container"style="margin-top:10vh;">
        <h1 class="mb-4">Shopping Cart</h1>

        <div class="row">
            <%
            List<CartModel> carts = (List<CartModel>) request.getAttribute("UserCart");
            double totalPrice = 0.0;
            if (carts != null && !carts.isEmpty()) {
            %>
            <form id="orderAllForm" action="${pageContext.request.contextPath}/OrderServlet" method="post">
                <%
                    for (CartModel cart : carts) {
                        if(cart.getCartStatus() == 0) {
                            totalPrice += cart.getQuantity() * Double.parseDouble(cart.getPrice());
                %>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <img class="card-img-top img-fluid" style="max-width: 100px; height: auto;"
                                 src="${pageContext.request.contextPath}/images/<%= cart.getImage() %>" alt="Cart Image">
                                                        <h5 class="card-title">Product Name: <%= cart.getName() %></h5>
                            
                            <h5 class="card-title">Quantity: <%= cart.getQuantity() %></h5>
                            <h5 class="card-title">Price: <%= cart.getPrice() %></h5>
                            <h5 class="card-title">Total: <%= cart.getQuantity() * Double.parseDouble(cart.getPrice()) %></h5>
                            <input type="hidden" name="cart_ids" value="<%= cart.getCartId() %>">
                            <button type="submit" name="orderItem" class="btn-order">Order Item</button>
                            <button type="submit" name="deleteItem" class="btn-delete">Delete Item</button>
                        </div>
                    </div>
                </div>
                <% 
                        } // end of if
                    } // end of for loop
                %>
                <div class="col-md-12">
                    <h1 class="total-price">Total Price: <%= totalPrice %></h1>
                    <button type="submit" name="orderAll" class="btn-order">Order All Items</button>
                </div>
            </form>
            <% } else { %>
            <div class="col-md-12">
                <div class="alert alert-secondary" role="alert">
                    No items in the cart
                </div>
            </div>
            <% } %>
        </div>
    </div>
<jsp:include page="footer.jsp"></jsp:include>

    <script>
        document.getElementById("orderAllForm").addEventListener("submit", function(event) {
            var confirmOrder = confirm("Are you sure you want to order all items?");
            if (!confirmOrder) {
                event.preventDefault();
            }
        });
    </script>
</body>
</html>
