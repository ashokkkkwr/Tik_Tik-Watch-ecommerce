<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/allProducts.css">
<%@ page import="model.AboutUsModel" %>
<%@ page import="java.util.List" %>
<style>
    #updateModal {
        display: none;
    }
</style>

<jsp:include page="adminHeader.jsp"></jsp:include>  

<div class="container mt-5">
    <h1 class="mb-4">All Products</h1>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Email </th>
                <th scope="col">Phone Number </th>
                <th scope="col"> Message</th>
                
                
            </tr>
        </thead>
        <tbody>
            <% 
            List<AboutUsModel> contacts = (List<AboutUsModel>) request.getAttribute("contacts");
            if (contacts != null && !contacts.isEmpty()) {
                for (AboutUsModel contact : contacts) {
            %>
            <tr>
                <td><%=contact.getUserEmail() %></td>
                <td><%= contact.getUserPhone() %></td>
                <td><%= contact.getMessage() %></td>

                
            </tr>
            <% 
                }
            } else { 
            %>
            <tr>
                <td colspan="12">No products found</td>
            </tr>
            <% 
            } 
            %>
        </tbody>
    </table>
</div>
