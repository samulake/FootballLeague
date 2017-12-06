package pw.dbapp.service.implementation;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import pw.dbapp.model.Match;
import pw.dbapp.model.Team;
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

	@Override
	public List<Match> getMatchesOfTeam(Long teamId) {
		List<Match> matches;
		Match match = new Match();
		Team team = new Team();
		team.setId(teamId);
		match.setHomeTeam(team);
		Example<Match> matchExample = Example.of(match);
		matches = matchDAO.findAll(matchExample);
		match = new Match();
		match.setVisitorTeam(team);
		matchExample = Example.of(match);
		matches.addAll(matchDAO.findAll(matchExample));
		matches.sort((x, y) -> x.getDateTime().compareTo(y.getDateTime()));
		return matches;
	}
}
