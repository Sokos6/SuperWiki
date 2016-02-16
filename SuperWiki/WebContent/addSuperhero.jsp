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
<!-- 			Team:<input type="text" name="team"/> -->
			Creator<input type="text" name="creator"/>
<!-- 			Created:<input type="text" name="created"/> -->
		<br>
			Appearance:<textarea rows="4" cols="100" name="appearance"></textarea>
			<br>
			Costume:<textarea rows="4" cols="100" name="costume"></textarea>
		<br>
		<input type="radio" name="good" value="true">superhero
<		<input type="radio" name="good" value="false">villain
		<input type = "submit" value = "Create"/>
	</form>
</body>
</html>