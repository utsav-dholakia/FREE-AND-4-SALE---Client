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
							<a href="index2.jsp">Free<span> N For Sale</span></a>
						</h2>
					</div>
					
				</div>
<script>
	$(document).ready(function(){
		$(".category_name").on("click",function(){
			var value = $(this).text();
			var sendData = {};
			sendData.name = value;
			console.log("sendData : " + sendData.name);
			$.ajax({
				type: "POST",
				url: "https://localhost:9443/FreeNForSaleWebpage/InventoryByCategoryServlet",
				data: JSON.stringify(sendData)
			});
		});
	});
</script>
<% 
	String name = null;
	if(session != null)		
	{
		name=(String)session.getAttribute("USER");
		LoginBean bean=(LoginBean)request.getAttribute("bean");
		out.println("Session is set");
	}
	else if( session == null || (request.getAttribute("USER") == "-1"))
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
			$("<li>Welcome "+name+"!</li>").insertBefore("#appendUserNameBeforeThis");
			$(".toggleWhenLoggedOut").show();
			$("#profileUserName").text(name);
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
	
</script>				
				<div class="header-right animated wow fadeInRight"
				data-wow-delay=".5s">
				<div class="header-right1 ">
					<ul id="appendUserName">
						<li class="toggleWhenLoggedIn"><i class="glyphicon glyphicon-log-in"></i>
						<a class="loginLink" href="login.jsp">Login</a></li>
						<li class="toggleWhenLoggedIn"><i class="glyphicon glyphicon-book"></i>
						<a class="loginLink" href="register.jsp">Register</a></li>
						<li id="appendUserNameBeforeThis"><a href="contact.jsp">Contact Us</a></li>
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
					<div class="navbar-header nav_2">
						<input class="form-control" id="search" placeholder="Search Product" type="text" size="50"></input>
					</div>
					
					<script>
					$(document).ready(function(){
						$(".category_name").on("click",function(){
							  var value = $(this).text();
								 var sendData = {};
								 sendData.name = value;
								 alert("button clicked");
								 console.log("sendData : " + sendData.name);
								 $.ajax({
									  type: "POST",
									  url: "https://localhost:9443/FreeNForSaleWebpage/InventoryByCategoryServlet",
									  data: JSON.stringify(sendData)
									});
						 });
						
						$("#toggleLoggedInState").on("click",function(){
							$.ajax({
								  type: "GET",
								  url: "https://localhost:9443/FreeNForSaleWebpage/SessionControllerServlet"
								});
						});
					});
					
					</script>
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav">
							<li><a href="index2.jsp" class="act">Home</a></li>
							<!-- Mega Menu -->
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Categories <b class="caret"></b></a>
								<ul class="dropdown-menu multi">
									<div class="row">
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>Heavy Products</h6>

												<li><a href="javascript:void(0)" class="category_name">Furniture</a></li>
												<li><a href="javascript:void(0)" class="category_name">Cars</a></li>
												<li><a href="javascript:void(0)" class="category_name">Electronics</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>Consumer Goods</h6>
												<li><a href="javascript:void(0)" class="category_name">Clothing,Shoes & Jewelry</a></li>
												<li><a href="javascript:void(0)" class="category_name">Cosmetics</a></li>
												<li><a href="javascript:void(0)" class="category_name">Jewellery</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>Small Products</h6>
												<li><a href="javascript:void(0)" class="category_name">Books</a></li>
												<li><a href="javascript:void(0)" class="category_name">Promotions</a></li>
												<li><a href="javascript:void(0)" class="category_name">Other</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
									</ul></li>
									<!--  <div class="row-top">
										<div class="col-sm-6 row1">
											<a href="products.html"><img src="images/me.jpg" alt=""
												class="img-responsive"></a>
										</div>
										<div class=" col-sm-6 row2">
											<a href="products.html"><img src="images/me1.jpg" alt=""
												class="img-responsive"></a>
										</div>
										<div class="clearfix"></div>
									</div>  -->
									<li class="dropdown toggleWhenLoggedOut">
										<a href="#" class="dropdown-toggle"
										data-toggle="dropdown"><label id="profileUserName"></label><b class="caret"></b></a>
											<ul class="dropdown-menu multi">
												<div class="row">
													<div class="col-sm-4">
														<ul class="multi-column-dropdown">
															<li><a href="profile.jsp">User Profile</a></li>
															<li><a href="history.jsp">Shopping History</a></li>
															<li><a href="review.jsp">Review</a></li>
															<li><a href="index2.jsp" id="toggleLoggedInState">Sign Out</a></li>
														</ul>
													</div>
													<div class="clearfix"></div>
												</div>
											</ul>
									</li>
									<li class="toggleWhenLoggedOut">
										<a href="checkout.jsp">
										Cart<img src="images/cart.png" alt="Cart" />
										</a>
										<div class="clearfix"></div>
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