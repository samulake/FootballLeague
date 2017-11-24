package pw.dbapp.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.junit.Ignore;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="people")
@Data
@JsonIgnoreProperties(value={"country"})
public class Person {
	@Id @GeneratedValue
	private Long id;
	private String name;
	private String surname;
	@ManyToOne
	@JoinColumn(name="country_id")
	public Country country;
	@ManyToOne
	private Job job;

	public Person(){

	}

	public void finalize() throws Throwable {

	}

}