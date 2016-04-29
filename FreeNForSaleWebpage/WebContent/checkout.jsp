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
List<Integer> removeList=new ArrayList<Integer>();

System.out.println("Cart controller servlet call...");
Boolean status = true;
int size=0;
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
	session.setAttribute("cartList", cartList);
	size=cartList.size();
	System.out.println("initial size = " +size);
	System.out.println("RemoveList size = " +removeList.size());
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
	<form  method="post">

		<div class="check-out">	 
		<div class="container">	 
	 
 <table class="table animated wow fadeInLeft" data-wow-delay=".5s">
		  <tr>
			<th class="t-head head-it ">Item</th>
			<th class="t-head">Price</th>
			<th class="t-head">Quantity</th>
			<th class="t-head">Total</th>
		  </tr>
		  <input type="hidden" name="UId" value="<%=UId%>">
		  <% for(int i = 0 ; i < cartList.size(); i++) { %>				
		  
		  <tr class="cross">
			<td class="ring-in t-data">
				<img src="<%=cartList.get(i).getImage() %>" class="img" style="display:inline;" alt="<%=cartList.get(i).getItemName() %>" width="150" height="150">
				<div class="sed" style="max-width:60%;display:inline;">
					<h5><%=cartList.get(i).getItemName() %></h5>
				</div>
				<input type="hidden" name="itemId<%=i%>" value="<%=cartList.get(i).getInventoryId()%>">
				<input type="hidden" name="sellerId<%=i%>" value="<%=cartList.get(i).getSellerId()%>">
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
	
</script>				<input type="hidden" name="size" value="<%=size%>"> 

				<div><a class="btn-primary removeItem" >Remove Item</a></div>
				<div class="clearfix"> </div>	
			 </td>
<script>
$(document).ready(function(){
	$('.value-plus').on('click', function(){
		var divUpd = $(this).parent().find('.quantitySelected'), newVal = parseInt(divUpd.attr("value"), 10)+1;
		if(<%= cartList.get(i).getTotalQuantity()%> > divUpd.attr("value"))
		{
			divUpd.attr("value",newVal);
		}
		else
		{
			alert("Total quantity reached for this item");
		}
	
		var totalAmount = ($(this).parents(".cross").find(".price").attr("value")) * ($(this).parent().find('.quantitySelected').attr("value"));
		console.log("price :" + $(this).parents(".cross").find(".price").attr("value"));
		console.log("quantity :" + $(this).parent().find('.quantitySelected').attr("value"));
		$(this).parents(".cross").find(".calculateTotal").attr("value",totalAmount);
	});
	$('.value-minus').on('click', function(){
		var divUpd = $(this).parent().find('.quantitySelected'), newVal = parseInt(divUpd.attr("value"), 10)-1;
		if(newVal>=1) 
		{
			divUpd.attr("value",newVal);
		}
		var totalAmount = ($(this).parents(".cross").find(".price").attr("value")) * ($(this).parent().find('.quantitySelected').attr("value"));
		console.log("price :" + $(this).parents(".cross").find(".price").attr("value"));
		console.log("quantity :" + $(this).parent().find('.quantitySelected').attr("value"));
		$(this).parents(".cross").find(".calculateTotal").attr("value",totalAmount);
	});
	
	//var totalCartPrice = $(.)
	$(".totalPrice").text();
});
</script>
			<td class="t-data">$ <input class="price" style="border:0; background: white;" name="amount<%=i%>"  value="<%=cartList.get(i).getAmount() %>"/></td>
			<td class="t-data quantityParentDiv">
				<div class="quantity"> 
					<div class="quantity-select">            
						<div class="entry value-minus">&nbsp;</div>
						<div class="entry value"><input class="span-1 quantitySelected" style="border:0; background: white;" name="quantity<%=i%>"  value="<%=cartList.get(i).getQuantity()%>"/></div>									
						<div class="entry value-plus active">&nbsp;</div>
					</div>
				</div>			
			</td><%float x=Float.parseFloat(cartList.get(i).getAmount())*cartList.get(i).getQuantity(); %>
			<td class="t-data " > <input type="text" style="border:0; background: white;" class="calculateTotal" id="calculateTotal<%=i %>" name="totalAmount<%=i%>" value="<%=x %>" /> 
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
			   <li class="last_price totalPrice"><span id="totalPrice"></span></li>
			   <div class="clearfix"> </div>
			 </ul>
			
<!-- 			 <a href="javascript:void(0)">Produced By Cart</a>
 -->			 <input data-text="Purchase Cart" style="float: right; margin-right : 12px" type="submit" class="but-hover1 item_add" value="Purchase Cart" onclick="form.action='purchaseCartServlet';" />
			 
			</div>
			
		
		 </div>
		 </div>
	</form>
	<%@include file="footer.jsp" %>
</body>
</html>