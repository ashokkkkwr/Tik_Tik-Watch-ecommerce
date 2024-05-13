<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="util.StringUtils" %>
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
    <!-- Code for font awesome cdn -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/header.css">

   

   
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
   

    <!-- CSS for the View Products page -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/addProduct.css">
    
</head>

<body>
  <jsp:include page="adminHeader.jsp"></jsp:include>  

<main>
<section class="add-product">
<h2>Add new Product</h2>
 <form action="${pageContext.request.contextPath}/ProductServlet" method="post" enctype="multipart/form-data">
        <div class="input-group">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="prod_name" required>
        </div>
       <div class="input-group">
            <label for="productDescription">Product Description:</label>
            <input type="text" id="productDescription" name="prod_description" required>
        </div>
        <div class="input-group">
            <label for="productCategory">Product Category:</label>
            <input type="text" id="productCategory" name="prod_category" required>
        </div>
        <div class="input-group">
            <label for="productPrice">Product Price:</label>
            <input type="number" id="productPrice" name="prod_price" required>
        </div>
        <div class="input-group">
            <label for="productStock">Product Stock:</label>
            <input type="text" id="productStock" name="prod_stock" required>
        </div>
         <div class="input-group">
            <label for="productModel">Product Model:</label>
            <input type="text" id="productModel" name="prod_model" required>
        </div>
        <div class="input-group">
            <label for="productSize">Product size:</label>
            <input type="text" id="productSize" name="prod_size" required>
        </div>
        <div class="input-group">
            <label for="productColor">Product Color:</label>
            <input type="text" id="productColor" name="prod_color" required>
        </div>
        <div class="input-group">
            <label for="productDialShape">Product Dial Shape:</label>
            <input type="text" id="productDialShape" name="prod_dial_shape" required>
        </div>
         <div class="input-group">
            <label for="productCompatibleOs">Product Compatible Os:</label>
            <input type="text" id="productCompatibleOs" name="prod_compatible_os" required>
        </div> 
        <div class="input-group">
	<label for="image">Profile Picture</label> <input type="file" id="image" name="image">
	</div>   
        <div class="input-group">
        <button type="submit" class="add-btn">Add Product</button>
        </div>
        
    
    </form>
     <% 
        String successMessage = (String) request.getAttribute(StringUtils.SUCCESS_MESSAGE);
        String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE);

        if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
        <!-- Display error message -->
         <div class="alert alert-danger mt-2" role="alert">
            <%= errorMessage %>
        </div>
        <% } %>

        <% 
        if (successMessage != null && !successMessage.isEmpty()) {
        %>
        <!-- Display success message -->
        <div class="alert alert-success mt-2" role="alert">
            <%= successMessage %>
        </div>
        <% } %>
    

</section>
</main>
<jsp:include page="footer.jsp"></jsp:include>



</body>
</html>