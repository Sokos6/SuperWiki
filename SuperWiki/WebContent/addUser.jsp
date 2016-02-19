<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="_head.jsp"></jsp:include>
<title>Register | SuperWiki</title>
</head>
<body>
<jsp:include page="_nav.jsp"></jsp:include>
	<form action="addUser.do" method="post">

		Username: <input type = "text" name = "username"/>
		Password: <input type = "password" name = "password"/>
		Email: <input type = "text" name = "email"/>
		<input type = "submit" value = "Create"/>
	</form>
<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>