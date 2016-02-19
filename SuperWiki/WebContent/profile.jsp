<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="_head.jsp"></jsp:include>
<title>Profile | SuperWiki</title>
</head>
<body>
<div id="wrapper">
	<p>Logged in as: ${user.username}</p>
	<p>Favorite Characters</p>
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
	<c:if test="${admin}">
		<p>Users</p>
		<table>
		<c:forEach var="eachUser" items="${users}">
			<tr>
				<td>${eachUser.username}</td>
				<c:if test="${eachUser.id != 1 && eachUser.id != 7 && eachUser.id != 8 && eachUser.id != 9}">
					<td><form action="deleteUser.do" method="post"><input type="hidden" name="deleteUserid" value="${eachUser.id}"> 
					<input type="submit" value="Delete"></form></td>
				</c:if>
			</tr>
		</c:forEach>
		</table>
	</c:if>
	<a href="index.jsp">HOME</a>
<jsp:include page="_footer.jsp"></jsp:include>
</div>
</body>
</html>