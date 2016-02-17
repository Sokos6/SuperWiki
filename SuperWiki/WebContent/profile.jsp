<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IIn Profile</title>
</head>
<body>
	<table>
<%-- 	<h1>${user}</h1>
 --%>	<c:forEach var="results" items="${user.favorites}">
		<tr>
			<td><a href="selectID.do?id=${results.superPerson.id}">${results.superPerson.name}</a></td>
			<td>${results.superPerson.alias}</td>
		</tr>
	</c:forEach>
	</table>
	<a href = "index.html">home</a>
</body>
</html>