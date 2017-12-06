package pw.dbapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.TeamResults;

public interface TeamResultsRepository extends JpaRepository<TeamResults, Long> {
	public List<TeamResults> findByTeamLeagueId(Long leagueId);
	
	public TeamResults findByTeamId(Long teamId);
}
