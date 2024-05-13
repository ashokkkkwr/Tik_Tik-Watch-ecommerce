package model;

import java.io.File;

import javax.servlet.http.Part;

public class ProductsModel {
    private int prodId;
    private String productName;
    private String productDescription;
    private String productCategory;
    private int productPrice; // Changed to int
    private int productStock;
    private String productModels;
    private String productSize;
    private String productColor;
    private String productDialShape;
    private String productCompatibleOs;
    private String imageUrlFromPart;

    public ProductsModel(String productName, String productDescription, String productCategory, int productPrice,
            int productStock, String productModels, String productSize, String productColor,
            String productDialShape, String productCompatibleOs, Part imagePart) {
        super();
        this.productName = productName;
        this.productDescription = productDescription;
        this.productCategory = productCategory;
        this.productPrice = productPrice;
        this.productStock = productStock;
        this.productModels = productModels;
        this.productSize = productSize;
        this.productColor = productColor;
        this.productDialShape = productDialShape;
        this.productCompatibleOs = productCompatibleOs;
        this.imageUrlFromPart = getImageUrl(imagePart);
    }

    public ProductsModel() {
        // TODO Auto-generated constructor stub
    }

    public int getProdId() {
        return prodId;
    }

    public void setProdId(int prodId) {
        this.prodId = prodId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public int getProductPrice() { // Corrected return type to int
        return productPrice;
    }

    public void setProductPrice(int productPrice) { // Corrected parameter type to int
        this.productPrice = productPrice;
    }

    public int getProductStock() {
        return productStock;
    }

    public void setProductStock(int productStock) {
        this.productStock = productStock;
    }

    public String getProductModels() {
        return productModels;
    }

    public void setProductModels(String productModels) {
        this.productModels = productModels;
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }

    public String getProductColor() {
        return productColor;
    }

    public void setProductColor(String productColor) {
        this.productColor = productColor;
    }

    public String getProductDialShape() {
        return productDialShape;
    }

    public void setProductDialShape(String productDialShape) {
        this.productDialShape = productDialShape;
    }

    public String getProductCompatibleOs() {
        return productCompatibleOs;
    }

    public void setProductCompatibleOs(String productCompatibleOs) {
        this.productCompatibleOs = productCompatibleOs;
    }

    public String getImageUrlFromPart() {
        return imageUrlFromPart;
    }

    public void setImageFromPart(Part image) {
        this.imageUrlFromPart = getImageUrl(image);
    }

    public void setImageUrlFromString(String imageUrl) {
        this.imageUrlFromPart = imageUrl;
    }

    private String getImageUrl(Part image) {
        String savePath = "/home/arch/eclipse-test/ecommerce/src/main/webapp/images";
        File files = new File(savePath);
        String getImgPart = null;
        if (!files.exists()) {
            files.mkdir();
        }
        String contDisp = image.getHeader("content-disposition");
        String item[] = contDisp.split(";");
        for (String i : item) {
            if (i.trim().startsWith("filename")) {
                getImgPart = i.substring(i.indexOf("=") + 2, i.length() - 1);
            }
        }
        if (getImgPart == null || getImgPart.isEmpty()) {
            getImgPart = "default.png";
        }
        return getImgPart;
    }
}
