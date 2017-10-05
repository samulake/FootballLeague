package org.project.model;

import javax.persistence.Entity;

@Entity(name = "squads")
public class Squad {
	private int teamId;
	private int personId;

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public int getPersonId() {
		return personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
	}
}
