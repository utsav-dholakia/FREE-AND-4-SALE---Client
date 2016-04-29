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

	<%	
	int size = Integer.parseInt(session.getAttribute("size").toString());
	Integer[] user = new Integer[size];
	Integer[] seller = new Integer[size];
	String[] sellerName = new String[size];
	Integer[] rating = new Integer[size];
	String[] comment = new String[size]; 
	for(int i =0; i<size; i++ ){
		user[i] = Integer.parseInt(session.getAttribute("userId"+i).toString());
		seller[i] = Integer.parseInt(session.getAttribute("sellerId"+i).toString());
		sellerName[i] = session.getAttribute("sellerName"+i).toString();
		rating[i] = Integer.parseInt(session.getAttribute("rating"+i).toString());
		comment[i] = session.getAttribute("comments"+i).toString();
	}
	request.setAttribute("size", size);
	request.setAttribute("u_id", UId);
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
			
			<form  class="edit_form" action="editController.jsp" method="post">
			<div class="col-md-9 animated wow fadeInRight" data-wow-delay=".5s">
			<%for (int i=0; i<size; i++) { %>
			<div class="mid-popular">
				<div class="col-sm-12 item-grid item-gr  simpleCart_shelfItem">
							<div class="grid-pro ">
								<div class="women">
<%-- 									<h5><input name="userId<%=i%>"  type="hidden" style="width: 180px" value="<%=user[i] %>"></h5> --%>
									<h5><input name="sellerId<%=i%>"  type="hidden" style="width: 180px" value="<%=seller[i] %>"></h5>
									<h5><input name="sellername<%=i%>"  type="text" style="width: 180px" value="<%=sellerName[i] %>"></h5>
									<h6><input name="rating<%=i%>"  type="text" style="width: 180px" value="<%=rating[i] %>"></h6>
									<p ><input name="comment<%=i%>"  type="text" style="width: 180px" 
										value="<%-- <%if (!comment[i].isEmpty()){%> --%> <%=comment[i] %>">
<%-- 																<%}else {%>No comments added."<% }%>> --%>
									</em></p>
									
								</div>
							</div>
						</div>
						
					<div class="clearfix"></div>
				</div>
				<% } %>
			
				
				<input data-text="Add To Cart" style="float: right; margin-right : 12px" type="submit" class="but-hover1 item_add" value="Done Editing" />
				
			</div>
			</form>

		</div class="clearfix">
	</div>
	</div>
	</div>
	<!--//products-->

	<%@include file="footer.jsp"%>
</body>
</html>