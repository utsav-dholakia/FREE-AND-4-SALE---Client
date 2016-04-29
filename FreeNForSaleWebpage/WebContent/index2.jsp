<!DOCTYPE html>
<html>

<body>
	<%@include file="header.jsp" %>
	<%@page import= "java.util.ArrayList"%>
	<%@page import= "java.util.Map"%>
	<%@page import= "jsp.servlet.mvc.bean.InventoryBean"%>
	<%@page import= "com.sun.jersey.api.client.Client" %>
	<%@page import= "com.sun.jersey.api.client.ClientResponse" %>
	<%@page import= "com.sun.jersey.api.client.GenericType" %>
	<%@page import= "com.sun.jersey.api.client.WebResource" %>
	<%@page import= "javax.ws.rs.core.MediaType" %>
	<%@page import= "java.util.HashMap" %>
	<%@page import="com.sun.jersey.api.client.filter.LoggingFilter"%>
	
	<!-- banner -->
	<div class="banner">
<%
System.out.println("InventoryControllerServlet Get call...");
Boolean status = true;
Map<Integer,ArrayList<InventoryBean>> iBeans = new HashMap();
try {
	
	Client client = Client.create();
	client.addFilter(new LoggingFilter());
	WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/InventoryServices/InventoryForHomePage");
	
	ClientResponse restResponse = webResource.header("secretKey", "1234567890")
	    .accept(MediaType.APPLICATION_JSON)
	    .get(ClientResponse.class);
	
	
	if (restResponse.getStatus() != 200) {
		status=false;
		throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
	}

	iBeans = restResponse.getEntity(new GenericType<Map<Integer,ArrayList<InventoryBean>>>(){});
	request.setAttribute("iBeans", iBeans);
	System.out.println(iBeans.get(1).get(0).getCategoryName());
	
} catch (Exception e) {
	status= false;
	e.printStackTrace();
}

%>
<%	 		
ArrayList<InventoryBean> featuredList=iBeans.get(1);
%>
<script>
	$(document).ready(function(){
		$(".singleItemForm").on("click",function(){
			console.log("submitting singleItemForm");
			$(this).parent().parent().action = "SingleItemController"; //Trigger action
			$(this).parent().parent().submit();
		});
		$(".addToCartForm").on("click",function(){
			console.log("submitting addToCartForm");
			$(this).parent().parent().action = "AddToCartControllerServlet"; //Trigger action
			$(this).parent().parent().submit();
		});
	});
</script>	
		
		<div class="banner-right">
			<ul id="flexiselDemo2">
				<%for (int i=0; i<featuredList.size(); i++) { %>
				<li>
				<div class="banner-grid">
					<h2>Heavy Products</h2>
					<div class="wome">
						<img class="img-responsive"
							src="<%=featuredList.get(i).getMainImage()%>" alt=""/>
						<form method="post">
						<div class="women simpleCart_shelfItem">
							<h6>
							<button class="btn singleItemForm">
								<a href="single.jsp" name="inventoryName"><%=featuredList.get(i).getInventoryName() %></a>
							</button>
							</h6>
							<input type="text" class="itemId" name="itemId" value="<%=featuredList.get(i).getItemId() %>">
							<p class="ba-price">
								<em class="item_price" name="price">$<%=featuredList.get(i).getPrice()%></em>
							</p>
							<%if (featuredList.get(i).getRemainingQuantity()>0){ %>
							<button class="btn item_add addToCartForm">
								Add To Cart
							</button>
							<%} %>
						</div>
						</form>
					</div>
				</div>
				</li>
				<% } %>
			</ul>
<script type="text/javascript">
	$(window).load(function() {
		$("#flexiselDemo2").flexisel({
			visibleItems : 1,
			animationSpeed : 1000,
			autoPlay : true,
			autoPlaySpeed : 5000,
			pauseOnHover : true,
			enableResponsiveBreakpoints : true,
			responsiveBreakpoints : {
				portrait : {
					changePoint : 480,
					visibleItems : 1
				},
				landscape : {
					changePoint : 640,
					visibleItems : 1
				},
				tablet : {
					changePoint : 768,
					visibleItems : 1
				}
			}
		});
		$(".itemId").hide();
	});
