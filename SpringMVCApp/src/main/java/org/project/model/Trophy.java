package org.project.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

@Entity
public class Trophy {

	@Id
	@Pattern(regexp = "[1-9][0-9]{3}/[1-9][0-9]{3}")
	private String season;
	private int winnerId;
	private String LeagueId;

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public int getWinnerId() {
		return winnerId;
	}

	public void setWinnerId(int winnerId) {
		this.winnerId = winnerId;
	}

	public String getLeagueId() {
		return LeagueId;
	}

	public void setLeagueId(String leagueId) {
		LeagueId = leagueId;
	}
}
