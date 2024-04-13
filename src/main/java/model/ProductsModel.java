package model;

public class ProductsModel {
private String productName;
private String productDescription;
private String productCategory;
private String productPrice;
private String productAvailability;
public ProductsModel(String productName, String productDescription, String productCategory, String productPrice,
		String productAvailability) {
	super();
	this.productName = productName;
	this.productDescription = productDescription;
	this.productCategory = productCategory;
	this.productPrice = productPrice;
	this.productAvailability = productAvailability;
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




}
