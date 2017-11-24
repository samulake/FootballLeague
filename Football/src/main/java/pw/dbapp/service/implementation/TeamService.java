package pw.dbapp.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pw.dbapp.model.Team;
import pw.dbapp.model.TeamResults;
import pw.dbapp.repository.TeamRepository;
import pw.dbapp.repository.TeamResultsRepository;
import pw.dbapp.service.logic.TeamLogic;

@Service
public class TeamService implements TeamLogic {
	@Autowired
	private TeamRepository teamDAO;
	@Autowired
	private TeamResultsRepository teamResultsDAO;
	
	public List<TeamResults> getLeagueTable(Long leagueId) {
		return teamResultsDAO.findByTeamLeagueId(leagueId);
	}
	
}
