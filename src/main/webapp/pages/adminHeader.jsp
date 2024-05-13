<header class="header">
    <a href="admin.jsp" class="logo">TIK<span>TIK.</span></a>
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/pages/admin.jsp" id="admin">Home</a>
        <a href="${pageContext.request.contextPath}/ProductsServlet" id="view-products">View Products</a>
        <a href="${pageContext.request.contextPath}/pages/addProduct.jsp" id="add">Add Product</a>
        <a href="${pageContext.request.contextPath}/AdminOrder"id="order">Orders</a>
        <a href="${pageContext.request.contextPath}/AllContacts">Contacts</a>
    </nav>
    <div class="icons">
        <a href="${pageContext.request.contextPath}/GetUsers">
            <div class="fa fa-user" id="user-btn" onclick="menuToggle();"></div>
        </a>
        <!-- Sub Menu for the user icon -->
        <ul class="menu-items">
            <li><img src="" alt=""><a href="profile.html">View Profile</a></li>
            <li><img src="" alt=""><a href="#">Edit Profile</a></li>
            <li><img src="" alt=""><a href="#">Log Out</a></li>
        </ul>
    </div>
</header>

<script>
    // Get the current URL
    var currentURL = window.location.href;

    // If the current URL contains "ProductsServlet", make the "Add Product" link orange
    if (currentURL.includes("ProductsServlet")) {
        document.getElementById("view-products").style.color = "orange";
    }
    if (currentURL.includes("admin.jsp")) {
        document.getElementById("admin").style.color = "orange";
    }
    if (currentURL.includes("LoginServlet")) {
        document.getElementById("admin").style.color = "orange";
    }
    if (currentURL.includes("addProduct.jsp")) {
        document.getElementById("add").style.color = "orange";
    }
    if (currentURL.includes("AdminOrder")) {
        document.getElementById("order").style.color = "orange";
    }
</script>
