<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<c:forEach var="results" items="${result}">
		<tr>
			<td><a href="selectID.do?id=${results.id}">${results.name}</a></td>
			<td>${results.alias}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>