package org.project.model;

import javax.persistence.Entity;
import javax.persistence.Id;

/*import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties("id")
@JsonPropertyOrder({"homeTeam", "visitorTeam"})*/

@Entity(name="matches")
public class Match {
	@Id
	private long id;
	private String result;
	private long tournamentId;
	
	//@JsonProperty("Home team")
	private long homeTeamId;
	private long visitorTeamId;

	public Match() {}
	
	public Match(String result, long homeTeam, long visitorTeam) {
		this.result = result;
		this.homeTeamId = homeTeam;
		this.visitorTeamId = visitorTeam;
	}
	
	public Match(long id, String result, long tournamentId, long homeTeam, long visitorTeam) {
		this.id = id;
		this.result = result;
		this.tournamentId = tournamentId;
		this.homeTeamId = homeTeam;
		this.visitorTeamId = visitorTeam;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public long getTournamentId() {
		return tournamentId;
	}

	public void setTournamentId(long tournamentId) {
		this.tournamentId = tournamentId;
	}

	public long getHomeTeam() {
		return homeTeamId;
	}

	public void setHomeTeam(long homeTeamId) {
		this.homeTeamId = homeTeamId;
	}

	public long getVisitorTeam() {
		return visitorTeamId;
	}

	public void setVisitorTeam(long visitorTeamId) {
		this.visitorTeamId = visitorTeamId;
	}

}
