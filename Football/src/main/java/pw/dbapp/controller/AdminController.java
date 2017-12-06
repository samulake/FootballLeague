package pw.dbapp.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.google.gson.stream.JsonReader;

import pw.dbapp.controller.logic.AdminLogic;
import pw.dbapp.model.Match;
import pw.dbapp.model.Person;
import pw.dbapp.model.Transfer;
import pw.dbapp.service.logic.MatchServiceLogic;
import pw.dbapp.service.logic.PersonServiceLogic;
import pw.dbapp.validations.IsValidMatch;

@RestController
@RequestMapping("/admin")
public class AdminController implements AdminLogic {
	@Autowired
	MatchServiceLogic matchService;
	@Autowired
	private PersonServiceLogic personService;
	@Override
	public Person updatePerson(Person person) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@PutMapping(path="/matches/{matchId}", consumes=MediaType.APPLICATION_JSON_VALUE)
	public Match addMatchDetails(@PathVariable Long matchId, @Valid @RequestBody Match match, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		return matchService.addMatch(match);
	}
	
	@Override
	@PostMapping("/transfers")
	public Transfer makeTransfer(@RequestBody Transfer transfer) {
		return personService.tranferPerson(transfer);
	}

	@Override
	@GetMapping("/matches/{leagueId}")
	public String getMatchesList(@PathVariable Long leagueId) {
		GsonBuilder bg = new GsonBuilder().excludeFieldsWithoutExposeAnnotation();
		Gson gs = bg.create();
		List<Match> matches = matchService.getMatchesList(leagueId);
		return gs.toJson(matches);
	}

	@Override
	@GetMapping("/match/{homeTeamId}/{visitorTeamId}")
	public Match getMatchByHomeTeamIdAndVisitorTeamId(@PathVariable Long homeTeamId,
			@PathVariable Long visitorTeamId) {
		return matchService.getMatchByHomeTeamIdAndVisitorTeamId(homeTeamId, visitorTeamId);
	}

	@Override
	@GetMapping("/persons/team/{id}")
	public List<Person> getPersonsByTeamId(@PathVariable Long id) {
		return personService.getPersonsByTeamId(id);
	}
	
	@Override
	@PostMapping("/addMatch")
	public void addMatch(@RequestBody Match match) {
		matchService.addMatch(match);
	}

}
