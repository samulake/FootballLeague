package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.Person;

public interface PersonRepository extends JpaRepository<Person, Long> {

}
