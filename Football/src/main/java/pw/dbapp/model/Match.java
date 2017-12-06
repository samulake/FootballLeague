package pw.dbapp.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;
import pw.dbapp.validations.IsValidMatch;

@Entity
@Table(name="matches")
@Data
@ToString(exclude={"homeTeam", "league", "visitorTeam", "goals"})
@IsValidMatch
public class Match {
	@Id @GeneratedValue
	private Long id;
	@OneToOne
	@JoinColumn(name="league_id")
	private League league;

	@ManyToOne
	@JoinColumn(name="home_team_id")
	private Team homeTeam;
	
	@ManyToOne
	@JoinColumn(name="visitor_team_id")
	private Team visitorTeam;
	
	@ManyToOne
	@JoinColumn(name="stadium_id")
	private Stadium stadium;
	
	private Date dateTime;
	
	@OneToMany(mappedBy="match")
	private List<GoalDetails> goals;
	
	private String result;

}