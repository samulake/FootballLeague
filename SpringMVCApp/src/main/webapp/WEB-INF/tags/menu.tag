<%@tag import="java.security.Principal"%>
<%@ tag language="java" pageEncoding="UTF-8"%>

<div id="menu">
	<ul>
		<li><a href="${pageContext.request.contextPath}/football/leagues">Ligi</a></li>
		<li>Drużyny
			<ul>
				<li><a>Składy</a></li>
				<li><a>Mecze</a></li>
			</ul>
		</li>
		<li>Klasyfikacja zawodników
			<ul>
				<li><a>Strzelcy</a></li>
				<li><a>Asystenci</a></li>
				<li><a>Bramkarze</a></li>
			</ul>
		</li>
		<li><a>Wyloguj</a></li>
	</ul>
</div>