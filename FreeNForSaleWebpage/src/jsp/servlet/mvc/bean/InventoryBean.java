package jsp.servlet.mvc.bean;

public class InventoryBean {
	private int itemId;
	private int categoryId;
	private String categoryName;
	private String itemName;
	private String price;
	private int remainingQuantity;
	private String mainImage;

	
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getInventoryName() {
		return itemName;
	}
	public void setInventoryName(String inventoryName) {
		itemName = inventoryName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getRemainingQuantity() {
		return remainingQuantity;
	}
	public void setRemainingQuantity(int remainingQuantity) {
		this.remainingQuantity = remainingQuantity;
	}

}
