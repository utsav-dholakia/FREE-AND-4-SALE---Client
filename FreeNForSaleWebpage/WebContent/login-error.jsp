<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login error page</title>
</head>
<body>
<script>
	$(document).ready(function()
	{
		$("<p>Sorry, USERNAME / PASSWORD mismatch found</p>").insertBefore(".form");
	});
</script>
<%@ include file="login.jsp" %>
</body>
</html>