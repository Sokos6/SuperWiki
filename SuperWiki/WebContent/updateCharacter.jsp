<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="_head.jsp"></jsp:include>
<title>Update ${character.name}</title>
</head>
<body>
<jsp:include page="_nav.jsp"></jsp:include>
	<p>Logged in as: ${user.username}</p>
	<form action="updateCharacter.do" method="post">
	<input type="hidden" name="id" value="${character.id }"/>
			Name:<input type="text" name="name" value="${character.name}"/>
		<br>
			Alias:<input type = "text" name = "alias" value="${character.alias}"/>
		<br>
			Creator<input type="text" name="creator" value="${character.creator }"/>
			First Appearance:<input type="text" name="firstAppearance" value="${character.firstAppearance }"/>
		<br>
			Origin:<textarea rows="4" cols="100" name="origin">${character.origin} </textarea>
		<br>
		Publisher:<input type="text" name="publisher" value="${character.publisher }"/>
		<br>
		<input type="radio" name="good" value="true">superhero
		<input type="radio" name="good" value="false">villain
		<input type = "submit" value = "Update"/>
	</form>
<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>