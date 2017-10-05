package org.project.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.project.model.Match;
import org.project.model.Team;
import org.project.service.Service;
import org.springframework.orm.hibernate5.SessionFactoryUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/matches")
public class MatchController implements Service {
	
	@ModelAttribute
	public void addCommonObjects(Model model) {
		model.addAttribute("name", "WebApp based on Spring MVC Framework by Eryk Samulak");
	}

	@Override
	@GetMapping("/new")
	public ModelAndView getAll(@PathVariable Map<String, String> variables) {
		ModelAndView modelAndView = new ModelAndView("matchForm");
		return modelAndView;
	}
	
	@PostMapping
	public ModelAndView addMatch(@ModelAttribute Match match) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
			match.setId(1);
			session.save(match);
		session.getTransaction().commit();
		session.close();
		ModelAndView modelAndView = new ModelAndView("match");
		return modelAndView;
	}
}
