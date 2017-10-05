package org.project.model;

import org.project.validation.IsValidCountryAbbreviation;

public class Player {
	private long id;
	private String name;
	private String surname;
	@IsValidCountryAbbreviation
	private String countryAbbreviation;

	public Player() {
	}

	public Player(String name, String surname, String countryAbbreviation) {
		super();
		this.name = name;
		this.surname = surname;
		this.countryAbbreviation = countryAbbreviation;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getCountryAbbreviation() {
		return countryAbbreviation;
	}

	public void setCountryAbbreviation(String countryAbbreviation) {
		this.countryAbbreviation = countryAbbreviation;
	}

}
