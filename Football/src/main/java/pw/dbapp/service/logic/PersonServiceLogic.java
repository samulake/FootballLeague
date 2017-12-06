package pw.dbapp.service.logic;

import java.util.List;

import pw.dbapp.model.Person;
import pw.dbapp.model.Transfer;

public interface PersonServiceLogic {
	
	List<Person> getPersons();

	List<Person> getPersonsByTeamId(Long id);
	
	Transfer tranferPerson(Transfer transfer);
}
