<!DOCTYPE html>
<html>
<body>
<%-- 	<%@include file="header.jsp"%> --%>
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
	List<ReviewBean> reviews = new ArrayList<ReviewBean>();
	int size = Integer.parseInt(session.getAttribute("size").toString()); 
	for (int i =0; i<size; i++){
		ReviewBean review = new ReviewBean();
		review.setUserId(Integer.parseInt(session.getAttribute("uid").toString()));
		review.setSellerName(request.getParameter("sellername"+i));
		review.setSellerId(Integer.parseInt(request.getParameter("sellerId"+i)));
		review.setRatings(Integer.parseInt(request.getParameter("rating"+i)));
		review.setComments(request.getParameter("comment"+i));
		reviews.add(review);
		System.out.println(request.getParameter("sellerId"+i));
		System.out.println(request.getParameter("sellername"+i));
		System.out.println(request.getParameter("rating"+i));
		System.out.println(request.getParameter("comment"+i));
	}
	try {
		
		Client client = Client.create();
		WebResource webResource = client.resource("https://localhost:8443/FreeNForSaleServices/rest/ReviewServices/saveReviews");
		
		ClientResponse restResponse = webResource.header("secretKey", "1234567890")
		    .accept(MediaType.APPLICATION_JSON)
		    .post(ClientResponse.class,reviews);
		
		
		if (restResponse.getStatus() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
		}
		Map<Integer, ReviewBean> reviews_return = restResponse.getEntity(new GenericType<Map<Integer,ReviewBean>>(){});
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	request.getRequestDispatcher("review.jsp").forward(request, response);
	
	%>
	
	
<%-- 	<%@include file="index2.jsp"%> --%>
</body>
</html>