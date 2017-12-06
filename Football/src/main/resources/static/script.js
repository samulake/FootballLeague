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
						"<tr><td>" + p++ + ".</td>" + "<td><a href=\"/teams/details?teamId=" + team.team.id
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

function loadLeaguesToDropdown(uri) {
	$.ajax({
		type:		'GET',
		url:		uri,
		success:	function(leagues) {
			$.each(leagues, function(i, league) {
	             $("#leagues").append(
	            	"<option value=\""+ league.name.trim() +  "\" id=\""+ league.name.trim() +"\" data-id=\""+ league.id +"\" />"
	             );
	        });
		}
	});
};

function loadMatchesToDropdown(uri) {
	$.ajax({
		type:		'GET',
		url:		uri,
		success:	function(matches) {
			$("#matches").empty();
			var matchesj = JSON.parse(matches);
			$.each(matchesj, function(i, match) {
	             $("#matches").append(
	                 "<option value=\""+ match.homeTeam.name.trim() +" - " + match.visitorTeam.name.trim() +
	                 "\" id=\"" + match.homeTeam.name.trim() +" - " + match.visitorTeam.name.trim() +
	                 "\" data-hteam=\""+ match.homeTeam.id +
	                 "\" data-vteam=\""+ match.visitorTeam.id + "\" data-id=\"" + match.id + "\" />"
	             );
	        });
		}
	});
};


function parseDate(d) {
	var date = new Date(d);
	
	var day = ("0" + date.getDate()).slice(-2);
	var month = ("0" + date.getMonth()).slice(-2);
	var year = date.getFullYear();
	var hours = ("0" + date.getHours()).slice(-2);
	var minutes = ("0" + date.getMinutes()).slice(-2);

	//"yyyy-MM-ddThh:mm"
	
	return year+'-'+month+'-'+day+'T'+hours+':'+minutes;
}


function loadMatchToForm(uri) {
	$.ajax({
		type:		'GET',
		url:		uri,
		success:	function(match) {
			console.log(match);
			$("#team1").val(match.homeTeam.name.trim());
			$("#team2").val(match.visitorTeam.name.trim());
			$("#dateandtime").val(parseDate(match.dateTime));
			$("#stadium").val(match.stadium.name.trim());
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

var goals = 1;

function addGoal(uri, team1, team2) {
	
	$("#scorers").append("	<div class=\"row\">" +
			"<div class=\"col-sm-4\">" +
			"	<input list=\"players\"  class=\"form-control input-lg scorer\" placeholder=\"Strzelec\"></input>" +
			"</div>" +
			"<div class=\"col-sm-4\">" +
			"	<input list=\"players\"  class=\"form-control assistant\" placeholder=\"Asystent\"></input>" +
			"</div>" +
		"</div>"
	);
	
	
	if (goals == 1) {
		 $.get(serverPrefix + uri + team1, function(data) {
		       $.each(data, function(i, player) {
		    	   $("#players").append(
			                 "<option value=\""+ player.name.trim() +" " + player.surname.trim() +
			                 "\" id=\"" + player.name.trim() +" " + player.surname.trim() +
			                 "\" data-id=\""+ player.id + "\" data-teamid=\"" + team1 + "\" data-oteamid=\"" + team2 + "\"/>"
			             );
		       });
		   });
		   
			 $.get(serverPrefix + uri + team2, function(data) {
			       $.each(data, function(i, player) {
			    	   $("#players").append(
				                 "<option value=\""+ player.name.trim() +" " + player.surname.trim() +
				                 "\" id=\"" + player.name.trim() +" - " + player.surname.trim() +
				                 "\" data-id=\""+ player.id + "\" data-teamid=\"" + team2 + "\" data-oteamid=\"" + team1 + "\"/>"
				             );
			       });
			   });
			 
			goals++;
	}
	

}


function addMatch(uri) {
	var l = $("#matchesList").val();
	var id = document.getElementById("matches").options.namedItem(l);
	var htud = $(id).data("hteam");
	var vtud = $(id).data("vteam");
	var result = $("#team1score").val() + ':' + $("#team2score").val();
	var data = {
		  "homeTeam" : {
			  "id" : htud
		  },
		  "visitorTeam" : {
			  "id" : vtud
		  },
		  "result" : result,
		  "goals" : []

	  }
	
	$(".scorer").each(function() {
		var l = $("#matchesList").val();
		var id = document.getElementById("matches").options.namedItem(l);
		var mid = $(id).data("id");
		
		
		l = $(this).val();
		id = document.getElementById("players").options.namedItem(l);
		var pid = $(id).data("id");
		var ftid = $(id).data("teamid");
		var atid = $(id).data("oteamid");
		
		l = $(this).closest("div").next().find(".assistant").val();
		console.log(l);
		if ( l ) {
			var wid = document.getElementById("players").options.namedItem(l);
			aid = {
				"id" : $(wid).data("id")
			}
		} else {
			var aid = null;
		}
		
		
		
		var goal = {
				"match" : {
					"id" : mid
				},
				"scorer" : {
					"id" : pid
				},
				"assistant" : aid,
				"goalkeeper" : null,
				"forTeam" : {
					"id" : ftid
				},
				"againstTeam" : {
					"id" : atid
				}
			}
		
		data.goals.push(goal);
		
	});
	

	$.ajax({
		  type: "PUT",
		  url: serverPrefix + uri,
	      dataType: "json",
		  contentType: "application/json; charset=utf-8",
		  data: JSON.stringify(data),
		  success : function(result) {
			  alert("Match successfully added!");
		  },
		  error : function(data) {
			  alert("Adding match has failed!");
		  }
		});
}

