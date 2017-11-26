package pw.dbapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="goals_details")
@Data
public class GoalDetails {
	@Id @GeneratedValue
	private Long id;
	@ManyToOne
	private Match match;
	@ManyToOne
	private Person scorer;
	@ManyToOne
	private Person assistant;
	@ManyToOne
	private Person goalkeeper;
	@ManyToOne
	private Team forTeam;
	@ManyToOne
	private Team againstTeam;
	
	public GoalDetails(){

	}

	public void finalize() throws Throwable {

	}
}