package org.project.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="countries")
public class Country {
	@Id
	private String abbreviation;
	@Column(unique=true, nullable=false)
	private String name;
	private int continentId;

	public Country() {
	}

	public Country(String abbreviation, String name) {
		super();
		this.abbreviation = abbreviation;
		this.name = name;
	}

	public int getContinentId() {
		return continentId;
	}

	public void setContinentId(int continentId) {
		this.continentId = continentId;
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
