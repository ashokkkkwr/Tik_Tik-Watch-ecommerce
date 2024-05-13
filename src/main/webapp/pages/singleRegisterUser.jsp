<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.UsersModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <title>Shopping Cart</title>
     <!-- Code for font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   

    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<style>
    #updateModal {
        display: none;
    }
    body{
    
    }
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
   
    
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/user.css">
</head>
<body>

 <!-- Header Section Starts -->

    <header class="header">
        <a href="index.html" class="logo"style="text-decoration:none;">TIK<span>TIK.</span></a>
        <nav class="navbar">
           <a href="${pageContext.request.contextPath}/pages/home.jsp"style="text-decoration:none;">
    <i class="fas fa-home"></i> Home
</a>

           <a href="${pageContext.request.contextPath}/CartServlet"style="text-decoration:none;">            <div class="fa fa-shopping-cart" id="cart-btn"></div>
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
        <div class="fa fa-user" id="user-btn" onclick="menuToggle();"Style="color:orange"></div>
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





<div class="profile-container"style="margin-top:15vh;">
    <div class="row" >
        <%
        List<UsersModel> users = (List<UsersModel>) request.getAttribute("loggedInUser");
        if (users != null && !users.isEmpty()) {
            for (UsersModel user : users) {
        %>
        <div class="profile-header">
            <div class="profile-image">
                <img class="card-img-top img-fluid" style="max-width: 100px; height: auto;"
                         src="${pageContext.request.contextPath}/images/<%= user.getImageUrlFromPart() %>" alt="User Image">
            </div>
            <div class="profile-info">
                <h1><%= user.getUserName() %></h1>
                <p class="location">Dharan, Sunsari</p>
                <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
                   <button type="submit" class="log-out">Log out</button>
                </form>
            </div>
        </div>
        
        <div class="profile-content">
            <div class="bio">
                <h2>Welcome to your profile!</h2>
                <div class="form-group">
                    Username: <%= user.getUserName() %>
                </div>
                <div class="form-group">
                    Email: <%= user.getEmail() %>
                </div>
                <div class="form-group">
                    Address: <%= user.getLocation() %>
                </div>
                <div class="form-group">
                    Phone Number: <%= user.getPhone() %>
                </div>
               <div style="margin-top:60px;"></div>
                <div class="form-actions">
                    <button class="edit" type="button" onclick="populateUpdateModal('<%= user.getUserId() %>','<%=user.getUserName()%>','<%= user.getEmail() %>','<%= user.getLocation() %>','<%= user.getPhone() %>','Hello')">Edit Profile
                    </button>
                </div>
            </div>
        </div>

        <div id="updateModal" style="display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.4);" tabindex="-1" role="dialog">
            <div style="display: table; width: 100%; height: 100%;">
                <div style="display: table-cell; vertical-align: middle;">
                    <div style="background-color: #fefefe; margin: auto; padding: 20px; border: 1px solid #888; width: 80%;">
                        <div style="text-align: right;">
                            <span style="cursor: pointer;" onclick="document.getElementById('updateModal').style.display='none';">&times;</span>
                        </div>
                        <h5 style="text-align: center;">Update Users Details Form</h5>
                        <form id="updateForm" action="${pageContext.request.contextPath}/CrudUserServlet" method="post" enctype="multipart/form-data" style="margin-top: 20px;">
                            <input type="hidden" id="updateId" name="updateId">
                            <div style="margin-bottom: 15px;">
                                <label for="userName" style="display: inline-block; width: 100px;">UserName</label>
                                <input type="text" id="userName" name="userName" style="width: calc(100% - 110px); padding: 5px;">
                            </div>
                            <div style="margin-bottom: 15px;">
                                <label for="email" style="display: inline-block; width: 100px;">Email</label>
                                <input type="text" id="email" name="email" style="width: calc(100% - 110px); padding: 5px;">
                            </div>
                            <div style="margin-bottom: 15px;">
                                <label for="location" style="display: inline-block; width: 100px;">Location</label>
                                <input type="text" id="location" name="location" style="width: calc(100% - 110px); padding: 5px;">
                            </div>
                            <div style="margin-bottom: 15px;">
                                <label for="phone" style="display: inline-block; width: 100px;">Phone</label>
                                <input type="text" id="phone" name="phone" style="width: calc(100% - 110px); padding: 5px;">
                            </div>
                            <div style="margin-bottom: 15px;">
                                <label for="image" style="display: inline-block; width: 100px;">Image</label>
                                <input type="file" id="image" name="image" style="padding: 5px;">
                            </div>
                            <div style="text-align: center; margin-top: 20px;">
                                <button type="button" onclick="document.getElementById('updateModal').style.display='none';" style="padding: 10px 20px; background-color: #ddd; border: none; cursor: pointer; margin-right: 10px;">Close</button>
                                <button type="button" onclick="updateProduct()" style="padding: 10px 20px; background-color: #007bff; border: none; color: white; cursor: pointer;">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
          
        <div class="contact-info">
            <h2>Contact Information</h2>
            <div class="info-group">
              <h3>Shipping Address</h3>
             <p><%= user.getLocation() %></p>
            </div>
            <div class="info-group">
              <h3>Phone Number</h3>
              <p><%= user.getPhone() %></p>
            </div>
        </div>
        <div class="profile-sidebar">
            <div class="ad-section">
                <h2>Ad</h2>
                <p>This is an advertisement section.</p>
            </div>
        </div>
    </div>
    <% 
        } // end of for loop
    } else { %>
    <div class="col-md-12">
        <div class="alert alert-secondary" role="alert">
            No user found
        </div>
    </div>
    <% } %>
</div>
<script>
function populateUpdateModal(id, userName, email, location, phone) {
    document.getElementById('updateId').value = id;
    document.getElementById('userName').value = userName;
    document.getElementById('email').value = email;
    document.getElementById('location').value = location;
    document.getElementById('phone').value = phone;
    document.getElementById('updateModal').style.display = "block"; // Show the modal
}
function updateProduct() {
    document.getElementById('updateForm').submit();
}
</script>
</body>
</html>

