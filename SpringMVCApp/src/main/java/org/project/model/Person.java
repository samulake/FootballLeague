package org.project.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

import org.project.validation.IsValidCountryAbbreviation;

@Entity(name = "person")
public class Person {
	@Id
	private long id;
	@Pattern(regexp="[A-Z][a-z]*")
	private String name;
	@Pattern(regexp="[A-Z][a-z]*")
	private String surname;
	@IsValidCountryAbbreviation
	private String countryAbbreviation;
	private int jobId;

	public Person() {
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

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
}
