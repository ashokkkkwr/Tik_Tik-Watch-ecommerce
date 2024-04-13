<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="dbConnection" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/tik_tik" user="root" password=""/>
	<sql:query var="users" dataSource="${dbConnection}">
	SELECT email,location from users
	</sql:query>
<h1>Registered Students.</h1>
<table>
<thead>

<tr>
<th>email</th>
<th>location</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
  <c:forEach var="users" items="${users.rows}">
  <tr>
  <td>${users.email }</td>
   <td>${users.location }</td>
  <td>
  <a href="#">Edit</a>
    <a href="#">Delete</a>
  
  </td>
  </tr>
  
  
  </c:forEach>

</tbody>
</table>
</body>
</html>

