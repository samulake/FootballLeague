package org.project.model;

import java.util.Date;
import java.util.Set;

<<<<<<< HEAD
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity(name = "teams")
public class Team {
	@Id @GeneratedValue
	private int id;
	private String name;

	private Set<Person> players;

	private int yearOfFoundation;

	private int coachId;

	public Team(String name, Set<Person> players, int yearOfFoundation) {
		this.name = name;
		this.players = players;
		this.yearOfFoundation = yearOfFoundation;
	}

	public Team() {
	}

	@Id @GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Size(min = 3, max = 50)
	@Pattern(regexp = "[a-zA-Z0-9 ]+")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Person> getPlayers() {
		return players;
	}

	public void setPlayers(Set<Person> players) {
		this.players = players;
	}

	public int getYearOfFoundation() {
		return yearOfFoundation;
	}

	public void setYearOfFoundation(int yearOfFoundation) {
		this.yearOfFoundation = yearOfFoundation;
	}

	public int getCoachId() {
		return coachId;
	}

	public void setCoachId(int coachId) {
		this.coachId = coachId;
=======
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
>>>>>>> branch 'master' of https://signaturerecognition.visualstudio.com/_git/Football
	}
}
