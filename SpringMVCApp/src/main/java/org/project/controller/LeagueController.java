package org.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LeagueController {
	
	@GetMapping(path="/leagues")
	public String showLeagues() {
		return "leagues";
	}
}
