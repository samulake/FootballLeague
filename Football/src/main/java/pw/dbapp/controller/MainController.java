package pw.dbapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/home")
	public String showHomePage() {
		System.out.println('a');
		return "home";
	}
	
}
