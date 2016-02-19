<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- <jsp:include page="_head.jsp"></jsp:include> --%>
<title>Login</title>
</head>
<body>
<%-- <jsp:include page="_nav.jsp"></jsp:include> --%>
	<form action = "login.do" method = "GET">
		<input type= "text" name ="username" placeholder = "username"/>
		<input type= "password" name ="password" placeholder = "password"/>	
		<input type = "submit" value = "Login"/>	
	</form>
<%-- <jsp:include page="_footer.jsp"></jsp:include> --%>
</body>
</html>