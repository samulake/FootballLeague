package pw.dbapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import pw.dbapp.controller.logic.UserLogic;
import pw.dbapp.model.League;
import pw.dbapp.model.Person;
import pw.dbapp.model.Team;
import pw.dbapp.service.logic.GoalDetailsServiceLogic;
import pw.dbapp.service.logic.LeagueLogic;
import pw.dbapp.service.logic.PersonLogic;

@RestController
@RequestMapping("/user")
public class UserController implements UserLogic {
	@Autowired
	private LeagueLogic leagueService;
	@Autowired
	private PersonLogic personService;
	@Autowired
	private GoalDetailsServiceLogic goalDetailsService;
	
	@Override
	@GetMapping(path="/leagues")
	public List<League> getAllLeagues() {
		return leagueService.getLeagues();
	}

	@Override
	@GetMapping(path="/persons")
	public List<Person> getAllPersons() {
		return personService.getPersons();
	}
	
	@Override
	@GetMapping(path="/bestScorers")
	public List<Person> getBestScorers() {
		return goalDetailsService.getBestScorers();
	}
	
	
	@Override
	public List<Team> searchTeams(String prefixName) {
		return null;
	}

	@Override
	public List<Person> getBestPlayers(Long jobId) {
		// TODO Auto-generated method stub
		return null;
	}

}
