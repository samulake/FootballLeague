package pw.dbapp.service.implementation;

import java.util.List;

import org.springframework.stereotype.Service;

import pw.dbapp.model.League;
import pw.dbapp.repository.LeagueRepository;
import pw.dbapp.service.logic.LeagueLogic;

@Service
public class LeagueService implements LeagueLogic {
	@Override
	public List<League> getLeagues() {
		return null;
	}

	@Override
	public League getLeague(Long leagueId) {
		return null;
	}

}
