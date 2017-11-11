package pw.dbapp.controller.logic;

import pw.dbapp.model.Match;
import pw.dbapp.model.Person;

public interface AdminLogic {
	Match addMatch(Match match);
	
	Person updatePerson(Person person);
}
