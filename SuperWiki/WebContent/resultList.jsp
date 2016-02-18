<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="_head.jsp"></jsp:include>
<title>Character Results | SuperWiki</title>
</head>
<body>
<jsp:include page="_nav.jsp"></jsp:include>
	<p>Logged in as: ${user.username}</p>
	<table>
	<c:forEach var="results" items="${result}">
		<tr>
			<td><a href="selectID.do?id=${results.id}">${results.name}</a></td>
			<td>${results.alias}</td>
		</tr>
	</c:forEach>
	</table>
<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>