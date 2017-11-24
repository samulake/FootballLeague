package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.League;

public interface LeagueRepository extends JpaRepository<League, Long> {
}
