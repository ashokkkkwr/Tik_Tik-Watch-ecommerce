<%@ include file="home.jsp" %>
<%@ page import="model.ProductsModel" %>
<%@ page import="java.util.List" %>

<div class="container mt-5">
    <h1 class="mb-4">Registered Users</h1>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Product Name </th>
                <th scope="col">product Description</th>
                <th scope="col">product Category</th>
                <th scope="col">product Price</th>
                <th scope="col">product Availability</th>
                <th scope="col">product model</th>
                <th scope="col">product size</th>
                <th scope="col">product color</th>
                <th scope="col">product dial shape</th>
                <th scope="col">product Compatible os</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<ProductsModel> products = (List<ProductsModel>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (ProductsModel product : products) {
            %>
            <tr>
                <td><%= product.getProductName() %></td>
                <td><%= product.getProductDescription() %></td>
                <td><%= product.getProductCategory() %></td>
                <td><%= product.getProductPrice() %></td>
                <td><%= product.getProductAvailability() %></td>
                <td><%= product.getProductModels() %></td>
                <td><%= product.getProductSize() %></td>
                <td><%= product.getProductColor() %></td>
                <td><%= product.getProductDialShape() %></td>
                <td><%= product.getProductCompatibleOs() %></td>
                <td>
          <button class="edit-btn">Edit</button>
          <button class="delete-btn">Delete</button>
        </td>
            </tr>
            <% 
                }
            } else { 
            %>
            <tr>
                <td colspan="3">No products found</td>
            </tr>
            <% 
            } 
            %>
        </tbody>
    </table>
</div>
