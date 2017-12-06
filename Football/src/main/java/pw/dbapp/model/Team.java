package pw.dbapp.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.ToString;

@Entity(name="teams")
@Table(name="teams")
@Data
@ToString(exclude={"stadium", "league", "squad"})
@JsonIgnoreProperties(value={"stadium", "league", "squad"})
public class Team {
	@Id @GeneratedValue
	private Long id;
	private String name;
	@OneToOne
	@JoinColumn(name="stadium_id")
	private Stadium stadium;
	@ManyToOne
	@JoinColumn(name="league_id")
	private League league;
	@OneToMany
	@JoinTable(
		name="squads",
		joinColumns=@JoinColumn(
			name="team_id",
			foreignKey=@ForeignKey(name="FK_squads_teams")),
		inverseJoinColumns=@JoinColumn(
			name="person_id",
			foreignKey=@ForeignKey(name="FK_squads_people"))
	)
	private List<Person> squad;

}