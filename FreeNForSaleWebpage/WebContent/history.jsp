<!DOCTYPE html>
<html>
<body>
	<%@include file="header.jsp"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="java.util.List"%>
	<%@page import="java.lang.Integer"%>
	<%@page import="jsp.servlet.mvc.bean.ViewCartBean"%>
	<%@page import="jsp.servlet.mvc.bean.CartBean"%>
	<%@page import="com.sun.jersey.api.client.Client"%>
	<%@page import="com.sun.jersey.api.client.ClientResponse"%>
	<%@page import="com.sun.jersey.api.client.GenericType"%>
	<%@page import="com.sun.jersey.api.client.WebResource"%>
	<%@page import="javax.ws.rs.core.MediaType"%>
	<%@page import="java.util.HashMap"%>
	<%@page import="com.sun.jersey.api.client.filter.LoggingFilter"%>
	<%
		System.out.println("History Rest Get call...");
		Boolean status = true;
		List<ViewCartBean> historyList = new ArrayList<ViewCartBean>();
		try {
			CartBean bean = new CartBean();
			bean.setUserId(Integer.parseInt(UId));

			Client client = Client.create();
			client.addFilter(new LoggingFilter());
			WebResource webResource = client.resource(
					"https://localhost:8443/FreeNForSaleServices/rest/TransactionService/getTransactionHistory");

			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
					.accept(MediaType.APPLICATION_JSON).post(ClientResponse.class, bean);

			if (restResponse.getStatus() != 200) {
				status = false;
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}

			historyList = restResponse.getEntity(new GenericType<List<ViewCartBean>>() {
			});
			System.out.println(historyList.get(0).getSellerName());

		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
	%>
	<!--banner-->
	<div class="banner-top">
		<div class="container">
			<h2 class="animated wow fadeInLeft" data-wow-delay=".5s">SHOPPING HISTORY</h2>
			<h3 class="animated wow fadeInRight" data-wow-delay=".5s">
				<a href="index2.jsp" id="gotoHomePage">Home</a><label>/</label>Shopping
				History
			</h3>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--content-->
	<div class="product">
		<div class="container">


			<div class="col-md-9 animated wow fadeInRight" data-wow-delay=".5s">
				<div class="mens-toolbar">
					<p class="showing">
						Sorting By : <a href="javascript:void(0)" id="sort">Name</a>
					</p>
					<div class="clearfix"></div>
				</div>
				<script>
					function sortTable() {
						console.log("inside sort table");
						var rows = $('.table tbody  tr').get();

						rows.sort(function(a, b) {

							var A = $(a).find('.inventoryName').eq(0).text()
									.toUpperCase();
							var B = $(b).find('.inventoryName').eq(0).text()
									.toUpperCase();

							if (A < B) {
								return -1;
							}

							if (A > B) {
								return 1;
							}

							return 0;

						});
						console.log("going to print sorted table");
						$.each(rows, function(index, row) {
							$('.table').children('tbody').append(row);
						});
					}

					$(document).ready(function() {
						$("#sort").on("click", function() {
							console.log("sortTable clicked");
							sortTable();
						});
						$(".itemId").hide();
					});
				</script>


				<div class="mid-popular">
					<table class="table">
						<tbody>
							<%
								for (int i = 0; i < historyList.size(); i++) {
							%>

							<tr>
								<td>
									<div class="col-sm-4 item-grid item-gr  simpleCart_shelfItem">
										<div class="grid-pro">
											<div class=" grid-product ">
												<figure>
													<!--  <a href="single.jsp" class="showSingleItem"> -->
													<div class="grid-img">
														<%
															if (historyList.get(i).getImage() != null) {
														%>
														<img src="<%=historyList.get(i).getImage()%>"
															class="img-responsive"
															alt="<%=historyList.get(i).getItemName()%>" />
														<%
															} else {
														%>
														<img src="images/image_not_available.png"
															class="img-responsive" alt="Image not available" />
														<%
															}
														%>
													</div>
													<!-- </a> -->
												</figure>
											</div>

											<div class="women">
											<h4 class="inventoryName">
											<%=historyList.get(i).getItemName()%>
											</h4>
												<h6>
													Seller:
													<%=historyList.get(i).getSellerName()%>
												</h6>
												<p>
													<em class="item_price">Quantity: <%=historyList.get(i).getQuantity()%>&nbsp;</em><br/>
													<em class="item_price">Price : $<%=historyList.get(i).getAmount()%></em>
												</p>
												<p>
													<em class="item_price">Purchase Date: <%=historyList.get(i).getTransactionTime()%></em>
												</p>

											</div>

										</div>
									</div>
								</td>


							</tr>

							<%
								}
							%>
						</tbody>
					</table>

					<div class="clearfix"></div>
				</div>
			</div>


		</div class="clearfix">
	</div>
	</div>
	</div>
	<!--//products-->

	<%@include file="footer.jsp"%>
</body>
</html>