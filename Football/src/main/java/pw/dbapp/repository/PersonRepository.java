package pw.dbapp.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.jboss.logging.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import pw.dbapp.model.Person;

public interface PersonRepository extends JpaRepository<Person, Long> {

	@Query("select p from Person p where p.id = ?1")
	Person getPersonById( Long id);
	
	@Query("select p from Person p where p.team.id = ?1")
	List<Person> getPersonByTeamId(Long id);
	
	@Modifying
	@Transactional
	@Query("update Person p set p.team.id = ?2 where p.id = ?1")
	void changeTeamOfPerson(Long personId, Long teamId);
	
	List<Person> findByTeamId(Long teamId);
}
