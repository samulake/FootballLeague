package pw.dbapp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;

@Entity
@Table(name="league_table")
@Data
public class TeamResults implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue
	private Long id;
	
	@OneToOne
	@JoinColumn(name="team_id")
	private Team team;
	
	private int matchesPlayed;
	
	private int points;
	
	private int wins;
	
	private int draws;
	
	private int defeats;
	
	private int goalsBalance;
}
