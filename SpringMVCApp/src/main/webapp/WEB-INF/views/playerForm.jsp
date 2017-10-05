<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:errors path="player.*" />

	<form action="new" method="POST">
		<label for="name">Name</label> <input type="text" name="name" />

		<label for="surname">Surname</label> <input type="text"
			name="surname" /> 
			<label for="countryAbbreviation">Country abbr.</label> <input type="text" name="countryAbbreviation" />
			<input type="submit" value="Add match" />
	</form>
</body>
</html>