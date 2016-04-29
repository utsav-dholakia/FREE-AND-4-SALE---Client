<!DOCTYPE html>
<html>
<body>
	<%@include file="header.jsp" %>
	<%@page import= "java.util.ArrayList"%>
	<%@page import= "java.util.Map"%>
	<%@page import= "jsp.servlet.mvc.bean.ItemDetailBean"%>
	<%@page import= "com.sun.jersey.api.client.Client" %>
	<%@page import= "com.sun.jersey.api.client.ClientResponse" %>
	<%@page import= "com.sun.jersey.api.client.GenericType" %>
	<%@page import= "com.sun.jersey.api.client.WebResource" %>
	<%@page import= "javax.ws.rs.core.MediaType" %>
	<%@page import= "java.util.HashMap" %>
	
	
<!--banner-->
<div class="banner-top">
	<div class="container">
		<h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Product Details</h2>
		<h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index2.jsp" id="gotoHomePage">Home</a><label>/</label>Product</h3>
		<div class="clearfix"> </div>
	</div>
</div>
	<!--content-->
		<div class="product">
		<div class="container">
		
<%
	ItemDetailBean iBeans = (ItemDetailBean)request.getAttribute("iBeans");
	ArrayList<String> images = new ArrayList<String>();
	if(null != iBeans.getAllImages())
	{
		//out.println("iBeans size :" + iBeans.getAllImages().size());
		images = iBeans.getAllImages();
	}
%>
		<div class="col-md-9 animated wow fadeInRight" data-wow-delay=".5s">
			<div class="col-md-5 grid-im">		
				<div class="flexslider">
			  		<ul class="slides">
			  			<% if(iBeans.getAllImages() != null)
			  			{
			  				for(int i = 0; i < images.size(); i++ ) { %>
			    			<li data-thumb="<%=images.get(i)%>">
			        			<div class="thumb-image"> <img src="<%=images.get(i) %>" data-imagezoom="true" class="img-responsive"> </div>
			    			</li> 
			  				<%} 
			  			}%>
			  		</ul>
				</div>
			</div>	
			
			<div class="col-md-7 single-top-in">
			<form method="post">
				<div class="span_2_of_a1 simpleCart_shelfItem">
					<h3><%=iBeans.getInventoryName() %></h3>
				    <div class="price_single">
				    <input type="text" class="itemId" name="itemId" value="<%=iBeans.getItemId() %>" hidden/>
					  	<b>$<input size="5" type="text" style="border:0;background:white" class="item_price price" name="price" value="<%=iBeans.getPrice()%>"/></b>
					 	<%if(iBeans.getRemainingQuantity() > 0 && session != null) {%>
					 		<button class="btn item_add addToCartForm" onclick="form.action='AddToCartControllerServlet';">
								Add To Cart
							</button>
					 	<%} %>
					 	<div class="clearfix"></div>
					</div>
				<div class="clearfix"> </div>
			</div>
			</form>
		   	<!----- tabs-box ---->
			<div class="sap_tabs">	
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item " aria-controls="tab_item-0" role="tab"><span>Product Description</span></li>
						<div class="clearfix"></div>
					</ul>				  	 
					<div class="resp-tabs-container">
						<h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span>Product Description</h2>
						<div class="tab-1 resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0" style="display:block">
							<div class="facts">
								<p><%=iBeans.getDescription() %></p>
							</div>
						</div>
						        
			 		</div>
			 	</div>
			</div>
			</div>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<script type="text/javascript">
  $(document).ready(function () {
      $('#horizontalTab').easyResponsiveTabs({
          type: 'default', //Types: default, vertical, accordion           
          width: 'auto', //auto or any width like 600px
          fit: true   // 100% fit in a container
      });
  });
</script>	
<!---->
		</div>
	</div>

			</div class="clearfix"></div>
			</div>			
		</div>
				<!--//products-->

	<%@include file="footer.jsp" %>
<script src="js/imagezoom.js"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>


</body>
</html>