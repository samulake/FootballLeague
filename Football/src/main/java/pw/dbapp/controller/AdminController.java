package pw.dbapp.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import pw.dbapp.controller.logic.AdminLogic;
import pw.dbapp.model.Match;
import pw.dbapp.model.Person;

@RestController
public class AdminController implements AdminLogic {

	@Override
	@PostMapping(path="matches")
	public Match addMatch(Match match) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Person updatePerson(Person person) {
		// TODO Auto-generated method stub
		return null;
	}

}
