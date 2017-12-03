package pw.dbapp.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="jobs")
@Data
@Getter
@Setter
public class Job {
	@Id @GeneratedValue
	private Long id;
	private String name;
	@OneToOne
	@JoinColumn(name="parent_job_id")
	public Job parentJob;

	public Job(){

	}

	public void finalize() throws Throwable {

	}

}