package org.project.controller;

import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping(path="home")
	public String setHomeUrl() {
=======
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

@Controller
public class HomeController {

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String getHomePage() {
>>>>>>> branch 'master' of https://signaturerecognition.visualstudio.com/_git/Football
		return "home";
	}

}
