package pw.dbapp.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="people")
@Data
public class Person {
	@Id @GeneratedValue
	private Long id;
	private String name;
	private String Surname;
	@ManyToOne
	@JoinColumn(name="abbreviation")
	public Country country;
	@ManyToOne
	private Job job;

	public Person(){

	}

	public void finalize() throws Throwable {

	}

}