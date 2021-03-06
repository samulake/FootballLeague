package pw.dbapp.controller.logic;

import java.util.List;

import pw.dbapp.model.League;
import pw.dbapp.model.Match;
import pw.dbapp.model.Person;
import pw.dbapp.model.Team;
import pw.dbapp.model.TeamResults;

public interface UserLogic {
		
	List<League> getAllLeagues();
	
	List<TeamResults> getLeagueTable(Long leagueId);
	
	List<Team> searchTeams(String prefixName);
	
	List<Person> getBestPlayers(Long jobId);
	
	String getBestScorers();

	String getBestAssistants();

	List<Match> getMatchesOfTeam(Long teamId);

	List<Person> getTeamSquad(Long teamId);
}
