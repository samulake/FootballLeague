package pw.dbapp.service.implementation;

import java.math.BigInteger;
import java.util.Collections;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;

import pw.dbapp.model.Person;
import pw.dbapp.model.Transfer;
import pw.dbapp.repository.PersonRepository;
import pw.dbapp.repository.TransferRepository;
import pw.dbapp.service.logic.PersonServiceLogic;

@Service
@Transactional
public class PersonService implements PersonServiceLogic {

	@Autowired
	private PersonRepository personRepository;
	@Autowired
	private TransferRepository transferDAO;

	@Override
	public List<Person> getPersons() {
		List<Person> persons = personRepository.findAll();
		return persons;
	}

	@Override
	public Transfer tranferPerson(Transfer transfer) {
		Person person = personRepository.findOne(transfer.getPerson().getId());
		Transfer newTransfer = transferDAO.save(transfer);
		person.setTeam(transfer.getToTeam());
		personRepository.save(person);
		return newTransfer;
	}

	@Override
	public List<Person> getPersonsByTeamId(Long id) {
		return personRepository.getPersonByTeamId(id);
	}

	@Override
	public List<Person> getPlayers(Long teamId) {
		return personRepository.findByTeamId(teamId);
	}
}
