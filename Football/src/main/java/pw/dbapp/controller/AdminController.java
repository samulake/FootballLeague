package pw.dbapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pw.dbapp.controller.logic.AdminLogic;
import pw.dbapp.model.Match;
import pw.dbapp.model.Person;
import pw.dbapp.repository.PersonRepository;
import pw.dbapp.service.implementation.PersonService;
import pw.dbapp.service.logic.PersonLogic;

@RestController
@RequestMapping("/admin")
public class AdminController implements AdminLogic {
	
	@Autowired
	private PersonLogic personService;

	@Override
	public Match addMatch(Match match) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Person updatePerson(Person person) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@PutMapping("/makeTransfer/{personId}/{teamId}")
	public void makeTransfer(@PathVariable Long personId, @PathVariable Long teamId) {
		personService.tranferPerson(personId, teamId);
	}

}
