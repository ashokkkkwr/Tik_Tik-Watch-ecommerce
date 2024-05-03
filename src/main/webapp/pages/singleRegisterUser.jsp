<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.UsersModel" %>
<%@ page import="java.util.List" %>
<jsp:include page="adminHeader.jsp"></jsp:include>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<h1>single registered user</h1>
<div class="container mt-5">
    <h1 class="mb-4">Registered User Details</h1>

    <div class="row">
    
        <%
        List<UsersModel> users = (List<UsersModel>) request.getAttribute("loggedInUser");
        if (users != null && !users.isEmpty()) {
            for (UsersModel user : users) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <img class="card-img-top img-fluid" style="max-width: 100px; height: auto;"
                     src="${pageContext.request.contextPath}/images/<%= user.getImageUrlFromPart() %>" alt="User Image">
                <div class="card-body">
                    <h5 class="card-title"><%= user.getEmail() %></h5>
                    <p class="card-text"><i class="fas fa-map-marker-alt"></i> <%= user.getLocation() %></p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" class="btn btn-sm btn-primary" role="button"><i class="fas fa-edit"></i> Edit</a>
                        <a href="#" class="btn btn-sm btn-danger" role="button"><i class="fas fa-trash-alt"></i> Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <% 
            } // end of for loop
        } else { %>
        <div class="col-md-12">
            <div class="alert alert-secondary" role="alert">
                No user found
            </div>
        </div>
        <% } %>
    </div>
</div>


</body>
</html>
