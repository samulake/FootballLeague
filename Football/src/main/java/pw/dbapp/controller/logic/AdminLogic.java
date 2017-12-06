package pw.dbapp.controller.logic;

import java.util.List;

import org.springframework.validation.BindingResult;

import pw.dbapp.model.GoalDetails;
import pw.dbapp.model.Match;
import pw.dbapp.model.Person;
import pw.dbapp.model.Transfer;

public interface AdminLogic {
	
	Person updatePerson(Person person);
	
	Transfer makeTransfer(Transfer transfer);

	Match addMatchDetails(Long matchId, Match match, BindingResult result);
	
	String getMatchesList(Long leagueId);
	
	Match getMatchByHomeTeamIdAndVisitorTeamId(Long homeTeamId, Long visitorTeamId);
	
	List<Person> getPersonsByTeamId(Long id);
	
	void addMatch(Match match);
}
