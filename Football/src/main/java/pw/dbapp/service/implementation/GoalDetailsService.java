package pw.dbapp.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pw.dbapp.model.Person;
import pw.dbapp.repository.GoalDetailsRepository;
import pw.dbapp.repository.PersonRepository;
import pw.dbapp.service.logic.GoalDetailsServiceLogic;
import pw.dbapp.service.logic.PersonLogic;

@Service
public class GoalDetailsService implements GoalDetailsServiceLogic {

	@Autowired
	private GoalDetailsRepository goalDetailsRepository;
	
	@Override
	public List<Person> getBestScorers() {
		List<Person> persons = goalDetailsRepository.findBestScorers();
		return persons;
	}


}