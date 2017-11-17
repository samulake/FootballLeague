package pw.dbapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
}
