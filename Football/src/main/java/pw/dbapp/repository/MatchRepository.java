package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.Match;

public interface MatchRepository extends JpaRepository<Match, Long> {

}
