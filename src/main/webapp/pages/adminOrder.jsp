<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="model.OrderModel" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Accept Orders</title>
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

        .btn-accept {
            background-color: orange;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-accept:hover {
            background-color: #FF8C00;
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
<jsp:include page="adminHeader.jsp"></jsp:include>
<h1>Accept Orders</h1>

<div class="container "style="margin-top:10vh;">
    <form id="acceptOrderForm" action="${pageContext.request.contextPath}/AdminOrder" method="post">
        <%
        List<OrderModel> orders = (List<OrderModel>) request.getAttribute("AdminOrder");
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
                <h5 class="card-title">UserName: <%= order.getUserName() %></h5>
                <h5 class="card-title">UserName: <%= order.getEmail() %></h5>
                
                <% if (order.getOrderStatus() == 0) { %>
                    <h5 class="card-title">Order Status: Pending</h5>
                <% } else if (order.getOrderStatus() == 1) { %>
                    <h5 class="card-title">Order Status: Already Received</h5>
                <% } else { %>
                    <h5 class="card-title">Order Status: <%= order.getOrderStatus() %></h5>
                <% } %>
                <% if (order.getOrderStatus() != 1) { %>
                    <button type="submit" name="acceptOrder_<%= order.getOrderId() %>" value="<%= order.getOrderId() %>" class="btn-accept">Confirm Order</button>
                <% } %>
                <input type="hidden" name="order_id" value="<%= order.getOrderId() %>">
                <input type="hidden" name="order_status" value="1">
            </div>
        </div>
        <%
            } // end of for loop
        } // end of if
        %>
    </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
