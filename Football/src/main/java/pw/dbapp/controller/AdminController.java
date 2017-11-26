package pw.dbapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	@PutMapping(path="/matches/{matchId}", consumes=MediaType.APPLICATION_JSON_VALUE)
	public Match addMatchDetails(@PathVariable Long matchId, @RequestBody Match match) {
		System.out.println(match.getResult());
		return matchService.addMatch(match);
	}

}
