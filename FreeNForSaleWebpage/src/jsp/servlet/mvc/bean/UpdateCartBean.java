package jsp.servlet.mvc.bean;

import java.util.List;

public class UpdateCartBean {

	private List<CartBean> updateItems;
	private List<Integer> removeItems;
	private int userId;
	private String paymentType;
	
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public UpdateCartBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public List<CartBean> getUpdateItems() {
		return updateItems;
	}
	public void setUpdateItems(List<CartBean> updateItems) {
		this.updateItems = updateItems;
	}
	public List<Integer> getRemoveItems() {
		return removeItems;
	}
	public void setRemoveItems(List<Integer> removeItems) {
		this.removeItems = removeItems;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

	

}
