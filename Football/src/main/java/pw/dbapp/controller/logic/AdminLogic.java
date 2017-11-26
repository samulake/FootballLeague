package pw.dbapp.controller.logic;

import java.util.List;

import pw.dbapp.model.GoalDetails;
import pw.dbapp.model.Match;
import pw.dbapp.model.Person;

public interface AdminLogic {
	
	Person updatePerson(Person person);

	Match addMatchDetails(Long matchId, Match match);
}
