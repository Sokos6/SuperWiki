<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		<input type="radio" name="good" value="true">superhero
		<input type="radio" name="good" value="false">villain
		<input type = "submit" value = "Create"/>
	</form>
</body>
</html>