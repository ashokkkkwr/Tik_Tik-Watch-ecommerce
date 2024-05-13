<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.UsersModel" %>
<%@page import="util.StringUtils" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TikTik</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   

  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/aboutUs.css">
  <script>
    function showSuccessMessage() {
      alert("Your message has been sent successfully!");
    }
  </script>
  <style>
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
           
         <a href="${pageContext.request.contextPath}/pages/aboutUs.jsp"style="text-decoration:none;color: orange;">
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




  <main >
    <div class="about-us">
      <h2>About Us</h2>
      <p>Welcome to TIKTIK, your ultimate destination for the latest smartwatches! At TIKTIK, we are passionate about providing our customers with the best selection of high-quality smartwatches at affordable prices.</p>
      <p>Our journey began with a simple idea: to make cutting-edge wearable technology accessible to everyone. Since our inception, we have been dedicated to curating a diverse range of smartwatches from leading brands around the world.</p>
      <p>What sets us apart is our commitment to customer satisfaction. We strive to offer exceptional customer service and a seamless shopping experience. Whether you're a fitness enthusiast, a tech-savvy individual, or someone looking for a stylish accessory, we have the perfect smartwatch for you.</p>
      <p>Explore our collection today and join the TIKTIK family!</p>
      <h3>Want To Know More?</h3>
      <p>Follow us here:</p>
      <span class="social-icon"><i class="bx bxl-facebook-circle"></i></span>
      <span class="social-icon"><i class="bx bxl-instagram-alt"></i></span>
      <span class="social-icon"><i class="bx bxl-twitter"></i></span>
      <div class="privacy">
        <h2> Privacy and Security:</h2>
        <p>At TIKTIK, safeguarding the security and privacy of our customers is of utmost importance to us. We are dedicated to ensuring that your personal information remains protected and confidential throughout your shopping experience with us. Our commitment to security begins with implementing robust encryption protocols to secure all transactions made on our platform. We adhere strictly to industry standards to safeguard your payment information, ensuring that your credit card details are shielded from unauthorized access.</p>
      </div>
    </div>
    <div style="margin-top:10vh;" class="contact-form">
      <h2>Contact Us</h2>
      <form action="${pageContext.request.contextPath}/ContactUsServlet" method="post" onsubmit="showSuccessMessage()">
        <input type="text" placeholder="Email" name="user_email" required>
        <input type="text" placeholder="Phone" name="user_phone" required>
        <input type="text" placeholder="Message" name="message" required>
        <button style="margin-left:50px;" type="submit">Send Message</button>
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
  </main>
<jsp:include page="footer.jsp"></jsp:include>

  
</body>
</html>
