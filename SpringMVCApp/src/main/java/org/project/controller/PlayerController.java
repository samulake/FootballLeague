package org.project.controller;

import javax.validation.Valid;

import org.project.model.Player;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/players")
public class PlayerController {
	
	@GetMapping("/new")
	public String getPlayerForm() {
		return "playerForm";
	}
	
	@PostMapping("/new")
	public ModelAndView createPlayer(@Valid @ModelAttribute Player player, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView("player");
		if(result.hasErrors()) {
			modelAndView.setViewName("playerForm");
			return modelAndView;
		}
		boolean playerInserted = insertPlayerIntoDatabase(player);
		if(playerInserted) {
			//modelAndView.addObject("player", player);
		}
		return modelAndView;
	}

	private boolean insertPlayerIntoDatabase(Player player) {
		return true;
	}
	
	
}
