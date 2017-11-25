var serverPrefix = 'http://localhost:8080';

function loadLeagueList(uri) {
	 $.get(serverPrefix + uri, function(data) {
         $.each(data, function(i, league) {
             $("#leaguesTable").append(
                 "<tr><td>" + league.id + "</td>" +
                 "<td><a href=\"\\leagues\\" + league.id + "\">" + league.name + "</a></td></tr>"
             );
         });
     });
}

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
                "<td>" + scorer.assistsMade + "</td></tr>"
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