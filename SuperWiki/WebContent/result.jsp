<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${result.name}</title>
</head>
<body>
	<p>Logged in as: ${user.username}</p>
	<img src="${result.image }" alt="${result.name }"/>
	<p>${result.name}</p>
	<p>${result.alias}</p>
	<p>${result.creator }</p>
	<p>${result.firstAppearance }</p>
	<p>${result.team.name }</p>
	<p>${result.origin }</p>
	<p>${result.publisher }</p>
	<br>
	<a href="updateCharacter.do?id=${result.id }">Update</a>
	<c:if test="${! empty result.comments}">
		<table>
			<c:forEach var="comment" items="${result.comments }">
				<tr>
					<td>${comment.user.username}</td>
					<td>${comment.message }</td>
					<c:choose>
						<c:when test="${admin }">
							<td><form action="deleteComment.do" method="POST">
									<input type="hidden" name="commentid" value="${comment.id }"><input
										type="hidden" name="superPersonID" value="${result.id }" /><input
										type="submit" value="Delete">
								</form></td>
								<td><form action="updateComment.do" method="GET">
									<input type="hidden" name="commentid" value="${comment.id }"><input
										type="hidden" name="superPersonID" value="${result.id }" /><input
										type="submit" value="Update">
								</form></td>
						</c:when>
						<c:when test="${user.id == comment.user.id }">
							<td><form action="deleteComment.do" method="POST">
									<input type="hidden" name="commentid" value="${comment.id }">
									<input type="hidden" name="superPersonID" value="${result.id }" />
									<input type="submit" value="Delete">
								</form></td>
								<td><form action="updateComment.do" method="GET">
									<input type="hidden" name="commentid" value="${comment.id }"><input
										type="hidden" name="superPersonID" value="${result.id }" /><input
										type="submit" value="Update">
								</form></td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
	</c:if >
	<form action="addComment.do" method="POST">
		<input type="hidden" name="superPersonID" value="${result.id }" />
		Comment:
		<textarea cols="100" rows="5" name="message"></textarea>
		<input type="submit" value="Post" />
	</form>
	<form action="addFav.do" method="POST">
		<input type="submit" value="favorite" /> <input type="hidden"
			name="selectionid" value="${result.id}" />
	</form>
</body>
</html>