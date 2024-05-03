<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/styles.css">

<%@ page import="model.ProductsModel" %>
<%@ page import="java.util.List" %>

<div class="container">
    <h1 class="heading">Best of our products.</h1>
    <p>Our most popular product among the customers.</p>

    <div class="box-container">
        <% 
        List<ProductsModel> products = (List<ProductsModel>) request.getAttribute("products1");
        if (products != null && !products.isEmpty()) {
            for (ProductsModel product : products) {
        %>

        <div class="box">
            <div class="image">
           
                <img src="${pageContext.request.contextPath}/images/<%= product.getImageUrlFromPart() %>"  alt="watch image">
            </div>
            <div class="content">
                <h3><%= product.getProductName() %>.</h3>
                <p>$<%= product.getProductPrice() %></p>
                <a href="#" class="btn">Cart</a>
                <a href="productDetails.jsp?description=<%= product.getProductDescription() %>" class="btn">View</a>
            </div>
        </div>

        <% 
            }
        } else { 
        %>

        <% 
        } 
        %>
    </div>
</div>
