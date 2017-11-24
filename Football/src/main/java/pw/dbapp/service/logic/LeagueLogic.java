package pw.dbapp.service.logic;

import java.util.List;

import pw.dbapp.model.League;
import pw.dbapp.model.Team;

public interface LeagueLogic {
	List<League> getLeagues();
	
	List<Team> getLeague(Long leagueId);
}
