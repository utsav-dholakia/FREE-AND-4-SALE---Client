<!DOCTYPE html>
<html>

<body>
	<%@include file="header.jsp" %>
	<%@page import= "java.util.ArrayList"%>
	<%@page import= "java.util.Map"%>
	<%@page import= "jsp.servlet.mvc.bean.InventoryBean"%>
	<!-- banner -->
	<div class="banner">

	<%		Map<Integer,ArrayList<InventoryBean>> iBeans=(Map<Integer,ArrayList<InventoryBean>>)request.getAttribute("iBeans");
 				ArrayList<InventoryBean> featuredList=iBeans.get(1);
 %>
		
		<div class="banner-right">
			<ul id="flexiselDemo2">
				<%for (int i=0; i<featuredList.size(); i++) { %>
				<li>
				<div class="banner-grid">
						<h2>Heavy Products</h2>
						<div class="wome">
							<a href="single.html"><img class="img-responsive"
								src="<%=featuredList.get(i).getMainImage()%>" alt="" /> </a>
							<div class="women simpleCart_shelfItem">
								<a href="#"><img src="images/ll.png" alt=""></a>
								<h6>
									<a href="single.html"><%=featuredList.get(i).getInventoryName() %></a>
								</h6>
								<p class="ba-price">
									<em class="item_price">$<%=featuredList.get(i).getPrice()%></em>
								</p>
								<%if (featuredList.get(i).getRemainingQuantity()>0){ %>
								<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add
									To Cart</a>
									<%} %>
							</div>
						</div>
					</div></li>
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

				});
			</script>
			<script type="text/javascript" src="js/jquery.flexisel.js"></script>

		</div>


	</div>

	</div>
	<!-- //banner -->
	<!--content-->
	
	<!---->

	<div class="content-top">
		<div class="col-md-5 col-md1 animated wow fadeInLeft"
			data-wow-delay=".1s">
			<div class="col-3">
				<a href="single.html"><img src="images/consumer.png"
					class="img-responsive " alt="">
					<div class="col-pic">
						<h5>Consumer Goods</h5>
						<p>Clothing,Cosmetics, Shoes & Jwelery  </p>
					</div></a>
			</div>

		</div>
		<div class="col-md-7 col-md2 animated wow fadeInRight"
			data-wow-delay=".1s">
			 				<% ArrayList<InventoryBean> consumerList=iBeans.get(2);
			 				for (int i=0; i<consumerList.size(); i++) {%>
			
			<div class="col-sm-4 item-grid simpleCart_shelfItem">
				<div class="grid-pro">
					<div class=" grid-product ">
						<figure>
							<a href="single.html">
								<div class="grid-img">
									<img src="<%= consumerList.get(i).getMainImage()%>" class="img-responsive" alt="">
								</div>
								<!-- <div class="grid-img">
									<img src="images/pr.jpg" class="img-responsive" alt="">
								</div> -->
							</a>
						</figure>
					</div>
					<div class="women">
						<a href="#"><img src="images/ll.png" alt=""></a>
						<h6>
							<a href="single.html"><%=consumerList.get(i).getInventoryName() %></a>
						</h6>
						<p>
							
							<em class="item_price">$<%=consumerList.get(i).getPrice()%></em>
						</p>
						<%if (consumerList.get(i).getRemainingQuantity()>0){ %>
						<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add
							To Cart</a><% }else{ %>
							<em class="item_price">Out of Stock</em>
							<%} %>
					</div>
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

		<div class="col-md-7 col-md2 animated wow fadeInLeft"
			data-wow-delay=".1s">
			<%ArrayList<InventoryBean> lightPrdctsList=iBeans.get(3);
			 				for (int i=0; i<lightPrdctsList.size(); i++) {%>
			<div class="col-sm-4 item-grid simpleCart_shelfItem">
				<div class="grid-pro">
					<div class=" grid-product ">
						<figure>
							<a href="single.html">
								<div class="grid-img">
									<img src="<%=lightPrdctsList.get(i).getMainImage()%>" class="img-responsive" alt="">
								</div>
								<!-- <div class="grid-img">
									<img src="images/pr7.jpg" class="img-responsive" alt="">
								</div> -->
							</a>
						</figure>
					</div>
					<div class="women">
						<a href="#"><img src="images/ll.png" alt=""></a>
						<h6>
							<a href="single.html"><%=lightPrdctsList.get(i).getInventoryName() %></a>
						</h6>
						<p>
							
							<em class="item_price"><%=lightPrdctsList.get(i).getPrice()%></em>
						</p>
												<%if (consumerList.get(i).getRemainingQuantity()>0){ %>
						
						<a href="#" data-text="Add To Cart" class="but-hover1 item_add">Add
							To Cart</a><% } %>
					</div>
				</div>

			</div>
<% } %>
	
			<div class="clearfix"></div>
		</div>
		<div class="col-md-5 col-md1 animated wow fadeInRight"
			data-wow-delay=".1s">
			<div class="col-3">
				<a href="single.html"><img src="images/pi2.jpg"
					class="img-responsive " alt="">
					<div class="col-pic">
						<h5>Small Products</h5>
						<p>Books, Promotions and others</p>
					</div></a>
			</div>

		</div>
		<div class="clearfix"></div>
	</div>

	<%@include file="footer.jsp" %>
</body>
</html>