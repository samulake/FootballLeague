package org.project.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CountryAbbreviationValidator implements ConstraintValidator<IsValidCountryAbbreviation, String> {

	private int countryAbbreviationLength;
	
	@Override
	public void initialize(IsValidCountryAbbreviation constraintAnnotation) {
		countryAbbreviationLength = constraintAnnotation.countryAbbreviationLength();
	}
	
	@Override
	public boolean isValid(String countryAbbreviation, ConstraintValidatorContext context) {
		if(countryAbbreviation == null) {
			return false;
		}
		return countryAbbreviation.length() == countryAbbreviationLength;
	}

}
