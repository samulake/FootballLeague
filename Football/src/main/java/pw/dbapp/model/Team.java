package pw.dbapp.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="teams")
@Data
public class Team {
	@Id @GeneratedValue
	private Long id;
	private String name;
	@OneToMany
	@JoinColumn(name="person_id")
	private List<Person> squad;
	@OneToOne
	private Stadium stadium;
	@ManyToOne
	@JoinColumn(name="league_iD")
	private League league;

}