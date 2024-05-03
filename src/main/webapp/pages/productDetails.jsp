<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Description</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/styles.css">
</head>
<body>

<div class="container">
    <h1 class="heading">Product Description</h1>
    <div class="content">
        <p><%= request.getParameter("description") %></p>
    </div>
</div>

</body>
</html>
