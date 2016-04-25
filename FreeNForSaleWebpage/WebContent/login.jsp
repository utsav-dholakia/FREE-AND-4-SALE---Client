<!DOCTYPE html>
<html>
<body>
	<%@include file="header.jsp" %>
	
<!--banner-->
<div class="banner-top">
	<div class="container">
		<h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Login</h2>
		<h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index2.jsp" id="gotoHomePage">Home</a><label>/</label>Login</h3>
		<div class="clearfix"> </div>
	</div>
</div>
<!-- contact -->
	<div class="login">
		<div class="container">
		<form action="SessionControllerServlet" method= "post" class="form">
			<div class="col-md-6 login-do1 animated wow fadeInLeft" data-wow-delay=".5s">
				<div class="login-mail">
					<input type="text" placeholder="UserName" name="name" required="">
					<i class="glyphicon glyphicon-envelope"></i>
				</div>
				<div class="login-mail">
					<input type="password" placeholder="Password" name="password" required="">
					<i class="glyphicon glyphicon-lock"></i>
				</div>
			</div>
			<div class="col-md-6 login-do animated wow fadeInRight" data-wow-delay=".5s">
				<label class="hvr-sweep-to-top login-sub">
					<input type="submit" value="login">
					</label>
					<p>Do not have an account?</p>
				<a href="register.jsp" class="hvr-sweep-to-top">Signup</a>
			</div>
			<div class="clearfix"> </div>
		</form>
		</div>
	</div>

	<%@include file="footer.jsp" %>
</body>
</html>