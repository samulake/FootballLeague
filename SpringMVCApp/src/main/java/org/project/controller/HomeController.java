package org.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

@Controller
public class HomeController {

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String getHomePage() {
		return "home";
	}

}
