<!-- cart.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
</head>
<body>

<h1>Shopping Cart</h1>

<table border="1">
    <tr>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total</th>
        <th>Action</th>
    </tr>
    <!-- Loop through cart items -->
    <%-- <c:forEach var="cartItem" items="${cartItems}">
        <tr>
            <td>${cartItem.productName}</td>
            <td>${cartItem.price}</td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="updateCart">
                    <input type="hidden" name="productId" value="${cartItem.productId}">
                    <input type="number" name="quantity" value="${cartItem.quantity}" min="1">
                    <input type="submit" value="Update">
                </form>
            </td>
            <td>${cartItem.total}</td>
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="removeFromCart">
                    <input type="hidden" name="productId" value="${cartItem.productId}">
                    <input type="submit" value="Remove">
                </form>
            </td>
        </tr>
    </c:forEach> --%>
</table>

</body>
</html>
