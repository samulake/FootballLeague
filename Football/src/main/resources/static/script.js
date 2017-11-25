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
        $.each(data, function(i, person) {
            $("#bestScorersTable").append(
                "<tr><td>" + person.id + "</td>" +
                "<td>" + person.name + "</td>" +
                "<td>" + person.surname + "</td>" +
                "<td>" + person.country.abbreviation + "</td>" +
                "<td>" + person.job.name + "</td></tr>"
            );
        });
    });
}