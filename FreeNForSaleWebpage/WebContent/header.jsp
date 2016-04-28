<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>FreeNForSale</title>
<%@page import="jsp.servlet.mvc.bean.LoginBean"%>
<%@page language="java" session="false" %>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Classic Style Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/jquery.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<!-- animation-effect -->
<link href="css/animate.min.css" rel="stylesheet">
<script src="js/wow.min.js"></script>
<script>
	new WOW().init();
</script>
<!-- //animation-effect -->
<link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,300,700,900'
	rel='stylesheet' type='text/css'>
</head>

<body>
	<!-- header -->
	<div class="header">
		<div class="header-grid">
			<div class="container">
				<div class="header-left animated wow fadeInLeft"
					data-wow-delay=".5s">
					<div class="navbar-brand logo-nav-left ">
						<h2 class="animated wow pulse" data-wow-delay=".5s">
							<a href="index2.jsp" class="gotoHomePage">Free<span> N For Sale</span></a>
						</h2>
					</div>
					
				</div>
<% 
	String name = null;
	String UId = null;
	HttpSession session = request.getSession(false);
	if(session != null)		
	{	
		name=(String)session.getAttribute("USER");
		UId=(String)session.getAttribute("UID");
		LoginBean bean=(LoginBean)request.getAttribute("loginbean");
		out.println("Session is set");
	}
	else if( session == null)
	{
		out.println("Session not set yet");
	}
%>	
<script>
	var name = "<%=name%>";
	console.log("Inside header script, name = " + name);
	if(name != "null")
	{	
		console.log("name received = " + name);
		$(document).ready(function(){
			$(".toggleWhenLoggedIn").hide();
			$("#appendUserNameHere").text("Welcome  " + name + "!");
			$(".toggleWhenLoggedOut").show();
			$("#profileUserName").text(name);
			$(".removeIfLoggedIn").remove();
		});	
	}
	else
	{
		console.log("Inside header script, name is not set");
		$(window).load(function(){
		$(document).ready(function(){
				$(".toggleWhenLoggedOut").hide();	
		});
		});
	}
	$(document).ready(function(){
		$(".categoryName").on("click",function(){
			var value = $(this).text();
			
			if(value == "Furniture")
				value = 1;
			else if(value == "Clothing,Shoes & Jewelry")
				value = 2;
			else if(value == "Books")
				value = 3;
			else if(value == "Cars")
				value = 4;
			else if(value == "Electronics")
				value = 5;
			else if(value == "Promotions")
				value = 6;
			else if(value == "Cosmetics")
				value = 7;
			else if(value == "Other")
				value = 8;
			
			var sendData = {};
			sendData.categoryId = value;
			console.log("sendData : " + sendData.categoryId);
			$.ajax({
				type: "POST",
				url: "https://localhost:9443/FreeNForSaleWebpage/InventoryByCategoryServlet",
				data: JSON.stringify(sendData)
			});
		});
		$(".gotoHomePage").on("click",function(){
			$.ajax({
				type:  "GET",
				url: "https://localhost:9443/FreeNForSaleWebpage/InventoryControllerServlet"
			});
		});
		$("#toggleLoggedInState").on("click",function(){
			$.ajax({
				 type: "GET",
				 url: "https://localhost:9443/FreeNForSaleWebpage/SessionControllerServlet"
			});
		});
		$("#checkout").on("click",function(){
			$.ajax({
				 type: "GET",
				 url: "https://localhost:9443/FreeNForSaleWebpage/CartControllerServlet"
			});
		});
		/* $("#review").on("click",function(){
			$.ajax({
				 type: "GET",
				 url: "https://localhost:9443/FreeNForSaleWebpage/ReviewControllerServlet"
			});
		}); */
	});
	
	
</script>				
		<div class="header-right animated wow fadeInRight col-sm-3" data-wow-delay=".5s">
		<div class="header-right1">
			<ul id="appendUserName">
				<li class="toggleWhenLoggedIn"><i class="glyphicon glyphicon-log-in"></i>
				<a class="loginLink" href="login.jsp">Login</a></li>
				<li class="toggleWhenLoggedIn"><i class="glyphicon glyphicon-book"></i>
				<a class="loginLink" href="register.jsp">Register</a></li>
				<li id="appendUserNameHere"></li>
			</ul>
		</div>
		</div>
		<div class="clearfix"></div>
			</div>
		</div>
		<div class="container">
			<div class="logo-nav">
				<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<form action = "SearchControllerServlet" method = "post">
					<div class="navbar-header nav_2" style="margin-top:10px;">
						<input class="form-inline" name="itemName" id="search" placeholder="Search Product" type="text" size="50"/>
						<input type="submit" class="form-inline btn btn-success" id="searchbutton" value="Search"/>
					</div>
					</form>
					
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav col-sm-3">
							<li><a href="index2.jsp" class="gotoHomePage">Home</a></li>
							<!-- Mega Menu -->
							<!-- <li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Categories <b class="caret"></b></a>
								<ul class="dropdown-menu multi" style="left:-400%;width:600px;">
									<div class="row">
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>Heavy Products</h6>
												<li><a href="javascript:void(0)" class="categoryName">Furniture</a></li>
												<li><a href="javascript:void(0)" class="categoryName">Cars</a></li>
												<li><a href="javascript:void(0)" class="categoryName">Electronics</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>Small Products</h6>
												<li><a href="javascript:void(0)" class="categoryName">Books</a></li>
												<li><a href="javascript:void(0)" class="categoryName">Promotions</a></li>
												<li><a href="javascript:void(0)" class="categoryName">Other</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>Consumer Goods</h6>
												<li><a href="javascript:void(0)" class="categoryName">Clothing,Shoes & Jewelry</a></li>
												<li><a href="javascript:void(0)" class="categoryName">Cosmetics</a></li>
												<li><a href="javascript:void(0)" class="categoryName">Jewellery</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
									</ul></li> -->
									<li class="dropdown toggleWhenLoggedOut">
										<a href="#" class="dropdown-toggle"
										data-toggle="dropdown" id="profileUserName"></a>
											<ul class="dropdown-menu multi" style="left:-130%">
												<div class="row">
													<div class="col-sm-2">
														<ul class="multi-column-dropdown">
															<li><a href="profile.jsp" id="userProfile">User Profile</a></li>
															<li><a href="checkout.jsp" id="checkout">Cart</a></li>
															<li><a href="history.jsp" id="history">Shopping History</a></li>
															<li><a href="review.jsp" id="review">Review</a></li>
															<li><a href="index2.jsp" id="toggleLoggedInState">Sign Out</a></li>
														</ul>
													</div>
													<div class="clearfix"></div>
												</div>
											</ul>
									</li>
						</ul>
					</div>
				</nav>
			</div>

		</div>
	</div>
	<!-- //header -->
	
</body>
</html>