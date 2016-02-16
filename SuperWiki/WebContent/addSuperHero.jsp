<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="addSuperHero.do" method="post">

			Name:<input type="text" name="name" />
		<br>
			Team:<input type="text" name="team">
		<br>
			Appearance:<textarea rows="4" cols="100"></textarea>
			<br>
			Costume:<textarea rows="4" cols="100"></textarea>
		<br>
		<input type="checkbox" name="superPersonType.superType" value="superhero">superhero
		<input type="checkbox" name="superPersonType.superType" value="villain">villain
	</form>
</body>
</html>