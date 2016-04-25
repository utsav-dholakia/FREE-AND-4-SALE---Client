package jsp.servlet.mvc.bean;

public class ViewCartBean extends CartBean {

	private String image;
	private int categoryId;
	private String itemName;
	private int totalQuantity;
	private String sellerName;
	private String transactionTime;
	
	
	public ViewCartBean(String image, int categoryId, String itemName, int totalQuantity) {
		super();
		this.image = image;
		this.categoryId = categoryId;
		this.itemName = itemName;
		this.totalQuantity = totalQuantity;
	}

	public ViewCartBean() {
		super();
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getTransactionTime() {
		return transactionTime;
	}

	public void setTransactionTime(String transactionTime) {
		this.transactionTime = transactionTime;
	}

	
}
