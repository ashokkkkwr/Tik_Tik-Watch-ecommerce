<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>  

    <sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/tik_tik" user="root" password=""/>
    <sql:query var="users" dataSource="${dbConnection}">
        SELECT email, location FROM users
    </sql:query>

    <h1>Registered Students.</h1>
    <table>
        <thead>
            <tr>
                <th>Email</th>
                <th>Location</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users.rows}">
                <tr>
                    <td>${user.email}</td>
                    <td>${user.location}</td>
                    <td>
                        <a href="#">Edit</a>
                        <a href="#">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

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

    <jsp:include page="welcome.jsp"></jsp:include>

    
</body>
</html>
