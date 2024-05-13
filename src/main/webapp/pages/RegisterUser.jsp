<%@ page import="model.UsersModel" %>
<%@ page import="java.util.List" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/allProducts.css">
  <jsp:include page="adminHeader.jsp"></jsp:include>  

<div class="container mt-5">
    <h1 class="mb-4">Registered Users</h1>

    <div class="row">
        <%
        List<UsersModel> users = (List<UsersModel>) request.getAttribute("users");
        if (users != null && !users.isEmpty()) {
            for (UsersModel user : users) {
        %>

        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
            <h5 class="card-title"><%= user.getUserName() %></h5>
             <h5 class="card-title"><%= user.getEmail() %></h5>
           <h5 class="card-title"><%= user.getLocation() %></h5>
           <h5 class="card-title"><%= user.getPhone() %></h5>
                <img class="card-img-top img-fluid" style="max-width: 100px; height: auto;"
                     src="${pageContext.request.contextPath}/images/<%= user.getImageUrlFromPart() %>" alt="User Image">
                <div class="card-body">
                    <p class="card-text"><i class="fas fa-map-marker-alt"></i> <%= user.getLocation() %></p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-sm btn-primary" role="button"><i class="fas fa-edit"></i> Edit</a>
                        <a href="#" class="btn btn-sm btn-danger" role="button"><i class="fas fa-trash-alt"></i> Delete</a>
                    </div>
                </div>
            </div>
        </div>

        <%
            }
        } else {
        %>

        <div class="col-md-12">
            <div class="alert alert-secondary" role="alert">
                No users found
            </div>
        </div>

        <%
        }
        %>
    </div>
</div>


