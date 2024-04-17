<%@ include file="home.jsp" %>
<%@ page import="model.UsersModel" %>
<%@ page import="java.util.List" %>

<div class="container mt-5">
    <h1 class="mb-4">Registered Users</h1>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Email</th>
                <th scope="col">Location</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<UsersModel> users = (List<UsersModel>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
                for (UsersModel user : users) {
            %>
            <tr>
                <td><%= user.getEmail() %></td>
                <td><%= user.getLocation() %></td>
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
                <td colspan="3">No users found</td>
            </tr>
            <% 
            } 
            %>
        </tbody>
    </table>
</div>
