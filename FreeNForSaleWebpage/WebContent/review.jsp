<!DOCTYPE html>
<html>
<body>
	<%@include file="header.jsp"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="java.util.Map"%>
	<%@page import="jsp.servlet.mvc.bean.ReviewBean"%>
	<%@page import= "java.util.List"%>
	<%@page import= "java.util.ArrayList"%>
	<%@page import= "java.util.Map"%>
	<%@page import= "jsp.servlet.mvc.bean.CartBean"%>
	<%@page import= "jsp.servlet.mvc.bean.ReviewBean"%>
	<%@page import= "com.sun.jersey.api.client.Client" %>
	<%@page import= "com.sun.jersey.api.client.ClientResponse" %>
	<%@page import= "com.sun.jersey.api.client.GenericType" %>
	<%@page import= "com.sun.jersey.api.client.WebResource" %>
	<%@page import= "javax.ws.rs.core.MediaType" %>
	<%@page import= "java.util.HashMap" %>

	<%	Boolean status = true;
		CartBean bean = new CartBean();
		ReviewBean reviewGet;
		String statusString;
		bean.setUserId(Integer.parseInt(UId));
		List<ReviewBean> reviewList= new ArrayList<ReviewBean>();
		try {

			Client client = Client.create();
			WebResource webResource = client
					.resource("https://localhost:8443/FreeNForSaleServices/rest/ReviewServices/getReviews");

			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
					.accept(MediaType.APPLICATION_JSON).post(ClientResponse.class, bean);

			if (restResponse.getStatus() != 200) {
				status = false;
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}

			Map<Integer, ReviewBean> reviewMap= restResponse.getEntity(new GenericType<Map<Integer, ReviewBean> >(){});
			for (Map.Entry<Integer, ReviewBean> entry : reviewMap.entrySet())
			{
//			    System.out.println(entry.getKey() + "/" + entry.getValue());
			    reviewList.add(entry.getValue());
			}
			request.setAttribute("reviewList",reviewList);
			request.setAttribute("size", reviewList.size());

		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		String[] sellerName = new String[reviewList.size()];
		Integer[] rating = new Integer[reviewList.size()];
		String[] comment = new String[reviewList.size()];
		for(int i =0; i<reviewList.size(); i++ ){
			session.setAttribute("sellerId"+i, reviewList.get(i).getSellerId());
			session.setAttribute("userId"+i, reviewList.get(i).getUserId());
			session.setAttribute("sellerName"+i, reviewList.get(i).getSellerName());
			session.setAttribute("rating"+i, reviewList.get(i).getRatings());
			session.setAttribute("comments"+i, reviewList.get(i).getComments());
			sellerName[i] = reviewList.get(i).getSellerName();
			rating[i] =  reviewList.get(i).getRatings();
			comment[i] = reviewList.get(i).getComments();
			System.out.println(reviewList.get(i).getSellerName());
			System.out.println(reviewList.get(i).getRatings());
			System.out.println(reviewList.get(i).getComments());
			System.out.println(reviewList.get(i).getUserId());
		}
		session.setAttribute("size", reviewList.size());
		session.setAttribute("uid", UId);
		Integer size = reviewList.size();
		
	%>

	<!--banner-->
	<div class="banner-top">
		<div class="container">
			<h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Reviews</h2>
			<h3 class="animated wow fadeInRight" data-wow-delay=".5s">
				<a href="index2.jsp" id="gotoHomePage">Home</a><label>/</label>Reviews
			</h3>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--content-->
	<div class="product">
		<div class="container">
			<div class="col-md-3 product-bottom">
				<!--categories-->
				<div class="categories animated wow fadeInUp animated"
					data-wow-delay=".5s">
					<h3>Categories</h3>
					<ul class="cate">
						<li><i class="glyphicon glyphicon-menu-right"></i><a
							href="products.html">Best Selling</a> <span>(15)</span></li>
						<li><i class="glyphicon glyphicon-menu-right"></i><a
							href="products.html">Man</a> <span>(16)</span></li>
						<ul>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">Accessories</a> <span>(2)</span></li>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">Coats &amp; Jackets</a> <span>(5)</span></li>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">Jeans</a> <span>(1)</span></li>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">New Arrivals</a> <span>(0)</span></li>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">Suits</a> <span>(1)</span></li>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">Casual Shirts</a> <span>(0)</span></li>
						</ul>
						<li><i class="glyphicon glyphicon-menu-right"></i><a
							href="products.html">Sales</a> <span>(15)</span></li>
						<li><i class="glyphicon glyphicon-menu-right"></i><a
							href="products.html">Woman</a> <span>(15)</span></li>
						<ul>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">Accessories</a> <span>(2)</span></li>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">New Arrivals</a> <span>(0)</span></li>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">Dresses</a> <span>(1)</span></li>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">Casual Shirts</a> <span>(0)</span></li>
							<li><i class="glyphicon glyphicon-menu-right"></i><a
								href="products.html">Shorts</a> <span>(4)</span></li>
						</ul>
					</ul>
				</div>
				<!--//menu-->

			</div>
			
			<div class="col-md-9 animated wow fadeInRight" data-wow-delay=".5s">
			<%for (int i=0; i<reviewList.size(); i++) { %>
				<div class="mid-popular">
				<div class="col-sm-12 item-grid item-gr  simpleCart_shelfItem">
							<div class="grid-pro ">
								<div class="women">
									<h5><%=reviewList.get(i).getSellerName() %></h5>
									<h6><%=reviewList.get(i).getRatings() %></h6>
									<p ><em class="item_price"><%if (!reviewList.get(i).getComments().isEmpty()){%>
																<%=reviewList.get(i).getComments() %>
																<%}else {%>No comments added.<% }%>
									</em></p>
									
								</div>
							</div>
						</div>
						
					<div class="clearfix"></div>
				</div>
				<% } %>
				<a href="editreviews.jsp" data-text="Edit it" class="but-hover1 item_add" style="float: right; margin-right : 12px">Edit Comments</a>
			</div>


		</div class="clearfix">
	</div>
	</div>
	</div>
	<!--//products-->

	<%@include file="footer.jsp"%>
</body>
</html>