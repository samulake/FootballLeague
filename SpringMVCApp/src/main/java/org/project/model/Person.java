package org.project.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.project.validation.IsValidCountryAbbreviation;

@Entity
@Table(name="people")
public class Person {
	
}
