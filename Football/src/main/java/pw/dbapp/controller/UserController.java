package pw.dbapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pw.dbapp.controller.logic.UserLogic;
import pw.dbapp.model.League;
import pw.dbapp.model.Person;
import pw.dbapp.model.Team;
import pw.dbapp.model.TeamResults;
import pw.dbapp.service.logic.GoalDetailsServiceLogic;
import pw.dbapp.service.logic.LeagueLogic;
import pw.dbapp.service.logic.TeamLogic;
import pw.dbapp.service.logic.PersonLogic;

@RestController
@RequestMapping("/user")
public class UserController implements UserLogic {
	@Autowired
	private LeagueLogic leagueService;
	@Autowired
	private TeamLogic teamService;
	@Autowired
	private PersonLogic personService;
	@Autowired
	private GoalDetailsServiceLogic goalDetailsService;
	
	@Override
	@GetMapping(path="/leagues", produces=MediaType.APPLICATION_JSON_VALUE)
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
	public String getBestScorers() {
		return goalDetailsService.getBestScorers();
	}
	
	@Override
	@GetMapping(path="/bestAssistants")
	public String getBestAssistants() {
		return goalDetailsService.getBestAssistants();
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

	@Override
	@GetMapping(path="/leagues/{leagueId}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<TeamResults> getLeagueTable(@PathVariable Long leagueId) {
		return teamService.getLeagueTable(leagueId);
	}
}
