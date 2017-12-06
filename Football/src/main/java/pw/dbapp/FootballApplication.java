package pw.dbapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.rest.RepositoryRestMvcAutoConfiguration;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication(exclude = RepositoryRestMvcAutoConfiguration.class)
@ImportResource("springBeans.xml")
public class FootballApplication {

	public static void main(String[] args) {
		SpringApplication.run(FootballApplication.class, args);
	}
}
