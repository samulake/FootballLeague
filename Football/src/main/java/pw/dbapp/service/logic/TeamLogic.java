package pw.dbapp.service.logic;

import java.util.List;

import org.hibernate.context.TenantIdentifierMismatchException;

import pw.dbapp.model.Team;
import pw.dbapp.model.TeamResults;

public interface TeamLogic {	
	public List<TeamResults> getLeagueTable(Long leagueId);
}
