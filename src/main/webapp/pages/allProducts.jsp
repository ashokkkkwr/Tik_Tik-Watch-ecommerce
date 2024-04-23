<%@ include file="home.jsp" %>
<%@ page import="model.ProductsModel" %>
<%@ page import="java.util.List" %>

<div class="container mt-5">
    <h1 class="mb-4">Registered Users</h1>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Product </th>
                <th scope="col">Location</th>
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
                <td>
                    <a href="#" class="btn btn-primary btn-sm mr-2" role="button"><i class="fas fa-edit"></i> Edit</a>
                    <a href="#" class="btn btn-danger btn-sm" role="button"><i class="fas fa-trash-alt"></i> Delete</a>
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
