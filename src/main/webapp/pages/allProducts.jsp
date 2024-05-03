<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/allProducts.css">
<%@ page import="model.ProductsModel" %>
<%@ page import="java.util.List" %>


<jsp:include page="adminHeader.jsp"></jsp:include>  

<div class="container mt-5">
    <h1 class="mb-4">Registered Users</h1>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Product Id </th>

                <th scope="col">Product Name </th>
                <th scope="col">product Description</th>
                <th scope="col">product Category</th>
                <th scope="col">product Price</th>
                <th scope="col">product Availability</th>
                <th scope="col">product model</th>
                <th scope="col">product size</th>
                <th scope="col">product color</th>
                <th scope="col">product dial shape</th>
                <th scope="col">product Compatible os</th>
               <th scope="col">product Image</th>
                
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<ProductsModel> products = (List<ProductsModel>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (ProductsModel product : products) {
            %>
            <tr>
            <td><%=product.getProdId() %></td>
                <td><%= product.getProductName() %></td>
                <td><%= product.getProductDescription() %></td>
                <td><%= product.getProductCategory() %></td>
                <td><%= product.getProductPrice() %></td>
                <td><%= product.getProductAvailability() %></td>
                <td><%= product.getProductModels() %></td>
                <td><%= product.getProductSize() %></td>
                <td><%= product.getProductColor() %></td>
                <td><%= product.getProductDialShape() %></td>
                <td><%= product.getProductCompatibleOs() %></td>
                <td>
                 <img class="card-img-top img-fluid" style="max-width: 100px; height: auto;"
                     src="${pageContext.request.contextPath}/images/<%= product.getImageUrlFromPart() %>" alt="User Image"></td>
                
                
                
                
                
                
                
                
                <td>
               <button class="btn btn-primary btn-sm mr-2 edit-btn" type="button" onclick="populateUpdateModal('<%= product.getProdId() %>','<%=product.getProductName()%>','<%= product.getProductDescription() %>','<%= product.getProductCategory() %>','<%= product.getProductPrice() %>','<%= product.getProductAvailability() %>','<%= product.getProductModels() %>','<%= product.getProductSize() %>','<%= product.getProductColor() %>','<%= product.getProductDialShape() %>','<%= product.getProductCompatibleOs() %>','Hello')">Edit
               </button>
               
    <form id="deleteForm-<%= product.getProductName() %>" action="${pageContext.request.contextPath}/CrudServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="deleteId" value="<%= product.getProdId() %>" />
        <button class="delete-btn" type="button" onclick="confirmDelete('<%= product.getProductName() %>')">Delete</button>
    </form></td>

              
            </tr>
            <% 
                }
            } else { 
            %>
            <tr>
                <td colspan="11">No products found</td>
            </tr>
            <% 
            } 
            %>
        </tbody>
    </table>
</div><div id="updateModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel">Update Product Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateForm" action="${pageContext.request.contextPath}/CrudServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="updateId" name="updateId">
                    <div class="form-group">
                        <label for="productName">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="productName">
                    </div>
                    <div class="form-group">
                        <label for="productDescription">Product Description</label>
                        <input type="text" class="form-control" id="productDescription" name="productDescription">
                    </div>
                    <div class="form-group">
                        <label for="productCategory">Product Category</label>
                        <input type="text" class="form-control" id="productCategory" name="productCategory">
                    </div>
                    <div class="form-group">
                        <label for="productPrice">Product Price</label>
                        <input type="number" class="form-control" id="productPrice" name="productPrice">
                    </div>
                    <div class="form-group">
                        <label for="productAvailability">Product Availability</label>
                        <input type="text" class="form-control" id="productAvailability" name="productAvailability">
                    </div>
                    <div class="form-group">
                        <label for="productModel">Product Model</label>
                        <input type="text" class="form-control" id="productModel" name="productModel">
                    </div>
                    <div class="form-group">
                        <label for="productSize">Product Size</label>
                        <input type="text" class="form-control" id="productSize" name="productSize">
                    </div>
                    <div class="form-group">
                        <label for="productColor">Product Color</label>
                        <input type="text" class="form-control" id="productColor" name="productColor">
                    </div>
                    <div class="form-group">
                        <label for="productDialShape">Product Dial Shape</label>
                        <input type="text" class="form-control" id="productDialShape" name="productDialShape">
                    </div>
                    <div class="form-group">
                        <label for="productCompatibleOs">Product Compatible Os</label>
                        <input type="text" class="form-control" id="productCompatibleOs" name="productCompatibleOs">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="updateProduct()">Save Changes</button>
            </div>
        </div>
    </div>
</div>
<script>
    function confirmDelete(productName) {
        if (confirm("Are you sure you want to delete this product: " + productName + "?")) {
            document.getElementById("deleteForm-" + productName).submit();
        }
    }

    function populateUpdateModal(id, productName, productDescription, productCategory, productPrice, productAvailability, productModel, productSize, productColor, productDialShape, productCompatibleOs) {
        document.getElementById('updateId').value = id;
        document.getElementById('productName').value = productName;
        document.getElementById('productDescription').value = productDescription;
        document.getElementById('productCategory').value = productCategory;
        document.getElementById('productPrice').value = productPrice;
        document.getElementById('productAvailability').value = productAvailability;
        document.getElementById('productModel').value = productModel;
        document.getElementById('productSize').value = productSize;
        document.getElementById('productColor').value = productColor;
        document.getElementById('productDialShape').value = productDialShape;
        document.getElementById('productCompatibleOs').value = productCompatibleOs;

        document.getElementById('updateModal').style.display = "block"; // Show the modal
    }

    function updateProduct() {
        document.getElementById('updateForm').submit();
    }
</script>


