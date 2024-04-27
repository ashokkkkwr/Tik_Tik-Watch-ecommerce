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
    <link rel="stylesheet" href="header.css">
    <!-- Code for linking css file -->

    <!-- code for boxicons  -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <!-- code for boxicons  -->

    <!-- CSS for the View Products page -->
    <link rel="stylesheet" href="style.css">
    <!-- CSS for the View Products page -->
</head>

<body>
  <jsp:include page="adminHeader.jsp"></jsp:include>  

<main>
<section class="add-product">
<h2>Add new Product</h2>
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

   
</section>
</main>



</body>
</html>