package pw.dbapp.service.logic;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import pw.dbapp.model.Person;
import pw.dbapp.model.Transfer;

public interface PersonServiceLogic {
	
	List<Person> getPersons();

	Transfer tranferPerson(Transfer transfer);
	
	List<Person> getPlayers(Long teamId);

}
