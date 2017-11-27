package pw.dbapp.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pw.dbapp.model.Person;
import pw.dbapp.model.Transfer;
import pw.dbapp.repository.PersonRepository;
import pw.dbapp.service.logic.PersonLogic;

@Service
public class PersonService implements PersonLogic {

	@Autowired
	private PersonRepository personRepository;
	
	@Override
	public List<Person> getPersons() {
		List<Person> persons = personRepository.findAll();
		return persons;
	}

	@Override
	public Transfer tranferPerson(Transfer transfer) {
		return null;
	}

	

}
