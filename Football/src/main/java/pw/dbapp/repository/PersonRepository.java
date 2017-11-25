package pw.dbapp.repository;

import java.util.List;

import org.jboss.logging.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pw.dbapp.model.Person;

public interface PersonRepository extends JpaRepository<Person, Long> {

	@Query("select p from Person p where p.id = ?1")
	Person getPersonById( Long id);
	
}
