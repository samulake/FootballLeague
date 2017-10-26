package pw.dbapp.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
@Entity
@Table(name="database_error_log")
@Data
public class DatabaseErrorLog {
	@Id @GeneratedValue
	private Long id;
	private Date errorOccurred;
	private String description;

	public DatabaseErrorLog(){

	}

	public void finalize() throws Throwable {

	}

}