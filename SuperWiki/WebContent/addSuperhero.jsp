<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="_head.jsp"></jsp:include>
<title>Add Character | SuperWiki</title>
</head>
<body>
	<jsp:include page="_nav.jsp"></jsp:include>
	<img class="addSupBanner" src="img/hero-banner.jpg"/>
	<h1><a href="#addNew"><span class="label label-warning">ADD YOUR FAVORITE CHARACTER</span></a></h1>
	<div class="formH">
	<a name="addNew"></a>
	<p>Logged in as: ${user.username}</p>
	<form action="addSuperhero.do" method="post">
	<div class="form-group">
			<label for="name">Name: </label> <input type="text"
				class="form-control" id="name" name="name" placeholder="Name">
	</div>
	<div class="form-group">
		<label for="Alias">Alias: </label> <input type="text"
			class="form-control" id="alias" name="aliast" placeholder="Alias">
	</div>
	<div class="form-group">
		<label for="creator">Creator: </label> <input type="text"
			class="form-control" id="creator" name="creator" placeholder="Creator">
	</div>
	<div class="form-group">
		<label for="firstappearance">First Appearance: </label> <input
			type="text" class="form-control" id="firstappearance" name="firstAppearance"
			placeholder="First Appearance">
	</div>
	<div class="form-group">
		<label for="origin">Origin: </label>
		<!-- <input type="origin" class="form-control" id="origin" placeholder="Origin"  -->
		<textarea class="form-control" id="origin" rows="4" cols="100"
			name="origin"></textarea>
	</div>
	<div class="form-group">
		<label for="publisher">Publisher: </label> <input type="text"
			class="form-control" id="publisher" name="publisher" placeholder="Publisher">
	</div>
	<div class="form-group">
		<label for="radiobuttons"></label> <input type="radio" name="good"
			value="true" checked="checked">Superhero <input type="radio" name="good"
			value="false">Villain <input type="submit"
			class="btn btn-default" value="Create" />
	</div>
	</form>
	</div>
	







	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>