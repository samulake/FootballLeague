package pw.dbapp.model.wrapper;

import lombok.Data;

@Data
public class TeamResult {
	private String teamName;
	
	private int points;
	
	private int matchesPlayed;
	
	private int wins;
	
	private int draws;
	
	private int defeats;
	
	private int goalsBalance;
}
