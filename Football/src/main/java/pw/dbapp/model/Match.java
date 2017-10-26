package pw.dbapp.model;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="matches")
@Data
public class Match {
	@Id @GeneratedValue
	private Long id;
	@OneToOne
	private League league;

	public Match(){

	}

	public void finalize() throws Throwable {

	}

}