package pw.dbapp.service.logic;

import java.util.List;

import pw.dbapp.model.League;

public interface LeagueLogic {
	List<League> getLeagues();
	
	League getLeague(Long leagueId);
}
