<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:choose>
	<c:when test="${fn:length(matches) gt 0}">
		<table border="1">
			<tr>
				<th>Home team</th>
				<th>Result</th>
				<th>Visitor team</th>
			</tr>

			<c:forEach var="item" items="${matches}">
				<tr>
					<td><c:out value="${item.homeTeam.name}" /></td>
					<td><c:out value="${item.result}" /></td>
					<td><c:out value="${item.visitorTeam.name}" /></td>
				</tr>
			</c:forEach>

		</table>
	</c:when>
	<c:otherwise>
		<p>There are no matches!</p>
	</c:otherwise> 
</c:choose>
