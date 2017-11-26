var serverPrefix = 'http://localhost:8080';

function loadLeagueTable(uri) {
	
	$.ajax({
		type:		'GET',
		url:		uri,
		success:	function(teams) {
			alert("success");
			$.each(teams, function(i, team) {
	             $("#leagueTable").append(
	                 "<tr><td>" + team.id + "</td>" +
	                 "<td>" + team.name + "</td>" +
	                 "<td>" + team.matchesPlayed + "</td>" +
	                 "<td>" + team.wins + "</td>" +
	                 "<td>" + team.draws + "</td>" +
	                 "<td>" + team.defeats + "</td>" +
	                 "<td>" + team.goalsBalance + "</td></tr>"
	             );
	        });
		}
		
	});
}

function loadLeagueList(uri) {
	
	$.ajax({
		type:		'GET',
		url:		uri,
		success:	function(leagues) {
			$.each(leagues, function(i, league) {
	             $("#leaguesTable").append(
	                 "<tr><td>" + league.id + "</td>" +
	                 "<td><a href=\"/leagues/"+ league.id +"\">" + league.name + "</a></td></tr>"
	             );
	        });
		}
		
	});
};

function loadPersonsList(uri) {
	 $.get(serverPrefix + uri, function(data) {
        $.each(data, function(i, person) {
            $("#personsTable").append(
                "<tr><td>" + person.id + "</td>" +
                "<td>" + person.name + "</td>" +
                "<td>" + person.surname + "</td>" +
                "<td>" + person.country.abbreviation + "</td>" +
                "<td>" + person.job.name + "</td></tr>"
            );
        });
    });
}


function loadBestScorersList(uri) {
	 $.get(serverPrefix + uri, function(data) {
		var s = JSON.parse(data);
        $.each(s, function(i, scorer) {
            $("#bestScorersTable").append(
                "<tr><td>" + scorer.place + "</td>" +
                "<td>" + scorer.name + " " + scorer.surname + "</td>" +
                "<td>" + scorer.goalsScored + "</td>" +
                "<td>" + scorer.assistsMade + "</td>" +
                "<td>" + "0" + "</td></tr>"
            );
        });
    });
}

function loadBestAssistantsList(uri) {
	 $.get(serverPrefix + uri, function(data) {
		var s = JSON.parse(data);
       $.each(s, function(i, assistant) {
           $("#bestScorersTable").append(
               "<tr><td>" + assistant.place + "</td>" +
               "<td>" + assistant.name + " " + assistant.surname + "</td>" +
               "<td>" + assistant.assistsMade + "</td></tr>"
           );
       });
   });
}