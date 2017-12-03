package pw.dbapp.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import pw.dbapp.model.Team;
import pw.dbapp.model.TeamResults;
import pw.dbapp.repository.TeamRepository;
import pw.dbapp.repository.TeamResultsRepository;
import pw.dbapp.service.logic.TeamServiceLogic;

@Service
public class TeamService implements TeamServiceLogic {
	@Autowired
	private TeamRepository teamDAO;
	@Autowired
	private TeamResultsRepository teamResultsDAO;
	
	public List<TeamResults> getLeagueTable(Long leagueId) {
		return teamResultsDAO.findByTeamLeagueId(leagueId);
	}

	@Override
	public List<Team> getTeams() {
		return teamDAO.findAll();
	}
	
}
