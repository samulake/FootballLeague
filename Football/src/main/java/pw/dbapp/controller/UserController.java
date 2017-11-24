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
import pw.dbapp.service.logic.LeagueLogic;
import pw.dbapp.service.logic.TeamLogic;

@RestController
@RequestMapping("/user")
public class UserController implements UserLogic {
	@Autowired
	private LeagueLogic leagueService;
	@Autowired
	private TeamLogic teamService;
	
	
	@Override
	@GetMapping(path="/leagues", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<League> getAllLeagues() {
		return leagueService.getLeagues();
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
	@GetMapping(path="/leagues/{leagueId}/table")
	public List<TeamResults> getLeagueTable(@PathVariable Long leagueId) {
		return teamService.getLeagueTable(leagueId);
	}
}
