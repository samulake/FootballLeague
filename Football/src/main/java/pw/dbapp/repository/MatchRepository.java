package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.Match;
import pw.dbapp.model.Team;

public interface MatchRepository extends JpaRepository<Match, Long> {
	public Match findByHomeTeamIdAndVisitorTeamId(Long homeTeam, Long visitorTeam);
}
