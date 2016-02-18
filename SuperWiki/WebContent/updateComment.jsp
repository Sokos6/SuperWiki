<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>Logged in as: ${user.username}</p>
	<p>${result.name}</p>
	<p>${result.alias}</p>
	<p>${result.creator }</p>
	<p>${result.firstAppearance }</p>
	<p>${result.team.name }</p>
	<p>${result.origin }</p>
	<p>${result.publisher }</p>
	<br>
	<a href="updateCharacter.do?id=${result.id }">Update</a>
		<table>
		<td>${comment.user.username}</td>
		<td><form action="updateComment.do" method="POST">
									<input type="hidden" name="commentid" value="${comment.id }"><input
										type="hidden" name="superPersonID" value="${result.id }" />
										<textarea cols="100" rows="5" name="message">${comment.message }</textarea>
										<input type="submit" value="Post" />
								</form></td>
		</table>
</body>
</html>