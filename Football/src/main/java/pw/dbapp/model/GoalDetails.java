package pw.dbapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

import lombok.Data;

@Entity
@Table(name="goals_details")
@Data
public class GoalDetails {
	@Id 
	@GeneratedValue 
	@Expose
	private Long id;
	@ManyToOne
	private Match match;
	@ManyToOne
	@Expose
	private Person scorer;
	@ManyToOne
	@Expose
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