package pw.dbapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pw.dbapp.model.Match;
import pw.dbapp.model.Team;

public interface MatchRepository extends JpaRepository<Match, Long> {
	public Match findByHomeTeamIdAndVisitorTeamId(Long homeTeam, Long visitorTeam);
	
	@Query("select m from Match m where m.league.id = ?1")
	public List<Match> findByLeagueId(Long leagueId);
}
