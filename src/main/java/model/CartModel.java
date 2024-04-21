package model;

public class CartModel {
    private int cartId;
    private int quantity;
    private int productId;
    private int userId;
	public CartModel(int cartId, int quantity, int productId, int userId) {
		super();
		this.cartId = cartId;
		this.quantity = quantity;
		this.productId = productId;
		this.userId = userId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}


    
    
    
    
}