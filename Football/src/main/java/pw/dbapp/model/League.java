package pw.dbapp.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="leagues")
@Data
public class League {
	@Id @GeneratedValue
	private Long id;
	private String name;
	@OneToMany(mappedBy="league")
	private List<Team> team;

	public League(){

	}

	public void finalize() throws Throwable {

	}

}