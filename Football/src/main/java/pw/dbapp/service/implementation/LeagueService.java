package pw.dbapp.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pw.dbapp.model.League;
import pw.dbapp.model.Team;
import pw.dbapp.repository.LeagueRepository;
import pw.dbapp.service.logic.LeagueServiceLogic;

@Service
public class LeagueService implements LeagueServiceLogic {
	@Autowired
	private LeagueRepository leagueRepository;
	/*@Autowired
	private TeamRe*/
	
	@Override
	public List<League> getLeagues() {
		List<League> leagues = leagueRepository.findAll();
		return leagues;
	}

	@Override
	public List<Team> getLeague(Long leagueId) {
		return null;
	}
}
