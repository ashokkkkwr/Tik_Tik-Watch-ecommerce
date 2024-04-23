package model;

public class CartModel {
 
    private String quantity;
    private String productId;
    private String userId;
	public CartModel( String quantity, String productId, String userId) {
		super();
		
		this.quantity = quantity;
		this.productId = productId;
		this.userId = userId;
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


    
    
    
    
}