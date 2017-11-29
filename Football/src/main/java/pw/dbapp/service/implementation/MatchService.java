package pw.dbapp.service.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Service;

import pw.dbapp.model.Match;
import pw.dbapp.repository.MatchRepository;
import pw.dbapp.service.logic.MatchServiceLogic;

@Service
public class MatchService implements MatchServiceLogic {
	@Autowired
	private MatchRepository matchDAO;

	@Override
	public Match addMatch(Match match) {
		Match updatedMatch = matchDAO.findByHomeTeamIdAndVisitorTeamId(match.getHomeTeam().getId(),
				match.getVisitorTeam().getId());
		updatedMatch.setResult(match.getResult());
		return matchDAO.save(updatedMatch);
	}
}
