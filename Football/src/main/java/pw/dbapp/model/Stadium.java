package pw.dbapp.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

import lombok.Data;

@Entity
@Table(name="stadiums")
@Data
public class Stadium {
	@Id @GeneratedValue
	private Long id;
	@Expose
	private String name;

	public Stadium(){

	}

	public void finalize() throws Throwable {

	}

}