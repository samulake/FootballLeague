package pw.dbapp.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.ToString;

@Entity
@Table(name="leagues")
@Data
@ToString(exclude={"teams"})
public class League {
	@Id @GeneratedValue
	private Long id;
	private String name;
	
	/*@OneToOne
	@JoinColumn(name="id")
	private League parentLeague;
	
	@OneToOne(mappedBy="parentLeague")
	private League childLeague;*/
	
	@Column(name="max_teams_number")
	private int maxTeamsNumber;
	
	@Column(name="relegated_teams_number")
	private int relegatedTeamsNumber;

	public League(){

	}

	public void finalize() throws Throwable {

	}

}