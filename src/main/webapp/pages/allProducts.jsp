<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/pages/styles/allProducts.css">
<%@ page import="model.ProductsModel" %>
<%@ page import="java.util.List" %>
<style>
    #updateModal {
        display: none;
    }
</style>

<jsp:include page="adminHeader.jsp"></jsp:include>  

<div class="container mt-5">
    <h1 class="mb-4">All Products</h1>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Product Id </th>
                <th scope="col">Product Name </th>
                <th scope="col">Product Description</th>
                <th scope="col">Product Category</th>
                <th scope="col">Product Price</th>
                <th scope="col">Product Availability</th>
                <th scope="col">Product Model</th>
                <th scope="col">Product Size</th>
                <th scope="col">Product Color</th>
                <th scope="col">Product Dial Shape</th>
                <th scope="col">Product Compatible Os</th>
                <th scope="col">Product Image</th>
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
                <td><%= product.getProductStock() %></td>
                <td><%= product.getProductModels() %></td>
                <td><%= product.getProductSize() %></td>
                <td><%= product.getProductColor() %></td>
                <td><%= product.getProductDialShape() %></td>
                <td><%= product.getProductCompatibleOs() %></td>
                <td>
                    <img class="card-img-top img-fluid" style="max-width: 100px; height: auto;"
                         src="${pageContext.request.contextPath}/images/<%= product.getImageUrlFromPart() %>" alt="Product Image">
                </td>
                <td>
                    <button class="btn btn-primary btn-sm mr-2 edit-btn" type="button" onclick="populateUpdateModal('<%= product.getProdId() %>','<%=product.getProductName()%>','<%= product.getProductDescription() %>','<%= product.getProductCategory() %>','<%= product.getProductPrice() %>','<%= product.getProductStock() %>','<%= product.getProductModels() %>','<%= product.getProductSize() %>','<%= product.getProductColor() %>','<%= product.getProductDialShape() %>','<%= product.getProductCompatibleOs() %>','Hello')">Edit
                    </button>
                    <form id="deleteForm-<%= product.getProductName() %>" action="${pageContext.request.contextPath}/CrudServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="deleteId" value="<%= product.getProdId() %>" />
                        <button class="delete-btn" type="button" onclick="confirmDelete('<%= product.getProductName() %>')">Delete</button>
                    </form>
                </td>
            </tr>
            <% 
                }
            } else { 
            %>
            <tr>
                <td colspan="12">No products found</td>
            </tr>
            <% 
            } 
            %>
        </tbody>
    </table>
</div>
<div id="updateModal" style="display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.4);" tabindex="-1" role="dialog">
    <div style="display: table; width: 100%; height: 100%;">
        <div style="display: table-cell; vertical-align: middle;">
            <div style="background-color: #fefefe; margin: auto; padding: 20px; border: 1px solid #888; width: 80%;">
                <div style="text-align: right;">
                    <span style="cursor: pointer;" onclick="document.getElementById('updateModal').style.display='none';">&times;</span>
                </div>
                <h5 style="text-align: center;">Update Product Details</h5>
                <form id="updateForm" action="${pageContext.request.contextPath}/CrudServlet" method="post" enctype="multipart/form-data" style="margin-top: 20px;">
                    <input type="hidden" id="updateId" name="updateId">
                    <div style="margin-bottom: 15px;">
                        <label for="productName" style="display: inline-block; width: 150px;">Product Name</label>
                        <input type="text" id="productName" name="productName" style="width: calc(100% - 160px); padding: 8px; border: 1px solid black;">
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label for="productDescription" style="display: inline-block; width: 150px;">Product Description</label>
                        <input type="text" id="productDescription" name="productDescription" style="width: calc(100% - 160px); padding: 8px; border: 1px solid black;">
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label for="productCategory" style="display: inline-block; width: 150px;">Product Category</label>
                        <input type="text" id="productCategory" name="productCategory" style="width: calc(100% - 160px); padding: 8px; border: 1px solid black;">
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label for="productPrice" style="display: inline-block; width: 150px;">Product Price</label>
                        <input type="number" id="productPrice" name="productPrice" style="width: calc(100% - 160px); padding: 8px; border: 1px solid black;">
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label for="productStock" style="display: inline-block; width: 150px;">Product Stock</label>
                        <input type="text" id="productStock" name="productStock" style="width: calc(100% - 160px); padding: 8px; border: 1px solid black;">
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label for="productModel" style="display: inline-block; width: 150px;">Product Model</label>
                        <input type="text" id="productModel" name="productModel" style="width: calc(100% - 160px); padding: 8px; border: 1px solid black;">
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label for="productSize" style="display: inline-block; width: 150px;">Product Size</label>
                        <input type="text" id="productSize" name="productSize" style="width: calc(100% - 160px); padding: 8px; border: 1px solid black;">
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label for="productColor" style="display: inline-block; width: 150px;">Product Color</label>
                        <input type="text" id="productColor" name="productColor" style="width: calc(100% - 160px); padding: 8px; border: 1px solid black;">
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label for="productDialShape" style="display: inline-block; width: 150px;">Product Dial Shape</label>
                        <input type="text" id="productDialShape" name="productDialShape" style="width: calc(100% - 160px); padding: 8px; border: 1px solid black;">
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label for="productCompatibleOs" style="display: inline-block; width: 150px;">Product Compatible Os</label>
                        <input type="text" id="productCompatibleOs" name="productCompatibleOs" style="width: calc(100% - 160px); padding: 8px; border: 1px solid black;">
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label for="image" style="display: inline-block; width: 150px;">Image</label>
                        <input type="file" id="image" name="image" style="padding: 5px; border: 1px solid black;">
                    </div>
                    <div style="text-align: center; margin-top: 20px;">
                        <button type="button" onclick="document.getElementById('updateModal').style.display='none';" style="padding: 10px 20px; background-color: #ddd; border: none; cursor: pointer; margin-right: 10px;">Close</button>
                        <button type="button" onclick="updateProduct()" style="padding: 10px 20px; background-color: #007bff; border: none; color: white; cursor: pointer;">Save Changes</button>
                    </div>
                </form>
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

    function populateUpdateModal(id, productName, productDescription, productCategory, productPrice, productStock, productModel, productSize, productColor, productDialShape, productCompatibleOs) {
        document.getElementById('updateId').value = id;
        document.getElementById('productName').value = productName;
        document.getElementById('productDescription').value = productDescription;
        document.getElementById('productCategory').value = productCategory;
        document.getElementById('productPrice').value = productPrice;
        document.getElementById('productStock').value = productStock;
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
<jsp:include page="footer.jsp"></jsp:include>
