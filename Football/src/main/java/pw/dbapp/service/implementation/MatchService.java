package pw.dbapp.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Service;

import pw.dbapp.model.GoalDetails;
import pw.dbapp.model.Match;
import pw.dbapp.repository.GoalDetailsRepository;
import pw.dbapp.repository.MatchRepository;
import pw.dbapp.service.logic.MatchServiceLogic;

@Service
public class MatchService implements MatchServiceLogic {
	@Autowired
	private MatchRepository matchDAO;
	@Autowired
	private GoalDetailsRepository goalDetailsDAO;

	@Override
	public Match addMatch(Match match) {
		Match updatedMatch = matchDAO.findByHomeTeamIdAndVisitorTeamId(match.getHomeTeam().getId(),
				match.getVisitorTeam().getId());
		updatedMatch.setResult(match.getResult());
		

		for (GoalDetails gd : match.getGoals()) {
			System.out.println(gd);
			goalDetailsDAO.save(gd);
		}
		return matchDAO.save(updatedMatch);
	}

	@Override
	public List<Match> getMatchesList(Long leagueId) {
		return matchDAO.findByLeagueId(leagueId);
	}

	@Override
	public Match getMatchByHomeTeamIdAndVisitorTeamId(Long homeTeamId,
			Long visitorTeamId) {
		return matchDAO.findByHomeTeamIdAndVisitorTeamId(homeTeamId, visitorTeamId);
	}
}
