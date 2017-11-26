package pw.dbapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pw.dbapp.controller.logic.AdminLogic;
import pw.dbapp.model.Match;
import pw.dbapp.model.Person;
import pw.dbapp.service.logic.MatchServiceLogic;

@RestController
@RequestMapping("/admin")
public class AdminController implements AdminLogic {
	@Autowired
	MatchServiceLogic matchService;
	
	@Override
	public Person updatePerson(Person person) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@PutMapping("/matches")
	public Match addMatchDetails(Match match) {
		return matchService.addMatch(match);
	}

}
