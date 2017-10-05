package org.project.model;

public class Country {
	String abbreviation;
	String name;

	public Country() {
	}

	public Country(String abbreviation, String name) {
		super();
		this.abbreviation = abbreviation;
		this.name = name;
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
