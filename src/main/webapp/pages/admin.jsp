<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <jsp:include page="adminHeader.jsp"></jsp:include>  

-




    <form action="${pageContext.request.contextPath}/ProductServlet" method="post">
        <div>
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="prod_name" required>
        </div>
        <div>
            <label for="productDescription">Product Description:</label>
            <input type="text" id="productDescription" name="prod_description" required>
        </div>
        <div>
            <label for="productCategory">Product Category:</label>
            <input type="text" id="productCategory" name="prod_category" required>
        </div>
        <div>
            <label for="productPrice">Product Price:</label>
            <input type="number" id="productPrice" name="prod_price" required>
        </div>
        <div>
            <label for="productAvailability">Product Availability:</label>
            <input type="text" id="productAvailability" name="prod_availability" required>
        </div>
        <button type="submit">Add Product</button>
    </form>

    <jsp:include page="welcome.jsp"></jsp:include>

</body>
</html>