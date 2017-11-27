package pw.dbapp.service.implementation;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import pw.dbapp.model.GoalDetails;
import pw.dbapp.model.Person;
import pw.dbapp.repository.GoalDetailsRepository;
import pw.dbapp.repository.PersonRepository;
import pw.dbapp.service.logic.GoalDetailsServiceLogic;
import pw.dbapp.service.logic.PersonServiceLogic;

@Service
public class GoalDetailsService implements GoalDetailsServiceLogic {

	@Autowired
	private GoalDetailsRepository goalDetailsRepository;
	@Autowired
	private PersonRepository personRepository;
	
	@Override
	public String getBestScorers() {
		List<GoalDetails> goalsDetails = goalDetailsRepository.findAll();
		ArrayList<ArrayList<Long>> array = new ArrayList<ArrayList<Long>>();

		Iterator<GoalDetails> it = goalsDetails.iterator();

		List<Long> scorers = new ArrayList<>();
		while (it.hasNext()) {
			GoalDetails g = (GoalDetails) it.next();
			if(!scorers.contains(g.getScorer().getId())) {
				scorers.add(g.getScorer().getId());
				array.add(new ArrayList<Long>());
				array.get(scorers.indexOf(g.getScorer().getId())).add(g.getScorer().getId());
				array.get(scorers.indexOf(g.getScorer().getId())).add(new Long(1));
				array.get(scorers.indexOf(g.getScorer().getId())).add(new Long(0));
			} else {
				array.get(scorers.indexOf(g.getScorer().getId())).set(1, array.get(scorers.indexOf(g.getScorer().getId())).get(1) + 1);
			}
			if(!scorers.contains(g.getAssistant().getId())) {
				scorers.add(g.getAssistant().getId());
				array.add(new ArrayList<Long>());
				array.get(scorers.indexOf(g.getAssistant().getId())).add(g.getAssistant().getId());
				array.get(scorers.indexOf(g.getAssistant().getId())).add(new Long(0));
				array.get(scorers.indexOf(g.getAssistant().getId())).add(new Long(1));
			} else {
				array.get(scorers.indexOf(g.getAssistant().getId())).set(2, array.get(scorers.indexOf(g.getAssistant().getId())).get(2) + 1);
			}
		}

		array.removeIf(i -> i.get(1).longValue() == 0);

		Collections.sort(array, new Comparator<ArrayList<Long>>() {    
			@Override
			public int compare(ArrayList<Long> o1, ArrayList<Long> o2) {
				int res = o2.get(1).compareTo(o1.get(1));
				if (res == 0)
					res = o2.get(2).compareTo(o1.get(2));
				return res;
			}  
			}
	    );
		
		ArrayList<Scorer> bestScorers = new ArrayList<>();
		
		Iterator<ArrayList<Long>> ait = array.iterator();
		int i = 0;
		
		while (ait.hasNext()) {
			List<Long> list = ait.next();
			bestScorers.add(new Scorer(++i, personRepository.getPersonById(list.get(0)).getName(), personRepository.getPersonById(list.get(0)).getSurname(), list.get(1), list.get(2) ));
		}
		
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		String json = gson.toJson(bestScorers);
		return json;
	}

	
	private class Scorer {
		private int place;
		private String name;
		private String surname;
		private Long goalsScored;
		private Long assistsMade;
		
		public Scorer(int place, String name, String surname, Long goalsScored, Long assistsMade) {
			this.place = place;
			this.name = name;
			this.surname = surname;
			this.goalsScored = goalsScored;
			this.assistsMade = assistsMade;
		}
	}
	
	
	
	@Override
	public String getBestAssistants() {
		List<GoalDetails> goalsDetails = goalDetailsRepository.findAll();
		ArrayList<ArrayList<Long>> array = new ArrayList<ArrayList<Long>>();

		Iterator<GoalDetails> it = goalsDetails.iterator();

		List<Long> assistants = new ArrayList<>();
		while (it.hasNext()) {
			GoalDetails g = (GoalDetails) it.next();
			if(!assistants.contains(g.getAssistant().getId())) {
				assistants.add(g.getAssistant().getId());
				array.add(new ArrayList<Long>());
				array.get(assistants.indexOf(g.getAssistant().getId())).add(g.getAssistant().getId());
				array.get(assistants.indexOf(g.getAssistant().getId())).add(new Long(1));
			} else {
				array.get(assistants.indexOf(g.getAssistant().getId())).set(1, array.get(assistants.indexOf(g.getAssistant().getId())).get(1) + 1);
			}
		}

		Collections.sort(array, new Comparator<ArrayList<Long>>() {    
			@Override
			public int compare(ArrayList<Long> o1, ArrayList<Long> o2) {
				return o2.get(1).compareTo(o1.get(1));
			}  
			}
	    );
		
		ArrayList<Assistant> bestAssistants = new ArrayList<>();
		
		Iterator<ArrayList<Long>> ait = array.iterator();
		int i = 0;
		
		while (ait.hasNext()) {
			List<Long> list = ait.next();
			bestAssistants.add(new Assistant(++i, personRepository.getPersonById(list.get(0)).getName(), personRepository.getPersonById(list.get(0)).getSurname(), list.get(1) ));
		}
		
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		String json = gson.toJson(bestAssistants);
		return json;
	}

	private class Assistant {
		private int place;
		private String name;
		private String surname;
		private Long assistsMade;
		
		public Assistant(int place, String name, String surname, Long assistsMade) {
			this.place = place;
			this.name = name;
			this.surname = surname;
			this.assistsMade = assistsMade;
		}
	}
	
}