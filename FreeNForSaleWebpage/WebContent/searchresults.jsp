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
	
<!--banner-->
<div class="banner-top">
	<div class="container">
		<h2 class="animated wow fadeInLeft" data-wow-delay=".5s">SEARCH RESULTS</h2>
		<h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index2.jsp" id="gotoHomePage">Home</a><label>/</label>Search Results</h3>
		<div class="clearfix"> </div>
	</div>
</div>
	<!--content-->
		<div class="product">
			<div class="container">
		
			<!-- <div class="col-md-3 product-bottom">
			categories
			<div class="categories animated wow fadeInUp animated" data-wow-delay=".5s" >
					<h3>Categories</h3>
					<ul class="cate">
						<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Best Selling</a> <span>(15)</span></li>
						<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Man</a> <span>(16)</span></li>
							<ul>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Accessories</a> <span>(2)</span></li>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Coats &amp; Jackets</a> <span>(5)</span></li>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Jeans</a> <span>(1)</span></li>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">New Arrivals</a> <span>(0)</span></li>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Suits</a> <span>(1)</span></li>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Casual Shirts</a> <span>(0)</span></li>
							</ul>
						<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Sales</a> <span>(15)</span></li>
						<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Woman</a> <span>(15)</span></li>
							<ul>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Accessories</a> <span>(2)</span></li>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">New Arrivals</a> <span>(0)</span></li>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Dresses</a> <span>(1)</span></li>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Casual Shirts</a> <span>(0)</span></li>
								<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.html">Shorts</a> <span>(4)</span></li>
							</ul>
					</ul>
				</div> 
		//menu
		price
				<div class="price animated wow fadeInUp animated" data-wow-delay=".5s" >
					<h3>Price Range</h3>
					<div class="price-head">
					<div class="col-md-6 price-head1">
                                        <div class="price-top1">
                                            <span class="price-top">$</span>
                                            <input type="text"  value="0">
                                        </div>
                                    </div>
									<div class="col-md-6 price-head2">
                                        <div class="price-top1">
                                            <span class="price-top">$</span>
                                            <input type="text"  value="500">
                                        </div>
                                    </div>
									<div class="clearfix"></div>
                                    </div>
                                    </div>
			//price
			colors
			<div class="colors animated wow fadeInLeft animated" data-wow-delay=".5s" >
					<h3>Colors</h3>

                                        <div class="color-top">
                                            <ul>
												<li><a href="#"><i></i></a></li>
												<li><a href="#"><i class="color1"></i></a></li>
												<li><a href="#"><i class="color2"></i></a></li>
												<li><a href="#"><i class="color3"></i></a></li>
												<li><a href="#"><i class="color4"></i></a></li>
												<li><a href="#"><i class="color5"></i></a></li>
												<li><a href="#"><i class="color6"></i></a></li>
												<li><a href="#"><i class="color7"></i></a></li>
											</ul>
                                        </div>
                                    </div>
									
                                 
			//colors
			<div class="sellers animated wow fadeInUp" data-wow-delay=".5s">
					
								<h3 class="best">BEST SELLERS</h3>
					<div class="product-head">
					<div class="product-go">
						<div class=" fashion-grid">
									<a href="single.html"><img class="img-responsive " src="images/pcc.jpg" alt=""></a>
									
								</div>
							<div class=" fashion-grid1">
								<h6 class="best2"><a href="single.html">Lorem ipsum </a></h6>
								<span class=" price-in1"> <del>$50.00</del>$40.00</span>
								<p>The standard chunk of Lorem Ipsum used</p>
							</div>
								
							<div class="clearfix"> </div>
							</div>
							<div class="product-go">
						<div class=" fashion-grid">
									<a href="single.html"><img class="img-responsive " src="images/pcc1.jpg" alt=""></a>
									
								</div>
							<div class=" fashion-grid1">
								<h6 class="best2"><a href="single.html">Lorem ipsum </a></h6>
								<span class=" price-in1"> <del>$50.00</del>$40.00</span>
								<p>The standard chunk of Lorem Ipsum used</p>
							</div>
							<div class="clearfix"> </div>
							</div>
							
							</div>
				</div>
				
 	</div> -->
			<div class="col-md-9 animated wow fadeInRight" data-wow-delay=".5s">
				<div class="mens-toolbar">
					<p class="showing">Sorting By :
						<a href="javascript:void(0)" id="sort">Name</a>
			        </p>
                	<div class="clearfix"></div>		
		        </div>
