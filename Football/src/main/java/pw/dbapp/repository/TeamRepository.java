package pw.dbapp.repository;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.Team;

public interface TeamRepository extends JpaRepository<Team, Long> {
	public List<Team> findByLeagueId(Long leagueId);
}
