package model;

public class ProductsModel {
private String productName;
private String productDescription;
private String productCategory;
private String productPrice;
private String productAvailability;
private String productModels;
private String productSize;
private String productColor;
private String productDialShape;
private String productCompatibleOs;



public ProductsModel(String productName, String productDescription, String productCategory, String productPrice,
		String productAvailability, String productModels, String productSize, String productColor,
		String productDialShape, String productCompatibleOs) {
	super();
	this.productName = productName;
	this.productDescription = productDescription;
	this.productCategory = productCategory;
	this.productPrice = productPrice;
	this.productAvailability = productAvailability;
	this.productModels = productModels;
	this.productSize = productSize;
	this.productColor = productColor;
	this.productDialShape = productDialShape;
	this.productCompatibleOs = productCompatibleOs;
}
public ProductsModel() {
	
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
public String getProductPrice() {
	return productPrice;
}
public void setProductPrice(String productPrice) {
	this.productPrice = productPrice;
}
public String getProductAvailability() {
	return productAvailability;
}
public void setProductAvailability(String productAvailability) {
	this.productAvailability = productAvailability;
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

}