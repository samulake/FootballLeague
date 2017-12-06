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

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.gson.annotations.Expose;

import lombok.Data;
import lombok.ToString;

@Entity(name="teams")
@Table(name="teams")
@Data
@ToString(exclude={"stadium", "league"})
@JsonIgnoreProperties(value={"stadium", "league"})
public class Team {
	@Id @GeneratedValue @Expose
	private Long id;
	@Expose
	private String name;
	@OneToOne
	@JoinColumn(name="stadium_id")
	private Stadium stadium;
	@ManyToOne
	@JoinColumn(name="league_id")
	private League league;

}