</script>
<script type="text/javascript" src="js/jquery.flexisel.js"></script>

		</div>
	</div>

	<!-- //banner -->
	<!--content-->
	
	<!---->

	<div class="content-top">
		<div class="col-md-5 col-md1 animated wow fadeInLeft" data-wow-delay=".1s">
			<div class="col-3">
				<img src="images/consumer.png" class="img-responsive " alt="">
					<div class="col-pic">
						<h5>Consumer Goods</h5>
						<p>Clothing,Cosmetics, Shoes & Jwelery  </p>
					</div>
			</div>
		</div>
		<div class="col-md-7 col-md2 animated wow fadeInRight" data-wow-delay=".1s">
<% ArrayList<InventoryBean> consumerList=iBeans.get(2);
	for (int i=0; i<consumerList.size(); i++) {%>
		<div class="col-sm-4 item-grid simpleCart_shelfItem">
			<div class="grid-pro">
				<div class=" grid-product ">
					<figure>
						<div class="grid-img">
							<img src="<%= consumerList.get(i).getMainImage()%>" class="img-responsive" alt="">
						</div>
					</figure>
				</div>
				<form action="SingleItemControllerServlet" method="post">
				<div class="women">
						<h6>
						<button type="submit" class="btn">
							<a href="single.jsp"><%=consumerList.get(i).getInventoryName() %></a>
						</button>
						</h6>
						<input type="text" class="itemId" name="itemId" value="<%=consumerList.get(i).getItemId() %>">
						<p>
							<em class="item_price">$<%=consumerList.get(i).getPrice()%></em>
						</p>
						<%if (consumerList.get(i).getRemainingQuantity()>0){ %>
						<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
						<% }else{ %>
								<em class="item_price">Out of Stock</em>
							<%} %>
				</div>
				</form>
			</div>
		</div>
	<% } %>
		<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!----->
	<!---->
	 <div class="content-top">
		<div class="col-md-7 col-md2 animated wow fadeInLeft" data-wow-delay=".1s">
<%ArrayList<InventoryBean> lightPrdctsList=iBeans.get(3);
	for (int i=0; i<lightPrdctsList.size(); i++) {%>
			<div class="col-sm-4 item-grid simpleCart_shelfItem">
				<div class="grid-pro">
					<div class=" grid-product ">
						<figure>
							<div class="grid-img">
								<img src="<%=lightPrdctsList.get(i).getMainImage()%>" class="img-responsive" alt="">
							</div>
						</figure>
					</div>
					<form action="SingleItemControllerServlet" method="post">
					<div class="women">
						<h6>
						<button type="submit" class="btn">
							<a href="single.jsp"><%=lightPrdctsList.get(i).getInventoryName() %></a>
						</button>
						</h6>
						<input type="text" class="itemId" name="itemId" value="<%=lightPrdctsList.get(i).getItemId() %>">
						<p>
							<em class="item_price">$<%=lightPrdctsList.get(i).getPrice()%></em>
						</p>
						<%if (consumerList.get(i).getRemainingQuantity()>0){ %>
							<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
						<% } %>
					</div>
					</form>
				</div>
			</div>
	<% } %> 
	
		<div class="clearfix"></div>
		</div>
		<div class="col-md-5 col-md1 animated wow fadeInRight"
			data-wow-delay=".1s">
			<div class="col-3">
				<img src="images/pi2.jpg" class="img-responsive " alt="">
					<div class="col-pic">
						<h5>Small Products</h5>
						<p>Books, Promotions and others</p>
					</div>
				
			</div>
		</div>
		<div class="clearfix"></div>
	</div> 

	<%@include file="footer.jsp" %>
</body>
</html>