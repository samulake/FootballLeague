package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.Stadium;

public interface StadiumRepository extends JpaRepository<Stadium, Long> {

}
