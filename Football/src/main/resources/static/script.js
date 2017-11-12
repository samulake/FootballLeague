var serverPrefix = 'http://localhost:8080';

function loadLeagueList(uri) {
	 $.get(serverPrefix + uri, function(data) {

         $.each(data, function(i, league) {

             $("#leaguesTable").append(
                 "<tr><td>" + league.id + "</td>" +
                 "<td>" + league.name + "</td></tr>"
             );
         });

     });
}