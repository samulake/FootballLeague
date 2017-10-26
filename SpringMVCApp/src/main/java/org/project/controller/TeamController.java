package org.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.project.model.Team;
import org.project.properties.TeamNameEditor;
import org.project.service.Service;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/teams")
public class TeamController implements Service {
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd.mm.yyyy");
		dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
		dataBinder.registerCustomEditor(String.class, "name", new TeamNameEditor());
	}
	
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String createTeamForm(@ModelAttribute Team team) {
		return "teamForm";
	}

	@Override
	@RequestMapping("/all")
	public ModelAndView getAll(Map<String, String> variables) {
		// TODO Auto-generated method stub
		return null;
	}

	@RequestMapping(value="/new", method=RequestMethod.POST)
	public ModelAndView createTeam(@Valid @ModelAttribute("team") Team team, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView("team");
<<<<<<< HEAD

		return modelAndView;
=======
		if(result.hasErrors()) {
			modelAndView.setViewName("teamForm");
			//modelAndView.addObject("team", team);
			return modelAndView;
		}
		List<Team> teams = storage();
		teams.add(team);
			
		return modelAndView;
	}

	public List<Team> storage() {
		List<Team> teams = new ArrayList<>();
		teams.add(new Team("Team 1", null, new Date()));
		teams.add(new Team("Team 2", null, new Date()));
		teams.add(new Team("Team 3", null, new Date()));

		return teams;
>>>>>>> branch 'master' of https://signaturerecognition.visualstudio.com/_git/Football
	}

}
