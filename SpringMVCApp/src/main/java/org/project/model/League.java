package org.project.model;

import javax.persistence.Id;

public class League {
	@Id
	private String countryId;
	private String name;

	public String getCountryId() {
		return countryId;
	}

	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
