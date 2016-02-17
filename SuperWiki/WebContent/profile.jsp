<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<body>
	<p>Logged in as: ${user.username}</p>
	<table>
	<c:forEach var="results" items="${user.favorites}">
		<tr>
			<td><a href="selectID.do?id=${results.superPerson.id}">${results.superPerson.name}</a></td>
			<td>${results.superPerson.alias}</td>
			<td><form action="deleteFavorite.do" method="post"><input type="hidden" name="deleteid" value="${results.superPerson.id }"> 
			<input type="submit" value="Delete"></form>
		</tr>
	</c:forEach>
	</table>
	<a href="index.html">HOME</a>
	<c:if test="${admin}">
		<table>
		<c:forEach var="eachUser" items="${users}">
			<tr>
				<td><a href="selectID.do?userid=${eachUser.id}">${eachUser.username}</a></td>
				<td>${results.superPerson.alias}</td>
				<td><form action="deleteUser.do" method="post"><input type="hidden" name="deleteUserid" value="${eachUser.id}"> 
				<input type="submit" value="Delete"></form>
			</tr>
		</c:forEach>
		</table>
	</c:if>
</body>
</html>