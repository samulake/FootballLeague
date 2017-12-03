$(document).ready(function() {
	var teams = [];
	var players = [];
	loadTeams();
	
	var transfer = {
		fromTeam : null,
		toTeam : null,
		person : null
	};
	
	$("#fromTeam, #toTeam").change(function(event) {
		var selectedTeamName = event.target.value;
		transfer[event.target.id] = $.fn.searchTeam(selectedTeamName);
		
		if(!transfer[event.target.id]) {
			alert("Nie ma takiej drużyny " + event.target.value);
			event.target.value = "";
			if(event.target.id === "fromTeam") {
				$("#player").val("");
				transfer.person = null;
			}
			return;
		}
		if(event.target.id === "fromTeam") {
			loadPlayers(transfer[event.target.id]);
		}
	});
	
	$("#player").change(function(event) {
		var selectedPersonFullName = event.target.value;
		var i = 0;
		
		while (i < players.length) {
			if (players[i].fullName === selectedPersonFullName) {
				transfer.person = players[i];
				return;
			}
			i++;
		}
		alert("Nie ma takiego zawodnika " + selectedPersonFullName);
		event.target.value = "";
		transfer.person = null;
		
	});
	
	$("#transfer").click( function(event) {
		if(!validateData()) {
			return;
		}
		$.ajax({
			type : 'POST',
			url : "/admin/transfers",
			data: JSON.stringify(transfer),
			contentType: "application/json",
			success : function(data) {
				alert("Transfer successfully made!");
				$.fn.clearForm();
			}
		});
	})
	
	$.fn.searchTeam = function(teamName) {
		var i = 0;
		while (i < teams.length) {
			
			if (teams[i].name.trim() === teamName.trim()) {
				return teams[i];
			}
			i++;
		}
		return null;
	};
	
	$.fn.clearForm = function() {
		transfer.fromTeam = null;
		transfer.person = null;
		transfer.toTeam = null;
		
		$(":text").val("");
	}
	
	function loadTeams() {
		$.ajax({
			type : 'GET',
			url : "/admin/teams",
			success : function(data) {
				teams = [];
				$.each(data, function(i, team) {
					teams.push(team);
					var option = document.createElement("option");
					option.value = team.name.trim();
					$("#teams").append(option);
				});
			}
		});
	};
	
	function loadPlayers(team) {
		$.ajax({
			type : 'GET',
			url : "/admin/teams/" + team.id + "/players",
			success : function(data) {
				players = [];
				$("#players").empty();
				$.each(data, function(i, player) {
					var option = document.createElement("option");
					player.fullName = player.name.trim() + " " + player.surname.trim();
					option.value = player.fullName;
					$("#players").append(option);
					players.push(player);
				});
			}
		});
	}
	
	function validateData() {
		if (!(transfer.fromTeam && transfer.toTeam && transfer.person)) {
			alert("Nie podano wszystkich danych!");
			return false;
		} 
		if (transfer.fromTeam.id == transfer.toTeam.id) {
			alert("Nie można dokonać transferu do tej samej drużyny!");
			return false;
		};
		return true;
	}
	
});



var serverPrefix = 'http://localhost:8080';

var playersLoaded;
var teams;

var transferFormData = {
	teams : null,
	players : null
}

var loadTeamData = function(event) {
	alert("testt");
}

var fullName = function(person) {
	return person.name.trim() + " " + person.surname.trim();
}

var getUrlParameter = function getUrlParameter(sParam) {
	var sPageURL = decodeURIComponent(window.location.search.substring(1)), sURLVariables = sPageURL
			.split('&'), sParameterName, i;

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
			// alert("success");
			$('#leagueName').html(getUrlParameter('leaguename'));
			var p = 1;
			$.each(teams, function(i, team) {
				$("#leagueTable").append(
						"<tr><td>" + p++ + ".</td>" + "<td>" + team.team.name
								+ "</td>" + "<td>" + team.matchesPlayed
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
								+ "<td><a href=\"/leagues/?teamid=" + league.id
								+ "&leaguename=" + league.name + "\">"
								+ league.name + "</a></td></tr>");
			});
		}

	});
};

function loadPersonsList(uri) {
	$.get(serverPrefix + uri, function(data) {
		$.each(data, function(i, person) {
			$("#personsTable").append(
					"<tr><td>" + person.id + "</td>" + "<td>" + person.name
							+ "</td>" + "<td>" + person.surname + "</td>"
							+ "<td>" + person.country.abbreviation + "</td>"
							+ "<td>" + person.job.name + "</td></tr>");
		});
	});
}

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