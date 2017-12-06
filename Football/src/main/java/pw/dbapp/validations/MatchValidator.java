package pw.dbapp.validations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import pw.dbapp.model.Match;

public class MatchValidator implements ConstraintValidator<IsValidMatch, Match> {

	@Override
	public void initialize(IsValidMatch arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isValid(Match match, ConstraintValidatorContext arg1) {
		String[] result = match.getResult().split(":");
		int homeTeamGoals = Integer.parseInt(result[0]);
		int visitorTeamGoals = Integer.parseInt(result[1]);
		if(match.getGoals().size() != homeTeamGoals + visitorTeamGoals) {
			return false;
		}
		return true;
	}

}
