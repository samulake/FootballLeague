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
			url : "/user/teams/" + $.urlParam("teamId"),
			success : function(data) {
				team = data;
				$.each(team.squad, function(i, member) {
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
	})();
});