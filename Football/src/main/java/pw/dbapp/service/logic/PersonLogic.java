package pw.dbapp.service.logic;

import java.util.List;

import pw.dbapp.model.Person;
import pw.dbapp.model.Transfer;

public interface PersonLogic {
	
	List<Person> getPersons();

	Transfer tranferPerson(Transfer transfer);
}
