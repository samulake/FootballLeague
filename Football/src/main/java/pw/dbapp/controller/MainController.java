package pw.dbapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class MainController {
	
	@GetMapping
	public String showHomePage() {
		return "home";
	}
	
	@GetMapping("/leagues")
	public String showLeagues() {
		return "leagues";
	}
	
}
