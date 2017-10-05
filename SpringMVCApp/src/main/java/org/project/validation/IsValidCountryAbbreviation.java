package org.project.validation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Documented
@Constraint(validatedBy=CountryAbbreviationValidator.class)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface IsValidCountryAbbreviation {
	
	int countryAbbreviationLength() default 2;
	
	String message() default "Invalid country abbreviation";
	
	Class<?>[] groups() default {};
	
	Class<? extends Payload>[] payload() default {};
}
