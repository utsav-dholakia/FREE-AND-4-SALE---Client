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
	<%@page import="com.sun.jersey.api.client.filter.LoggingFilter"%>
		<%@page import="java.text.SimpleDateFormat"%>

	<%@page import="java.util.Date"%>

	<%
		System.out.println("View Profie Get call...");
		Boolean status = true;
		RegisterBean registerBean = new RegisterBean();		
		String bdate="";
		String yyyy="";
		String mm="";
		String dd="";
		try {
			LoginBean bean = new LoginBean();
			bean.setName(name);

			Client client = Client.create();
			client.addFilter(new LoggingFilter());

			WebResource webResource = client.resource(
					"https://localhost:8443/FreeNForSaleServices/rest/profileservices/getprofile");

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
			Date date=df.parse(bdate);
			// yyyy=String.valueOf(date.getYear());
			//mm=String.valueOf(date.getMonth());
			//dd=String.valueOf(date.getDay()); 
			
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
	%>
	<!--banner-->
	<div class="banner-top">
		<div class="container">
			<h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Edit User Profile</h2>
			<h3 class="animated wow fadeInRight" data-wow-delay=".5s">
				<a href="index2.jsp" id="gotoHomePage">Home</a><label>/</label>Edit User Profile
			</h3>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- contact -->
	<div class="login">
		<div class="container">
			<form action="ProfileControllerServlet" method="post">
				<div class="col-md-6 login-do1 animated wow fadeInLeft"
					data-wow-delay=".5s">
					
					<div class="login-mail">
						<input type="password" placeholder="Password*" name="password" value=<%=registerBean.getPassword() %> 
							required=""> <i class="glyphicon glyphicon-lock"></i>
					</div>
										<input type="hidden" name="state" value="12">
					
					<input type="hidden" name="uid" value="<%=UId%>">
					<div class="login-mail">
						<input type="text" placeholder="Name*" name="name" required="" value=<%=registerBean.getName() %> >
					</div>
<!-- 					Date of Birth: -->
<!-- 					<div id="bdate" class="datefield"> -->
					<input id="year" type="hidden" maxlength="4" name="year" placeholder="YYYY" required="" value="1990" /> 
				    <input id="month" type="hidden" maxlength="2" name="day" placeholder="DD" required="" value="11"  /> 
				    <input id="day" type="hidden" maxlength="2" name="month" placeholder="MM" required="" value=12 />
						
<!-- 					</div> -->
<!-- 					<br /> -->
					<br />
					<div class="login-mail">
						<input type="text" placeholder="Email*" name="email" required="" value=<%=registerBean.getEmail() %> 
							maxlength="30"> <i class="glyphicon glyphicon-envelope"></i>
					</div>
					<div class="login-mail">
						<input type="text" placeholder="Phone Number*" name="phone" value=<%=registerBean.getPhone() %> 
							required="" maxlength="10">
					</div>
					Address:<br />
					<br />
					<div class="login-mail">
						<input type="text" placeholder="Street Address" name="street" value=<%=registerBean.getStreet() %> 
							maxlength="25" required="">
					</div>
					<div class="login-mail">
						<input type="text" placeholder="City" name="city" maxlength="15" value=<%=registerBean.getCity() %> 
							required="">
					</div>
				
					<div class="login-mail">
						<input type="text" placeholder="Zipcode" name="zipcode" value=<%=registerBean.getZipcode() %> 
							maxlength="6" required="">
					</div>
					<!-- Sex: <select name="sex" id="sex" required="">
						<option value="M">Male</option>
						<option value="F">Female</option>
						<option value="O">Other</option>
					</select> <br /> -->
					<br />
					<div class="login-mail">
						<input type="text" placeholder="SSN" name="ssn" maxlength="10" value=<%=registerBean.getSsn() %> 
							required="">
					</div>
					
				</div>
				<div class="col-md-6 login-do animated wow fadeInRight"
					data-wow-delay=".5s">
					<label class="hvr-sweep-to-top login-sub"> <input
						type="submit" value="Submit">
					</label>
				
					
				</div>
				<div class="clearfix"></div>
			</form>
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>