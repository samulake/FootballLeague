package org.project.service;

import java.util.Collection;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

public interface Service {
	ModelAndView getAll(Map<String, String> variables);
}
