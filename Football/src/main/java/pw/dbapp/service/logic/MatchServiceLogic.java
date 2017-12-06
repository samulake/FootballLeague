package pw.dbapp.service.logic;

import java.util.List;

import pw.dbapp.model.Match;

public interface MatchServiceLogic {
	public Match addMatch(Match match);
	public List<Match> getMatchesList(Long leagueId);
	public Match getMatchByHomeTeamIdAndVisitorTeamId(Long homeTeamId, Long visitorTeamId);
}
