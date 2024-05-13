package model;

public class DisplayCart {
	private int cartId;
    private String quantity;
    private String productId;
    private String userId;
    private String price;
	public DisplayCart( String quantity, String productId, String userId, String price) {
		super();
		this.price=price;
		this.quantity = quantity;
		this.productId = productId;
		this.userId = userId;
	}
	public DisplayCart() {
		super();
		
		
	}
	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	


    
    
    
    
}