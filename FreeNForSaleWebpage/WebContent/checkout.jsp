<!DOCTYPE html>
<html>
<body>

	<%@include file="header.jsp" %>
	<%@page import= "jsp.servlet.mvc.bean.CartBean" %>
	<%@page import= "jsp.servlet.mvc.bean.ViewCartBean" %>
	<%@page import= "java.util.ArrayList"%>
	<%@page import= "java.util.Map"%>
	<%@page import= "jsp.servlet.mvc.bean.InventoryBean"%>
	<%@page import= "com.sun.jersey.api.client.Client" %>
	<%@page import= "com.sun.jersey.api.client.ClientResponse" %>
	<%@page import= "com.sun.jersey.api.client.GenericType" %>
	<%@page import= "com.sun.jersey.api.client.WebResource" %>
	<%@page import= "javax.ws.rs.core.MediaType" %>
	<%@page import= "java.util.HashMap" %>
	<%@page import= "java.util.List" %>
	<%@page import="com.sun.jersey.api.client.filter.LoggingFilter"%>
	
<%
int userId = Integer.parseInt(UId);
String statusString;
List<ViewCartBean> cartList = new ArrayList();
System.out.println("Cart controller servlet call...");
Boolean status = true;
try {
	
	Client client = Client.create();
	client.addFilter(new LoggingFilter());
	WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/CartService/getCart");
	
	CartBean cartBean= new CartBean();
	cartBean.setUserId(userId);
	ClientResponse restResponse = webResource.header("secretKey", "1234567890")
	    .accept(MediaType.APPLICATION_JSON)
	    .post(ClientResponse.class, cartBean);
	
	
	if(restResponse.getStatus() == 400)
	{
		statusString = restResponse.getEntity(String.class);
		status=false;
		if(statusString.equals("-1"))
		{
			System.out.println(statusString);
		}
	}

	cartList = restResponse.getEntity(new GenericType<List<ViewCartBean>>(){});
	System.out.println(cartList.get(0).getItemName());
	request.setAttribute("cartList",cartList);

} catch (Exception e) {
	status= false;
	e.printStackTrace();
} 
%>
<!--banner-->
<div class="banner-top">
	<div class="container">
		<h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Checkout</h2>
		<h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index2.jsp" id="gotoHomePage">Home</a><label>/</label>Checkout</h3>
		<div class="clearfix"> </div>
	</div>
</div>
<!-- contact -->
		<div class="check-out">	 
		<div class="container">	 
	 
<script>
	$(document).ready(function(c) {
		$('.removeItem').on('click', function(c){
			console.log("delete button clicked");
			$(this).parents('.cross').fadeOut('slow', function(c){
				console.log("fade out complete");
				$(this).parents('.cross').remove();
			});
		});
	});
	
</script>	
 <table class="table animated wow fadeInLeft" data-wow-delay=".5s">
		  <tr>
			<th class="t-head head-it ">Item</th>
			<th class="t-head">Price</th>
			<th class="t-head">Quantity</th>
			<th class="t-head">Total</th>
		  </tr>
		  <% for(int i = 0 ; i < cartList.size(); i++) {%>
		  <tr class="cross">
			<td class="ring-in t-data">
				<img src="<%=cartList.get(i).getImage() %>" class="img" style="display:inline;" alt="<%=cartList.get(i).getItemName() %>" width="150" height="150">
				<div class="sed" style="max-width:60%;display:inline;">
					<h5><%=cartList.get(i).getItemName() %></h5>
				</div>
				<div><button class="btn-primary removeItem" value="Remove Item">Remove Item</button></div>
				<div class="clearfix"> </div>	
			 </td>
<script>
$(document).ready(function(){
	$('.value-plus').on('click', function(){
		var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
		if(<%= cartList.get(i).getTotalQuantity()%> > divUpd.text())
		{
			divUpd.text(newVal);
		}
		else
		{
			alert("Total quantity reached for this item");
		}
	
		var totalAmount = ($(this).parents(".cross").find(".price").text()) * ($(this).siblings(".value").text());
		console.log("price :" + $(this).parents(".cross").find(".price").text());
		console.log("quantity :" + $(this).siblings(".value").text());
		$(".calculateTotal").text(totalAmount);
	});
	$('.value-minus').on('click', function(){
		var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
		if(newVal>=1) 
		{
			divUpd.text(newVal);
		}
		var totalAmount = ($(this).parents(".cross").find(".price").text()) * ($(this).siblings(".value").text());
		console.log("price :" + $(this).parents(".cross").find(".price").text());
		console.log("quantity :" + $(this).siblings(".value").text());
		$(".calculateTotal").text(totalAmount);
	});
	
	//var totalCartPrice = $(.)
	$(".totalPrice").text();
});
</script>
			<td class="t-data">$<span class="price"><%=cartList.get(i).getAmount() %></span></td>
			<td class="t-data quantityParentDiv">
				<div class="quantity"> 
					<div class="quantity-select">            
						<div class="entry value-minus">&nbsp;</div>
						<div class="entry value"><span class="span-1 quantitySelected">1</span></div>									
						<div class="entry value-plus active">&nbsp;</div>
					</div>
				</div>			
			</td>
			<td class="t-data calculateTotal">
			</td>
			
		  </tr>
		<%} %>
	</table>
				<div class=" cart-total">
			
			 <h5 class="continue" >Cart Total</h5>
			 <!-- <div class="price-details">
				 <h3>Price Details</h3>
				 <span>Total</span>
				 <span class="total1">6200.00</span>
				 <span>Discount</span>
				 <span class="total1">---</span>
				 <span>Delivery Charges</span>
				 <span class="total1">150.00</span>
				 <div class="clearfix"></div>				 
			 </div>	
			 --> 
			 <ul class="total_price">
			   <li class="last_price"> <h4>TOTAL</h4></li>	
			   <li class="last_price totalPrice"><span></span></li>
			   <div class="clearfix"> </div>
			 </ul>
			
			 <a href="javascript:void(0)">Produced By Cart</a>
			 
			</div>
			
		
		 </div>
		 </div>

	<%@include file="footer.jsp" %>
</body>
</html>