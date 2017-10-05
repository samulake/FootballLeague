package org.project.configuration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.XmlWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/*public class DispatcherServletConfiguration implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext context) throws ServletException {
		XmlWebApplicationContext xmlContext = new XmlWebApplicationContext();
		xmlContext.setConfigLocation("/WEB-INF/dispatcher");
		ServletRegistration.Dynamic registration = context.addServlet("dispatcher", new DispatcherServlet());
		registration.setLoadOnStartup(2);
		registration.addMapping("/test/*");
	}

}*/
