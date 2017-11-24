package pw.dbapp.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;

@Entity(name="teams")
@Table(name="teams")
@Data
@ToString(exclude={"stadium", "league"})
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

}