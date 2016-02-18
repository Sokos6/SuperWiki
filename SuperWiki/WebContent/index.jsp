<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
	<p>Logged in as: ${user.username}</p>
	<form action = "select.do">
		<input type = "text" name = "text" placeholder = "search by name"/>
		<input type = "submit" value = "Submit"/>
	</form>
	<a href="allCharacters.do">All Characters</a>
	<a href="allSuperheroes.do">Superheroes</a>
	<a href="allVillains.do">Villains</a>
	<a href="addSuperhero.do">Add Character</a>
	<a href="login.do">Login</a>
	<a href="logout.do">Logout</a>
	<%-- <a href="logout.do?username=${user.username}&password=${user.password}">Logout</a> --%>
	<a href="profile.do">My Account</a>
	<a href="addUser.do">Register</a>
	
</body>
</html>