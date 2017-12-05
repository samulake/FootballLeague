var serverPrefix = 'http://localhost:8080';

var loadTeamData = function(event) {
	alert("testt");
}

var fullName = function(person) {
	return person.name.trim() + " " + person.surname.trim();
}

var getUrlParameter = function getUrlParameter(sParam) {
	var sPageURL = decodeURIComponent(window.location.search.substring(1));
	var sURLVariables = sPageURL.split('&');
	var sParameterName, i;

	for (i = 0; i < sURLVariables.length; i++) {
		sParameterName = sURLVariables[i].split('=');

		if (sParameterName[0] === sParam) {
			return sParameterName[1] === undefined ? true : sParameterName[1];
		}
	}
};

function loadLeagueTable(uri) {

	$.ajax({
		type : 'GET',
		url : uri,
		success : function(teams) {
			$('#leagueName').html(getUrlParameter('leagueName'));
			var p = 1;
			$.each(teams, function(i, team) {
				$("#leagueTable").append(
						"<tr><td>" + p++ + ".</td>" + "<td><a href=\"/teams/details?teamId=" + team.id
						+ "&teamName=" + team.team.name + "\">"
						+ team.team.name + "</a></td>" + "<td>" + team.matchesPlayed
								+ "</td>" + "<td>" + team.wins + "</td>"
								+ "<td>" + team.draws + "</td>" + "<td>"
								+ team.defeats + "</td>" + "<td>"
								+ team.goalsBalance + "</td></tr>");
			});
		}

	});
}

function loadLeagueList(uri) {

	$.ajax({
		type : 'GET',
		url : uri,
		success : function(leagues) {
			$.each(leagues, function(i, league) {
				$("#leaguesTable").append(
						"<tr><td>" + league.id + "</td>"
								+ "<td><a href=\"/leagues/table?leagueId=" + league.id
								+ "&leagueName=" + league.name + "\">"
								+ league.name + "</a></td></tr>");
			});
		}

	});
};

function loadBestScorersList(uri) {
	$.get(serverPrefix + uri, function(data) {
		var s = JSON.parse(data);
		$.each(s, function(i, scorer) {
			$("#bestScorersTable").append(
					"<tr><td>" + scorer.place + "</td>" + "<td>" + scorer.name
							+ " " + scorer.surname + "</td>" + "<td>"
							+ scorer.goalsScored + "</td>" + "<td>"
							+ scorer.assistsMade + "</td>" + "<td>" + "0"
							+ "</td></tr>");
		});
	});
}

function loadBestAssistantsList(uri) {
	$.get(serverPrefix + uri, function(data) {
		$.each(s, function(i, assistant) {
			$("#bestScorersTable").append(
					"<tr><td>" + assistant.place + "</td>" + "<td>"
							+ assistant.name + " " + assistant.surname
							+ "</td>" + "<td>" + assistant.assistsMade
							+ "</td></tr>");
		});
	});
}