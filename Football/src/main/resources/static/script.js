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