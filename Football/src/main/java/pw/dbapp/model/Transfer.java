package pw.dbapp.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="transfers")
@Data
public class Transfer {
	@Id @GeneratedValue
	private Long id;
	@ManyToOne
	private Team fromTeam;
	@ManyToOne
	private Person person;
	@ManyToOne
	private Team toTeam;
	
	private int money;

	public Transfer(){

	}

	public void finalize() throws Throwable {

	}

}