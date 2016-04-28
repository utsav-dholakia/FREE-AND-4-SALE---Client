<!DOCTYPE html>
<html>
<body>
	<%@include file="header.jsp"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="java.util.List"%>
	<%@page import="java.lang.Integer"%>
	<%@page import="jsp.servlet.mvc.bean.RegisterBean"%>
	<%@page import="com.sun.jersey.api.client.Client"%>
	<%@page import="com.sun.jersey.api.client.ClientResponse"%>
	<%@page import="com.sun.jersey.api.client.GenericType"%>
	<%@page import="com.sun.jersey.api.client.WebResource"%>
	<%@page import="javax.ws.rs.core.MediaType"%>
	<%@page import="java.util.HashMap"%>
	<%@page import="java.text.SimpleDateFormat"%>

	<%@page import="java.util.Date"%>

	<%@page import="com.sun.jersey.api.client.filter.LoggingFilter"%>

	<%
		System.out.println("View Profie Get call...");
		Boolean status = true;
		RegisterBean registerBean = new RegisterBean();
		String bdate="";
		try {
			LoginBean bean = new LoginBean();
			bean.setName(name);

			Client client = Client.create();
			client.addFilter(new LoggingFilter());

			WebResource webResource = client
					.resource("https://localhost:8443/FreeNForSaleServices/rest/profileservices/getprofile");

			ClientResponse restResponse = webResource.header("secretKey", "1234567890")
					.accept(MediaType.APPLICATION_JSON).post(ClientResponse.class, bean);

			if (restResponse.getStatus() != 200) {
				status = false;
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}

			registerBean = restResponse.getEntity(new GenericType<RegisterBean>() {
			});
			System.out.println(registerBean.getEmail());
			SimpleDateFormat df = new SimpleDateFormat("yyyy dd MM");
			
			long epoch = registerBean.getBdate();
			bdate=df.format(epoch);
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
	%>
	<!--banner-->
	<div class="banner-top">
		<div class="container">
			<h2 class="animated wow fadeInLeft" data-wow-delay=".5s">User
				Profile</h2>
			<h3 class="animated wow fadeInRight" data-wow-delay=".5s">
				<a href="index2.jsp" id="gotoHomePage">Home</a><label>/</label>User
				Profile
			</h3>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- contact -->
	<div class="login">
		<div class="container">
			
				<div class="col-md-6 login-do1 animated wow fadeInLeft"
					data-wow-delay=".5s">
					


					<div class="login-mail">
						<label id="label-1">Name:</label> <p><%=registerBean.getName()%> </p>
												<%-- <input type="text" placeholder="Name*" name="name" required=""
							value=<%=registerBean.getName()%> disabled> --%>
					</div>
					
					<div id="bdate" class="datefield">
						<label id="label-2">BirthDate:</label><p><%=bdate%></p>
					

					</div>
					<br /> <br />
					<div class="login-mail">
						<label id="label-3">Email-Id:</label><p><%=registerBean.getEmail() %></p>
						
					</div>
					<div class="login-mail">
						<label id="label-4">Phone Number:</label>
					<p><%=registerBean.getPhone()%></p>
						
					</div>
					<div class="login-mail">
					<label>Address:</label><p><%=registerBean.getStreet()%></p> 
					</div>
					
					<div class="login-mail">
					<label>City:</label><p><%=registerBean.getCity()%></p>
						
					</div>
					<div class="login-mail">
						<label>Zipcode:</label><p><%=registerBean.getZipcode()%></p>
					
					</div>
					

				</div>
				<div class="col-md-6 login-do animated wow fadeInRight"
					data-wow-delay=".5s">
					<label class="hvr-sweep-to-top login-sub"> <a
						href="editProfile.jsp" class="hvr-sweep-to-top">Edit Profile</a>
				</div>
				<div class="clearfix"></div>
			
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>