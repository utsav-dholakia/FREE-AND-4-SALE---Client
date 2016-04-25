<!DOCTYPE html>
<html>
<body>
	<%@include file="header.jsp" %>
	
	<!--banner-->
<div class="banner-top">
	<div class="container">
		<h2 class="animated wow fadeInLeft" data-wow-delay=".5s">Register</h2>
		<h3 class="animated wow fadeInRight" data-wow-delay=".5s"><a href="index2.jsp" id="gotoHomePage">Home</a><label>/</label>Register</h3>
		<div class="clearfix"> </div>
	</div>
</div>
<!-- contact -->
	<div class="login">
		<div class="container">
		<form action="RegisterControllerServlet" method="post">
			<div class="col-md-6 login-do1 animated wow fadeInLeft" data-wow-delay=".5s">
				<div class="login-mail">
					<input type="text" placeholder="User Name*" name="username" required="" maxlength="25">
				</div>
				<div class="login-mail">
					<input type="password" placeholder="Password*" name="password" required="">
					<i class="glyphicon glyphicon-lock"></i>
				</div>
				<div class="login-mail">
					<input type="text" placeholder="Name*" name="name" required="">
				</div>
				Date of Birth:
				<div id="bdate" class="datefield">
				    <input id="year" type="tel" maxlength="4" name="year" placeholder="YYYY" required=""/> /
				    <input id="month" type="tel" maxlength="2" name="day" placeholder="DD" required=""/> /
				    <input id="day" type="tel" maxlength="2" name="month" placeholder="MM" required=""/>
				</div>
				<br/><br/>
				<div class="login-mail">
					<input type="text" placeholder="Email*" name="email" required="" maxlength="30">
					<i class="glyphicon glyphicon-envelope"></i>
				</div>
				<div class="login-mail">
					<input type="text" placeholder="Phone Number*" name="phone" required="" maxlength="10">
				</div>
				Address:<br/><br/>
				<div class="login-mail">
					<input type="text" placeholder="Street Address" name="street" maxlength="25" required="">
				</div>
				<div class="login-mail">
					<input type="text" placeholder="City" name="city" maxlength="15" required="">
				</div>
				State:
				<select name="state" id="state" size="1" required="">
					<option value="1">Alabama</option>
					<option value="2">Alaska</option>
					<option value="3">Arizona</option>
					<option value="4">Arkansas</option>
					<option value="5">California</option>
					<option value="6">Colorado</option>
					<option value="7">Connecticut</option>
					<option value="8">Delaware</option>
					<option value="9">District Of Columbia</option>
					<option value="10">Florida</option>
					<option value="11">Georgia</option>
					<option value="12">Hawaii</option>
					<option value="13">Idaho</option>
					<option value="14">Illinois</option>
					<option value="15">Indiana</option>
					<option value="16">Iowa</option>
					<option value="17">Kansas</option>
					<option value="18">Kentucky</option>
					<option value="19">Louisiana</option>
					<option value="20">Maine</option>
					<option value="21">Maryland</option>
					<option value="22">Massachusetts</option>
					<option value="23">Michigan</option>
					<option value="24">Minnesota</option>
					<option value="25">Mississippi</option>
					<option value="26">Missouri</option>
					<option value="27">Montana</option>
					<option value="28">Nebraska</option>
					<option value="29">Nevada</option>
					<option value="30">New Hampshire</option>
					<option value="31">New Jersey</option>
					<option value="32">New Mexico</option>
					<option value="33">New York</option>
					<option value="34">North Carolina</option>
					<option value="35">North Dakota</option>
					<option value="36">Ohio</option>
					<option value="37">Oklahoma</option>
					<option value="38">Oregon</option>
					<option value="39">Pennsylvania</option>
					<option value="40">Puerto Rico</option>
					<option value="41">Rhode Island</option>
					<option value="42">South Carolina</option>
					<option value="43">South Dakota</option>
					<option value="44">Tennessee</option>
					<option value="45">Texas</option>
					<option value="46">Utah</option>
					<option value="47">Vermont</option>
					<option value="48">Virginia</option>
					<option value="49">Washington</option>
					<option value="50">West Virginia</option>
					<option value="51">Wisconsin</option>
					<option value="52">Wyoming</option>
				</select>
				<br/><br/>
				<div class="login-mail">
					<input type="text" placeholder="Zipcode" name="zipcode" maxlength="6" required="">
				</div>
				Sex:
				<select name="sex" id="sex" required="">
					<option value="M">Male</option>
					<option value="F">Female</option>
					<option value="O">Other</option>
				</select>
				<br/><br/>
				<div class="login-mail">
					<input type="text" placeholder="SSN" name="ssn" maxlength="10" required="">
				</div>
				<a class="news-letter" href="#">
					<label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>I agree with the terms</label>
				</a>
			</div>
			<div class="col-md-6 login-do animated wow fadeInRight" data-wow-delay=".5s">
				<label class="hvr-sweep-to-top login-sub">
					<input type="submit" value="Submit">
				</label>
				<p>Already registered ?</p>
				<a href="login.jsp" class="hvr-sweep-to-top">Login</a>
			</div>
			<div class="clearfix"> </div>
		</form>
		</div>
	</div>

	<%@include file="footer.jsp" %>
</body>
</html>