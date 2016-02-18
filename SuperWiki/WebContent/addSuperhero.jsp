<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Character</title>
</head>
<body>
	<p>Logged in as: ${user.username}</p>
	<form action="addSuperhero.do" method="post">

			Name:<input type="text" name="name" />
		<br>
			Alias:<input type = "text" name = "alias"/>
		<br>
			Creator<input type="text" name="creator"/>
			First Appearance:<input type="text" name="firstAppearance" />
		<br>
			Origin:<textarea rows="4" cols="100" name="origin"></textarea>
		<br>
			Publisher:<input type="text" name="publisher" />
		<br>
		<input type="radio" name="good" value="true" checked = "checked">superhero
		<input type="radio" name="good" value="false">villain
		<input type = "submit" value = "Create"/>
	</form>
</body>
</html>