<script>
function sortTable(){
	console.log("inside sort table");
	  var rows = $('.table tbody  tr').get();

	  rows.sort(function(a, b) {

	  var A = $(a).find('.inventoryName').eq(0).text().toUpperCase();
	  var B = $(b).find('.inventoryName').eq(0).text().toUpperCase();

	  if(A < B) {
	    return -1;
	  }

	  if(A > B) {
	    return 1;
	  }

	  return 0;

	  });
	  console.log("going to print sorted table");
	  $.each(rows, function(index, row) {
	    $('.table').children('tbody').append(row);
	  });
	}

$(document).ready(function(){
	$("#sort").on("click",function(){
		console.log("sortTable clicked");
		sortTable();
	});
	$(".itemId").hide();
});
</script>
<%	 
ArrayList<InventoryBean> iBeans = (ArrayList<InventoryBean>)request.getAttribute("iBeans");
%>

			<div class="mid-popular">
			<table class="table">
			<tbody>
		<% out.println("UID :" + UId);
		for(int i= 0 ; i < iBeans.size(); i++) { %>
			
			<tr>
			<td>
				<div class="col-sm-4 item-grid item-gr  simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<!--  <a href="single.jsp" class="showSingleItem"> -->
											<div class="grid-img">
											<%if (iBeans.get(i).getMainImage()!=null){ %>
												<img  src="<%=iBeans.get(i).getMainImage() %>" 
												class="img-responsive" alt="<%=iBeans.get(i).getInventoryName() %>"/>
											<% } else {%>
												<img  src="images/image_not_available.png" 
												class="img-responsive" alt="Image not available"/>
												<%} %>
											</div>			
										<!-- </a> -->		
									</figure>	
								</div>
								<form action="SingleItemControllerServlet" method="post">
								<div class="women">
									<h6>
									<button type="submit" class="btn">
										<a href="single.jsp" class="inventoryName showSingleItem" name="inventoryName"><%=iBeans.get(i).getInventoryName() %>
										</a>
									</button>
									</h6>
									<input type="text" class="itemId" name="itemId" value="<%=iBeans.get(i).getItemId() %>">
									<p ><em class="item_price">$<%=iBeans.get(i).getPrice()%></em></p>
									<%if (iBeans.get(i).getRemainingQuantity()>0){ %>
										<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
									<%} %>
								</div>
								</form>
							</div>
						</div>
				</td>
				
				
				</tr>
				
			<%} %>
			</tbody>
			</table>
				<!-- 		<div class="col-sm-4 item-grid item-gr simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="images/pr3.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="images/pr2.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4 item-grid item-gr simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="images/pr5.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="images/pr4.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4 item-grid item-gr simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="images/pr12.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="images/pr13.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4 item-grid item-gr simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="images/pr15.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="images/pr14.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4 item-grid item-gr simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="images/pr17.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="images/pr16.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4 item-grid item-gr simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="images/pr19.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="images/pr18.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4 item-grid item-gr simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="images/pr21.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="images/pr20.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4 item-grid item-gr simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="images/pr23.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="images/pr22.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="images/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add To Cart</a>
								</div>
							</div>
						</div> -->
					<div class="clearfix"></div>
				</div>
			</div>

		
			</div class="clearfix"></div>
			</div>			
		</div>
				<!--//products-->

	<%@include file="footer.jsp" %>
</body>
</html>