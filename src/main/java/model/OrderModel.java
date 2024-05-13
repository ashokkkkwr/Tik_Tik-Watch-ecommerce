package model;

public class OrderModel {
	
	
	
	private int orderId;
	private String cartId;
    private int orderStatus;
    private String name;
    private int cartStatus;
    private String image;
    private String userName;
    private String email;
    public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCartStatus() {
		return cartStatus;
	}
	public void setCartStatus(int cartStatus) {
		this.cartStatus = cartStatus;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	private int price;
    private int quantity;
    

	public OrderModel(String cartId) {
		super();
		this.cartId = cartId;
	}
	public OrderModel() {
		
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}
	  public int getOrderStatus() {
	        return orderStatus;
	    }

	    public void setOrderStatus(int orderStatus) {
	        this.orderStatus = orderStatus;
	    }
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}

	
}
