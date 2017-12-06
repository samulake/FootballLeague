$(document).ready(function() {
	var team;
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return decodeURI(results[1]) || 0;
	    }
	};
	
	(function() {
		$.ajax({
			type : 'GET',
			url : "/user/teams/" + $.urlParam("teamId") + "/squad",
			success : function(squad) {
				$.each(squad, function(i, member) {
					var memberRow = document.createElement("tr");
					var hash, fullName, countryAbbreviation, role;
					
					hash = document.createElement("td");
					fullName = document.createElement("td");
					countryAbbreviation = document.createElement("td");
					role = document.createElement("td");
					
					hash.textContent = i + 1;
					fullName.textContent = member.name.trim() + " " + member.surname.trim();
					countryAbbreviation.textContent = member.country.abbreviation;
					role.textContent = member.job.name;
					
					memberRow.appendChild(hash);
					memberRow.appendChild(fullName);
					memberRow.appendChild(countryAbbreviation);
					memberRow.appendChild(role);
					
					
					$("#memberTable tr:last").after(memberRow);
				});
			}
		});
		
		$.ajax({
			type : 'GET',
			url : "/user/teams/" + $.urlParam("teamId") + "/matches",
			success : function(matches) {
				var i = 0;
				for(i = 0; i < 10; i++) {
					var memberRow = document.createElement("tr");
					var date, homeTeamName, result, visitorTeamName;
					
					date = document.createElement("td");
					homeTeamName = document.createElement("td");
					result = document.createElement("td");
					visitorTeamName = document.createElement("td");
					
					date.textContent = new Date(matches[i].dateTime);
					homeTeamName.textContent = matches[i].homeTeam.name;
					result.textContent = matches[i].result == undefined ? "-- : --" : matches[i].result;
					visitorTeamName.textContent = matches[i].visitorTeam.name;
					
					memberRow.appendChild(date);
					memberRow.appendChild(homeTeamName);
					memberRow.appendChild(result);
					memberRow.appendChild(visitorTeamName);
					
					$("#matchesTable tr:last").after(memberRow);
				}
				
			}
		});
	})();
});