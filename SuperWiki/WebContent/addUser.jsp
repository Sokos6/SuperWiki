<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>
<body>
	<form action="addUser.do" method="post">

		Username: <input type = "text" name = "username"/>
		Password: <input type = "password" name = "password"/>
		Email: <input type = "text" name = "email"/>
		<input type = "submit" value = "Create"/>
	</form>
</body>
</html>