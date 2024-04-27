
	<header class="header">
	<a href="admin.jsp" class="logo">TIK<span>TIK.</span></a>
	<nav class="navbar">
					<a href="${pageContext.request.contextPath}/pages/admin.jsp">Home</a>
				<a href="${pageContext.request.contextPath}/UsersServlet">Edit users</a>
				<a href="${pageContext.request.contextPath}/ProductsServlet">View Products</a>
				<a href="${pageContext.request.contextPath}/pages/addProduct.jsp">Add Product</a>
	
	
	</nav>
			 <div class="icons">
            <div class="fa fa-user" id="user-btn" onclick="menuToggle();"></div>
            <!-- Sub Menu for the user icon -->
            <ul class="menu-items">
                <li><img src="" alt=""><a href="profile.html">View Profile</a></li>
                <li><img src="" alt=""><a href="#">Edit Profile</a></li>
                <li><img src="" alt=""><a href="#">Log Out</a></li>
            </ul>
        </div>
      
		</header>

