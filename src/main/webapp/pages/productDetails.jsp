<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="model.UsersModel" %>
   <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Description</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/productDetails.css">
<link rel="icon" type="image/png" href="./assets/image/Main_logo.png">
<link rel="stylesheet" href="./assets/css/index.css">
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/product.css">
</head>
<body>
    <div id="an-MainContent">
        <section class="an-section_breadcrumbs">
            <div class="an-container"></div>
        </section>
        <section class="an-section_product-detail">
            <div class="an-container">
                <div class="an-row an-product_detail-wrapper">
                    <div class="an-row an-product_detail-image">
                        <div class="an-product_main-img"></div>
                        <div class="an-product_thumbnail">
                            <div class="an-product_thumbnail-item active">
                               <img src="${pageContext.request.contextPath}/images/<%= request.getParameter("image") %>" alt="watch image">
                            </div>
                        </div>
                    </div>
                    <div class="text-container">
                        <div class="an-product_detail-info">
                            <h1 class="an-product_title"><%= request.getParameter("name") %></h1>
                            <div class="an-product_price">
                                <span class="an-product_price">Rs. <%= request.getParameter("price") %></span>
                            </div>
                            <div class="an-product_description">Elevate your wristwear with the Ultima Watch Magic Pro. Introducing Watch Magic Pro: A premium smartwatch with a sleek zinc alloy frame, 1.96″ HD display, 100+ sports modes, and more. Stay connected and healthy in style!</div>
                           
                            <div class="an-available_wrapper">
                            
                                Availability:
                                <span class="an-product_meta-value">
                                    <% 
                                        String availability = request.getParameter("availability").trim();
                                        int stock = availability.isEmpty() ? 0 : Integer.parseInt(availability);
                                        if(stock > 0) {
                                            out.print("In Stock");
                                        } else {
                                            out.print("Out of Stock");
                                        }
                                    %>
                                </span>
                                <h2>Product Specification of <%= request.getParameter("name") %></h2>
                                
                            </div>
                        </div>
                    </div>
                </div>
                
                <div style="margin-top:1px;" class="delivery-info">
<div style="display: flex;">
    <div>
        <p><span style="font-size: x-large;">Category:                </span>        <%= request.getParameter("category") %></p>
        <p><span style="font-size: x-large;">Models:                </span> <%= request.getParameter("models") %></p>
        <p><span style="font-size: x-large;">Size:                </span> <%= request.getParameter("size") %></p>
    </div>
    <div style="margin-left:100px;">
        <p><span style="font-size: x-large;">Color:                </span> <%= request.getParameter("color") %></p>
        <p><span style="font-size: x-large;">Dial Shape:                </span> <%= request.getParameter("dialShape") %></p>
        <p><span style="font-size: x-large;">Compatible OS:                </span> <%= request.getParameter("compatibleOs") %></p>
    </div>
</div>
</div>

                <div class="delivery-features">
                    <div class="feature-item">
                        <i class="fa fa-truck"></i>
                        <p>Free Express Delivery</p>
                    </div>
                    <div class="feature-item">
                        <i class="fa fa-refresh"></i>
                        <p>30 Days Replacement Guarantee</p>
                    </div>
                    <div class="feature-item">
                        <i class="fa fa-shield"></i>
                        <p>1 Year Brand Warranty</p>
                    </div>
                </div>
                
                <form id="addToCartForm" action="${pageContext.request.contextPath}/CartServlet" method="post">
                    <input type="hidden" name="prod_id" value="<%= request.getParameter("id") %>">
                  <% 
    List<UsersModel> users = (List<UsersModel>) request.getAttribute("loggedInUser");
    UsersModel user = null;
    if (users != null && !users.isEmpty()) {
        user = users.get(0);
    }
%>
<% if (user != null) { %>
                    <input type="hidden" name="user_id" value="<%= request.getParameter("userId") %>">
<% } %>
<div class="an-row an-product_action" style="margin-left:110vh ">
<span style="color:#ffffff;">Quantity:</span>
<div class="an-product_quantity">
                    <select style="color:#c46506" name="quantity" class="an-quantity_input">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    </div>
                    <div class="an-product_addcart">
                    <button type="submit" class="an-addcart_btn"style="margin-left:19px;margin-top:10px">Add to Cart</button>
                    </div>
                    </div>
                </form>
                
            </div>
        </section>
    </div>
    
    <script>
    <script>
    var userLoggedIn = <%= (user != null) %>;
    if (!userLoggedIn) {
        document.getElementById("addToCartForm").addEventListener("submit", function(event){
            event.preventDefault();
            console.log("Form Submitted!"); // Check if form is being submitted
            window.location.href = "${pageContext.request.contextPath}/pages/login.jsp";
        });
    }
</script>

    </script>
</body>
</html>
