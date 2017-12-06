package pw.dbapp.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import pw.dbapp.model.GoalDetails;
import pw.dbapp.model.Match;
import pw.dbapp.model.Team;
import pw.dbapp.model.TeamResults;
import pw.dbapp.repository.GoalDetailsRepository;
import pw.dbapp.repository.MatchRepository;
import pw.dbapp.repository.TeamResultsRepository;
import pw.dbapp.service.logic.MatchServiceLogic;

@Service
public class MatchService implements MatchServiceLogic {
	@Autowired
	private MatchRepository matchDAO;

	@Autowired
	private GoalDetailsRepository goalDetailsDAO;
	
	@Autowired
	private TeamResultsRepository teamResultsRepository;

	@Override
	public Match addMatch(Match match) {
		Match updatedMatch = matchDAO.findByHomeTeamIdAndVisitorTeamId(match.getHomeTeam().getId(),
				match.getVisitorTeam().getId());
		updatedMatch.setResult(match.getResult());

		for (GoalDetails gd : match.getGoals()) {
			System.out.println(gd);
			goalDetailsDAO.save(gd);
		}
		
		updateLeagueTable(match);
		return matchDAO.save(updatedMatch);
	}
	
	private void updateLeagueTable(Match match) {
		TeamResults homeTeamResult = teamResultsRepository.findByTeamId(match.getHomeTeam().getId());
		TeamResults visitorTeamResult = teamResultsRepository.findByTeamId(match.getVisitorTeam().getId());
		String [] result = match.getResult().split(":");
		int homeTeamGoals = Integer.parseInt(result[0]);
		int visitorTeamGoals = Integer.parseInt(result[1]);
		homeTeamResult.setGoalsBalance(updateGoalsBalance(homeTeamResult.getGoalsBalance(), homeTeamGoals, visitorTeamGoals));
		visitorTeamResult.setGoalsBalance(updateGoalsBalance(visitorTeamResult.getGoalsBalance(), visitorTeamGoals, homeTeamGoals));
		if(homeTeamGoals > visitorTeamGoals) {
			homeTeamResult.setWins(homeTeamResult.getWins()+1);
			homeTeamResult.setPoints(homeTeamResult.getPoints() + 3);
			visitorTeamResult.setDefeats(visitorTeamResult.getDefeats()+1);
		} else if (homeTeamGoals == visitorTeamGoals) {
			homeTeamResult.setDraws(homeTeamResult.getDraws()+1);
			visitorTeamResult.setDraws(visitorTeamResult.getDraws()+1);
			homeTeamResult.setPoints(homeTeamResult.getPoints() + 1);
		} else {
			visitorTeamResult.setWins(visitorTeamResult.getWins()+1);
			homeTeamResult.setDefeats(homeTeamResult.getDefeats()+1);
			visitorTeamResult.setPoints(visitorTeamResult.getPoints() + 3);
		}
		visitorTeamResult.setMatchesPlayed(visitorTeamResult.getMatchesPlayed()+1);
		homeTeamResult.setMatchesPlayed(homeTeamResult.getMatchesPlayed()+1);
		
		teamResultsRepository.save(homeTeamResult);
		teamResultsRepository.save(visitorTeamResult);
	}
	
	private int updateGoalsBalance(int currentGoalsBalance, int goalsScored, int goalsConceded) {
		return currentGoalsBalance + goalsScored - goalsConceded;
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
