package pw.dbapp.controller.logic;

import java.util.List;

import pw.dbapp.model.GoalDetails;
import pw.dbapp.model.Match;
import pw.dbapp.model.Person;

public interface AdminLogic {
	Match addMatchDetails(Match match);
	
	Person updatePerson(Person person);
}
