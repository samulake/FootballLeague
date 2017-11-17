package pw.dbapp.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.Getter;

@Entity
@Table(name="leagues")
@Data
@JsonIgnoreProperties("teams")
public class League {
	@Id @GeneratedValue
	private Long id;
	private String name;
	
	@OneToMany(mappedBy="league")
	private List<Team> teams;

	public League(){

	}

	public void finalize() throws Throwable {

	}

}