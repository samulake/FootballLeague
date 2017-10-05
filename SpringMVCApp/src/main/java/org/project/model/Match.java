package org.project.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

/*import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties("id")
@JsonPropertyOrder({"homeTeam", "visitorTeam"})*/

@Entity
@Table(name="matches", schema="dbo")
public class Match {
	@Id
	private int id;
	private Date date;

	private String result;
	private int leagueId;
	
	//@JsonProperty("Home team")
	private int homeTeamId;
	private int visitorTeamId;

	public Match() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getLeagueId() {
		return leagueId;
	}

	public void setLeagueId(int leagueId) {
		this.leagueId = leagueId;
	}

	public int getHomeTeamId() {
		return homeTeamId;
	}

	public void setHomeTeamId(int homeTeamId) {
		this.homeTeamId = homeTeamId;
	}

	public int getVisitorTeamId() {
		return visitorTeamId;
	}

	public void setVisitorTeamId(int visitorTeamId) {
		this.visitorTeamId = visitorTeamId;
	}

	

}
