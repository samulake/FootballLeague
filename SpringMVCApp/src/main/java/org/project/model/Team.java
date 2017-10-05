package org.project.model;

import java.util.Date;
import java.util.Set;

import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

//import com.fasterxml.jackson.annotation.JsonInclude;

/*@JsonInclude(JsonInclude.Include.NON_NULL)*/
public class Team {
	@Size(min=10, max=50)
	@Pattern(regexp="[a-zA-Z0-9 ]+")
	private String name;
	private Set<Player> players;
	@Past
	private Date founded;

	public Team(String name, Set<Player> players, Date founded) {
		this.name = name;
		this.players = players;
		this.founded = founded;
	}

	public Team() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Player> getPlayers() {
		return players;
	}

	public void setPlayers(Set<Player> players) {
		this.players = players;
	}

	public Date getFounded() {
		return founded;
	}

	public void setFounded(Date founded) {
		this.founded = founded;
	}
}
