<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>${title}</h2>
	<table>
		<tr>
			<th>Name</th>
			<th>Surname</th>
			<th>Country</th>
		</tr>
		<tr>
			<td>${player.name}</td>
			<td>${player.surname}</td>
			<td>${player.countryAbbreviation}</td>
		</tr>
	</table>
</body>
</html>