package pw.dbapp.service.logic;

import java.util.List;

import org.hibernate.context.TenantIdentifierMismatchException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import pw.dbapp.model.Team;
import pw.dbapp.model.TeamResults;

public interface TeamServiceLogic {	
	public List<TeamResults> getLeagueTable(Long leagueId);
	
	List<Team> getTeams();
}
