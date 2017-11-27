package pw.dbapp.controller.logic;

import java.util.List;

import pw.dbapp.model.GoalDetails;
import pw.dbapp.model.Match;
import pw.dbapp.model.Person;
import pw.dbapp.model.Transfer;

public interface AdminLogic {
	
	Person updatePerson(Person person);

	Match addMatchDetails(Long matchId, Match match);
	
	void makeTransfer(Transfer transfer);
}
