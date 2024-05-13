<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<!-- Code for font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Code for font awesome cdn -->
<!-- Code for linking css file -->
<!-- code for boxicons  -->
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<!-- code for boxicons  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/admin.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/allProducts.css">
</head>
<body>
<jsp:include page="adminHeader.jsp"></jsp:include>
<main>
    <div class="container">
        <h2>Welcome, Admin!</h2>
        <p class="message">Items can be added or deleted by the admin.</p>
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
            <button type="submit" class="logout-btn">Log Out</button>
        </form>
    </div>
</main>

<!-- Script to call GetUsers servlet -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
