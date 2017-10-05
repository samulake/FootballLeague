<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="all" tagdir="/WEB-INF/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/<spring:theme code='styleSheet'/>"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<all:languages />
	|
	<all:themes />
	<form action="${pageContext.request.contextPath}/main/matches" method="POST">
		<table>
			<tr>
				<td><spring:message code="label.homeTeam" /></td>
				<td><input id="homeTeamInput" type="text" name="homeTeam" onfocus="changeFieldBackground(this)" onblur="restoreDefaults(this)"/></td>
			</tr>

			<tr>
				<td><spring:message code="label.visitorTeam" /></td>
				<td><input id="visitorTeamInput" type="text" name="visitorTeam" /></td>
			</tr>
			<tr>
				<td><spring:message code="label.result" /></td>
				<td><input class="in" type="text" name="result" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Add match" /></td>
				<td></td>
			</tr>
		</table>
	</form>




	<script type="text/javascript"
		src="${pageContext.request.contextPath}/<spring:theme code='jScript'/>"></script>
</body>
</html>