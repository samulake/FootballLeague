package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.Team;

public interface TeamRepository extends JpaRepository<Team, Long> {

}
