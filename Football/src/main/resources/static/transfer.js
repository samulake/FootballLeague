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
