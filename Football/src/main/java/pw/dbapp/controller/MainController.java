package pw.dbapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@GetMapping("/home")
	public String showHomePage() {
		return "home";
	}
	
	@GetMapping("/leagues")
	public String showLeagues() {
		return "leagues";
	}
	
	@GetMapping("/persons")
	public String showPersons() {
		return "persons";
	}
	
	@GetMapping("/bestScorers")
	public String showBestScorers() {
		return "bestscorers";
	}
	
	@GetMapping("/bestAssistants")
	public String showBestAssistants() {
		return "bestassistants";
	}
	
	@GetMapping("/bestGoalkeepers")
	public String showBestGoalkeepers() {
		return "bestgoalkeepers";
	}
	
	@GetMapping("/addMatch")
	public String showAddMatch() {
		return "addmatch";
	}
	
	@GetMapping("/makeTransfer")
	public String showMakeTransfer() {
		return "maketransfer";
	}
	
	@GetMapping("/leagues/{leagueId}")
	public String showLeague() {
		return "league";
	}
}
