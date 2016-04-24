<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login error page</title>
</head>
<body>
<%@ include file="login.jsp" %>
<script>
$(window).load(function(){
	$(document).ready(function(){
		var appendString = "<div class=\"login-do1 removeIfLoggedIn\" data-wow-delay=\".5s\">" +
							"<p>Sorry, USERNAME / PASSWORD mismatch found</p></div>";
		console.log("appending string before form : " + appendString);
		$(appendString).insertBefore(".form");
	});
});
</script>
</body>
</html>