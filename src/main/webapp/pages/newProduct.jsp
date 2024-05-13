<%@ page import="model.ProductsModel" %>
<%@ page import="java.util.List" %>
<%@ page import="model.UsersModel" %>
<div class="container">
    <h1 class="heading">Best of our products.</h1>
    <p>Our most popular product among the customers.</p>

<div class="box-container">
    <%
    List<ProductsModel> products = (List<ProductsModel>) request.getAttribute("products1");
    List<UsersModel> users = (List<UsersModel>) request.getAttribute("loggedInUser");
    UsersModel user = null;
    if (users != null && !users.isEmpty()) {
        user = users.get(0);
    }
    for (ProductsModel product : products) {
    %>

    <div class="box">
        <div class="image">
            <img src="${pageContext.request.contextPath}/images/<%= product.getImageUrlFromPart() %>" alt="watch image">
        </div>
        <div class="content">
            <h3><%= product.getProductName() %>.</h3>
            <p>Price: $<%= product.getProductPrice() %></p>
            <form id="addToCartForm_<%= product.getProdId() %>" action="${pageContext.request.contextPath}/CartServlet" method="post">
                <input type="hidden" name="prod_id" value="<%= product.getProdId() %>">
                <% if (user != null) { %>
                <input type="hidden" name="user_id" value="<%= user.getUserId() %>">
                <% } %>
                <select  name="quantity">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
               
                <button type="button" class="btn" onclick="addToCart('<%= product.getProdId() %>')">Add</button>
            </form>
            
            <div style="margin-left:4vh; margin-top:5px;">
    <a href="${pageContext.request.contextPath}/pages/productDetails.jsp?userId=${user.userId}&id=<%= product.getProdId() %>&name=<%= product.getProductName() %>&description=<%= product.getProductDescription() %>&category=<%= product.getProductCategory() %>&price=<%= product.getProductPrice() %>&availability=<%= product.getProductStock() %>&models=<%= product.getProductModels() %>&size=<%= product.getProductSize() %>&color=<%= product.getProductColor() %>&dialShape=<%= product.getProductDialShape() %>&compatibleOs=<%= product.getProductCompatibleOs() %>&image=<%= product.getImageUrlFromPart() %>" class="btn">View</a>
</div>

        </div>
    </div>

    <% 
    }
    %>
</div>

</div>


<script>
    function addToCart(prodId) {
        var userLoggedIn = <%= (user != null) %>;
        if (!userLoggedIn) {
            window.location.href = "${pageContext.request.contextPath}/pages/login.jsp";
        } else {
            document.getElementById("addToCartForm_" + prodId).submit();
        }
    }
</script>
